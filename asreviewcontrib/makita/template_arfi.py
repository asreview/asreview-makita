"""Render ARFI template."""

import numpy as np
from asreview import config as ASREVIEW_CONFIG
from asreview.data import ASReviewData

from asreviewcontrib.makita.template_base import TemplateBase


class TemplateARFI(TemplateBase):
    template_file = "template_arfi.txt.template"

    def __init__(
        self,
        classifier,
        feature_extractor,
        query_strategy,
        n_priors,
        **kwargs,
    ):
        self.classifier = classifier
        self.feature_extractor = feature_extractor
        self.query_strategy = query_strategy
        self.n_priors = n_priors
        super().__init__(**kwargs)

    def get_dataset_specific_params(self, index, fp_dataset):
        """Prepare dataset-specific parameters. These parameters are provided to the
        template once for each dataset."""

        n_priors = self.n_priors if self.n_priors is not None else 10

        priors = _get_priors(
            fp_dataset, init_seed=self.init_seed + index, n_priors=n_priors
        )
        return {
            "input_file": fp_dataset.as_posix(),
            "input_file_stem": fp_dataset.stem,
            "priors": priors,
            "model_seed": self.model_seed + index,
        }

    def get_template_specific_params(self, params):
        """Prepare template-specific parameters. These parameters are provided to the
        template only once."""

        # set default values if not provided
        classifier = self.classifier if self.classifier is not None else ASREVIEW_CONFIG.DEFAULT_MODEL # noqa: E501
        feature_extractor = self.feature_extractor if self.feature_extractor is not None else ASREVIEW_CONFIG.DEFAULT_FEATURE_EXTRACTION # noqa: E501
        query_strategy = self.query_strategy if self.query_strategy is not None else ASREVIEW_CONFIG.DEFAULT_QUERY_STRATEGY # noqa: E501
        balance_strategy = self.balance_strategy if self.balance_strategy is not None else ASREVIEW_CONFIG.DEFAULT_BALANCE_STRATEGY # noqa: E501

        return {
            "datasets": params,
            "skip_wordclouds": self.skip_wordclouds,
            "classifier": classifier,
            "feature_extractor": feature_extractor,
            "query_strategy": query_strategy,
            "balance_strategy": balance_strategy,
            "instances_per_query": self.instances_per_query,
            "stop_if": self.stop_if,
            "init_seed": self.init_seed,
            "output_folder": self.output_folder,
            "scripts_folder": self.scripts_folder,
            "version": self.__version__,
        }


def _get_priors(dataset, init_seed, n_priors):
    """Sample priors."""
    asdata = ASReviewData.from_file(dataset)
    relevant_record_ids = asdata.record_ids[asdata.labels == 1]
    relevant_irrecord_ids = asdata.record_ids[asdata.labels == 0]

    if len(relevant_record_ids) == 0:
        raise ValueError("Not enough relevant records found.")
    if len(relevant_irrecord_ids) == 0:
        raise ValueError("Not enough irrelevant records found.")

    np.random.seed(init_seed)

    # sample n_priors irrelevant records
    prior_irrelevant = list(
        np.random.choice(relevant_irrecord_ids, n_priors, replace=False)
    )

    priors = []

    for incl in list(relevant_record_ids):
        priors_list = [incl] + prior_irrelevant
        priors.append(list(map(str, priors_list)))

    return priors

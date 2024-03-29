"""Render ARFI template."""

import numpy as np
from asreview.data import ASReviewData

from asreviewcontrib.makita.template_base import RenderTemplateBase


class RenderJobsARFI(RenderTemplateBase):
    template_name = "arfi"

    def __init__(self, *args, **kwargs):
        self.n_runs = kwargs.pop('n_runs', 1)
        self.classifier = kwargs.pop('classifier', "nb")
        self.feature_extractor = kwargs.pop('feature_extractor', "tfidf")
        self.n_priors = kwargs.pop('n_priors', 10)
        super().__init__(*args, **kwargs)

    def get_dynamic_params(self, index, fp_dataset):
        """Prepare dataset-specific parameters. These parameters are provided to the
        template once for each dataset."""

        priors = _get_priors(fp_dataset,
                             init_seed=self.init_seed + index,
                             n_priors=self.n_priors)
        return {
            "input_file": fp_dataset.as_posix(),
            "input_file_stem": fp_dataset.stem,
            "priors": priors,
            "model_seed": self.model_seed + index,
        }

    def get_static_params(self, params):
        """Prepare template-specific parameters. These parameters are provided to the
        template only once."""

        return {
            "datasets": params,
            "create_wordclouds": self.create_wordclouds,
            "classifier": self.classifier,
            "feature_extractor": self.feature_extractor,
            "query_strategy": self.query_strategy,
            "balance_strategy": self.balance_strategy,
            "instances_per_query": self.instances_per_query,
            "stop_if": self.stop_if,
            "init_seed": self.init_seed,
            "output_folder": self.output_folder,
            "scripts_folder": self.scripts_folder,
            "platform": self.platform_sys,
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

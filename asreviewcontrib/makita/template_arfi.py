"""Render ARFI template."""

from pathlib import Path

import numpy as np
from asreview import load_dataset

from asreviewcontrib.makita.template_base import TemplateBase
from asreviewcontrib.makita.utils import get_default_settings


class TemplateARFI(TemplateBase):
    template_file = "template_arfi.txt.template"

    def __init__(
        self,
        classifier,
        feature_extractor,
        querier,
        balancer,
        n_priors,
        **kwargs,
    ):
        self.classifier = classifier
        self.feature_extractor = feature_extractor
        self.querier = querier
        self.balancer = balancer
        self.n_priors = n_priors
        super().__init__(**kwargs)

    def get_dataset_specific_params(self, index, fp_dataset):
        """Prepare dataset-specific parameters. These parameters are provided to the
        template once for each dataset."""

        n_priors = self.n_priors if self.n_priors is not None else 10

        priors = _get_priors(
            fp_dataset, prior_seed=self.prior_seed + index, n_priors=n_priors
        )
        return {
            "input_file": f"{fp_dataset.parent.name}/{fp_dataset.name}",
            "input_file_stem": fp_dataset.stem,
            "priors": priors,
            "model_seed": self.model_seed + index,
        }

    def get_template_specific_params(self, params):
        """Prepare template-specific parameters. These parameters are provided to the
        template only once."""

        defaults = get_default_settings()

        classifier = (
            self.classifier if self.classifier is not None else defaults["classifier"]
        )
        feature_extractor = (
            self.feature_extractor
            if self.feature_extractor is not None
            else defaults["feature_extractor"]
        )
        querier = self.querier if self.querier is not None else defaults["querier"]
        balancer = self.balancer

        return {
            "datasets": params,
            "classifier": classifier,
            "feature_extractor": feature_extractor,
            "querier": querier,
            "balancer": balancer,
            "n_query": self.n_query,
            "n_stop": self.n_stop,
            "prior_seed": self.prior_seed,
            "output_folder": self.paths.output_folder,
            "scripts_folder": self.paths.scripts_folder,
            "version": self.__version__,
        }


def _get_priors(dataset, prior_seed, n_priors):
    """Sample priors."""
    try:
        df = load_dataset(dataset, dataset_id=Path(dataset).name).get_df()
    except Exception as e:
        raise RuntimeError(f"Failed importing the dataset using asreview: {e}") from e

    relevant_record_ids = df.record_id[df.included == 1]
    relevant_irrecord_ids = df.record_id[df.included == 0]

    if len(relevant_record_ids) == 0:
        raise ValueError("No relevant records found.")
    if len(relevant_irrecord_ids) == 0:
        raise ValueError("No irrelevant records found.")

    np.random.seed(prior_seed)

    prior_irrelevant = list(
        np.random.choice(relevant_irrecord_ids, n_priors, replace=False)
    )

    priors = []

    for incl in list(relevant_record_ids):
        priors_list = [incl] + prior_irrelevant
        priors.append(list(map(str, priors_list)))

    return priors

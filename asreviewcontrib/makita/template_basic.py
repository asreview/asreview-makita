"""Render basic template."""

from asreviewcontrib.makita.template_base import TemplateBase
from asreviewcontrib.makita.utils import get_default_settings


class TemplateBasic(TemplateBase):
    template_file = "template_basic.txt.template"

    def __init__(
        self,
        classifier,
        feature_extractor,
        querier,
        balancer,
        n_runs,
        **kwargs,
    ):
        self.classifier = classifier
        self.feature_extractor = feature_extractor
        self.querier = querier
        self.balancer = balancer
        self.n_runs = n_runs
        super().__init__(**kwargs)

    def get_dataset_specific_params(self, index, fp_dataset):
        """Prepare dataset-specific parameters. These parameters are provided to the
        template once for each dataset."""

        return {
            "input_file": f"{fp_dataset.parent.name}/{fp_dataset.name}",
            "input_file_stem": fp_dataset.stem,
            "model_seed": self.model_seed + index,
            "prior_seed": self.prior_seed,
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

        n_runs = self.n_runs if self.n_runs is not None else 1

        return {
            "classifier": classifier,
            "feature_extractor": feature_extractor,
            "querier": querier,
            "balancer": balancer,
            "n_runs": n_runs,
            "datasets": params,
            "n_query": self.n_query,
            "n_stop": self.n_stop,
            "output_folder": self.paths.output_folder,
            "scripts_folder": self.paths.scripts_folder,
            "version": self.__version__,
        }

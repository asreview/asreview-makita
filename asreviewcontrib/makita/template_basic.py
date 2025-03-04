"""Render basic template."""

from asreviewcontrib.makita.template_base import TemplateBase
from asreviewcontrib.makita.utils import get_default_settings


class TemplateBasic(TemplateBase):
    template_file = "template_basic.txt.template"

    def __init__(
        self,
        classifier,
        feature_extractor,
        query_strategy,
        n_runs,
        **kwargs,
    ):
        self.classifier = classifier
        self.feature_extractor = feature_extractor
        self.query_strategy = query_strategy
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
            self.classifier
            if self.classifier is not None 
            else defaults["classifier"]
        )
        feature_extractor = (
            self.feature_extractor
            if self.feature_extractor is not None
            else defaults["feature_extractor"]
        )
        query_strategy = (
            self.query_strategy
            if self.query_strategy is not None
            else defaults["query_strategy"]
        )
        balance_strategy = (
            self.balance_strategy
            if self.balance_strategy is not None
            else defaults["balance_strategy"]
        )

        n_runs = self.n_runs if self.n_runs is not None else 1

        return {
            "classifier": classifier,
            "feature_extractor": feature_extractor,
            "query_strategy": query_strategy,
            "balance_strategy": balance_strategy,
            "n_runs": n_runs,
            "datasets": params,
            "skip_wordclouds": self.skip_wordclouds,
            "n_query": self.n_query,
            "n_stop": self.n_stop,
            "output_folder": self.paths.output_folder,
            "scripts_folder": self.paths.scripts_folder,
            "version": self.__version__,
        }

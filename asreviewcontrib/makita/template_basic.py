"""Render basic template."""

from asreviewcontrib.makita.template_base import TemplateBase


class TemplateBasic(TemplateBase):
    template_name = ["basic"]
    template_file = "template_basic.txt.template"

    def __init__(
        self,
        classifier,
        feature_extractor,
        query_strategy,
        n_runs,
        **kwargs,
    ):
        if classifier is None:
            classifier = "nb"
        if feature_extractor is None:
            feature_extractor = "tfidf"
        if query_strategy is None:
            query_strategy = "max"
        if n_runs is None:
            n_runs = 1

        self.classifier = classifier
        self.feature_extractor = feature_extractor
        self.query_strategy = query_strategy
        self.n_runs = n_runs
        super().__init__(**kwargs)

    def get_dynamic_params(self, index, fp_dataset):
        """Prepare dataset-specific parameters. These parameters are provided to the
        template once for each dataset."""

        return {
            "input_file": fp_dataset.as_posix(),
            "input_file_stem": fp_dataset.stem,
            "model_seed": self.model_seed + index,
            "init_seed": self.init_seed,
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
            "output_folder": self.output_folder,
            "n_runs": self.n_runs,
            "scripts_folder": self.scripts_folder,
            "version": self.__version__,
        }

"""Render basic template."""

from asreviewcontrib.makita.template_base import RenderTemplateBase


class RenderJobsBasic(RenderTemplateBase):
    template_name = "basic"

    def __init__(self, *args, **kwargs):
        self.n_runs = kwargs.pop('n_runs', 1)
        self.classifier = kwargs.pop('classifier', "nb")
        self.feature_extractor = kwargs.pop('feature_extractor', "tfidf")
        super().__init__(*args, **kwargs)

    def get_dynamic_params(self, index, fp_dataset):
        """Prepare dataset-specific parameters. These parameters are provided to the
        template once for each dataset."""

        return {
            "input_file": fp_dataset.as_posix(),
            "input_file_stem": fp_dataset.stem,
            "model_seed": self.model_seed + index,
            "init_seed": self.init_seed,
            "n_runs": self.n_runs,
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
            "scripts_folder": self.scripts_folder,
            "platform": self.platform_sys,
            "version": self.__version__,
        }

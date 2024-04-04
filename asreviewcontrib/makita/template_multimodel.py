"""Render multimodel template."""

from asreviewcontrib.makita.template_base import TemplateBase


class TemplateMultiModel(TemplateBase):
    template_name = "multimodel"

    def __init__(self, *args, **kwargs):
        self.n_runs = kwargs.pop(
            "n_runs", 1
        )
        self.all_classifiers = kwargs.pop(
            "all_classifiers", ["logistic", "nb", "rf"]
        )
        self.all_feature_extractors = kwargs.pop(
            "all_feature_extractors", ["doc2vec", "sbert", "tfidf"]
        )
        self.all_query_strategies = kwargs.pop(
            "all_query_strategies", ["max"]
        )
        self.impossible_models = kwargs.pop(
            "impossible_models", ["nb,doc2vec", "nb,sbert"]
        )
        super().__init__(*args, **kwargs)

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
            "query_strategy": self.query_strategy,
            "balance_strategy": self.balance_strategy,
            "instances_per_query": self.instances_per_query,
            "stop_if": self.stop_if,
            "output_folder": self.output_folder,
            "n_runs": self.n_runs,
            "scripts_folder": self.scripts_folder,
            "platform": self.platform_sys,
            "version": self.__version__,
            "all_classifiers": self.all_classifiers,
            "all_feature_extractors": self.all_feature_extractors,
            "all_query_strategies": self.all_query_strategies,
            "impossible_models": [i.split(",") for i in self.impossible_models],
        }

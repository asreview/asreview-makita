"""Render multimodel template."""

from asreviewcontrib.makita.template_base import TemplateBase


class TemplateMultiModel(TemplateBase):
    template_name = ["multimodel", "multiple_models", "modelmatrix"]
    template_file = "template_multimodel.txt.template"

    def __init__(
        self,
        n_runs,
        all_classifiers,
        all_feature_extractors,
        all_query_strategies,
        impossible_models,
        **kwargs,
    ):
        if n_runs is None:
            n_runs = 1
        if all_classifiers is None:
            all_classifiers = ["logistic", "nb", "rf"]
        if all_feature_extractors is None:
            all_feature_extractors = ["doc2vec", "sbert", "tfidf"]
        if all_query_strategies is None:
            all_query_strategies = ["max"]
        if impossible_models is None:
            impossible_models = ["nb,doc2vec", "nb,sbert"]

        self.n_runs = n_runs
        self.all_classifiers = all_classifiers
        self.all_feature_extractors = all_feature_extractors
        self.all_query_strategies = all_query_strategies
        self.impossible_models = impossible_models
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
            "balance_strategy": self.balance_strategy,
            "instances_per_query": self.instances_per_query,
            "stop_if": self.stop_if,
            "output_folder": self.output_folder,
            "n_runs": self.n_runs,
            "scripts_folder": self.scripts_folder,
            "version": self.__version__,
            "all_classifiers": self.all_classifiers,
            "all_feature_extractors": self.all_feature_extractors,
            "all_query_strategies": self.all_query_strategies,
            "impossible_models": [i.split(",") for i in self.impossible_models],
        }

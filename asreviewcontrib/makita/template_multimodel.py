"""Render multimodel template."""

from asreview import config as ASREVIEW_CONFIG

from asreviewcontrib.makita.template_base import TemplateBase


class TemplateMultiModel(TemplateBase):
    template_file = "template_multimodel.txt.template"

    def __init__(
        self,
        classifiers,
        feature_extractors,
        query_strategies,
        balance_strategies,
        impossible_models,
        n_runs,
        **kwargs,
    ):
        self.n_runs = n_runs
        self.all_classifiers = classifiers
        self.all_feature_extractors = feature_extractors
        self.all_query_strategies = query_strategies
        self.all_balance_strategies = balance_strategies
        self.impossible_models = impossible_models

        super().__init__(**kwargs)

    def get_dataset_specific_params(self, index, fp_dataset):
        """Prepare dataset-specific parameters. These parameters are provided to the
        template once for each dataset."""

        return {
            "input_file": fp_dataset.as_posix(),
            "input_file_stem": fp_dataset.stem,
            "model_seed": self.model_seed + index,
            "init_seed": self.init_seed,
        }

    def get_template_specific_params(self, params):
        """Prepare template-specific parameters. These parameters are provided to the
        template only once."""

        all_classifiers = self.all_classifiers if self.all_classifiers is not None else ["logistic", "nb", "rf"] # noqa: E501
        all_feature_extractors = self.all_feature_extractors if self.all_feature_extractors is not None else ["doc2vec", "sbert", "tfidf"] # noqa: E501
        all_query_strategies = self.all_query_strategies if self.all_query_strategies is not None else [ASREVIEW_CONFIG.DEFAULT_QUERY_STRATEGY] # noqa: E501
        all_balance_strategies = self.all_balance_strategies if self.all_balance_strategies is not None else [ASREVIEW_CONFIG.DEFAULT_BALANCE_STRATEGY] # noqa: E501
        impossible_models = [i.split(",") for i in self.impossible_models] if self.impossible_models is not None else [['nb', 'doc2vec'], ['nb', 'sbert']] # noqa: E501
        n_runs = self.n_runs if self.n_runs is not None else 1

        return {
            "datasets": params,
            "skip_wordclouds": self.skip_wordclouds,
            "instances_per_query": self.instances_per_query,
            "stop_if": self.stop_if,
            "output_folder": self.output_folder,
            "n_runs": n_runs,
            "scripts_folder": self.scripts_folder,
            "version": self.__version__,
            "all_classifiers": all_classifiers,
            "all_feature_extractors": all_feature_extractors,
            "all_query_strategies": all_query_strategies,
            "all_balance_strategies": all_balance_strategies,
            "impossible_models": impossible_models,
        }

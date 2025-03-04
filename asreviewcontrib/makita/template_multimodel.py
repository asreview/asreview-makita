"""Render multimodel template."""

from asreviewcontrib.makita.template_base import TemplateBase
from asreviewcontrib.makita.utils import get_default_settings


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
            "input_file": f"{fp_dataset.parent.name}/{fp_dataset.name}",
            "input_file_stem": fp_dataset.stem,
            "model_seed": self.model_seed + index,
            "prior_seed": self.prior_seed,
        }

    def get_template_specific_params(self, params):
        """Prepare template-specific parameters. These parameters are provided to the
        template only once."""

        defaults = get_default_settings()

        all_classifiers = (
            self.all_classifiers
            if self.all_classifiers is not None
            else ["nb", "svm"]
        )
        all_feature_extractors = (
            self.all_feature_extractors
            if self.all_feature_extractors is not None
            else ["onehot", "tfidf"]
        )
        all_query_strategies = (
            self.all_query_strategies
            if self.all_query_strategies is not None
            else [defaults["query_strategy"]]
        )
        all_balance_strategies = (
            self.all_balance_strategies
            if self.all_balance_strategies is not None
            else [defaults["balance_strategy"]]
        )
        impossible_models = (
            [i.split(",") for i in self.impossible_models]
            if self.impossible_models is not None
            else [["nb", "doc2vec"], ["nb", "sbert"]]
        )
        n_runs = self.n_runs if self.n_runs is not None else 1

        return {
            "datasets": params,
            "skip_wordclouds": self.skip_wordclouds,
            "n_query": self.n_query,
            "n_stop": self.n_stop,
            "output_folder": self.paths.output_folder,
            "scripts_folder": self.paths.scripts_folder,
            "n_runs": n_runs,
            "version": self.__version__,
            "all_classifiers": all_classifiers,
            "all_feature_extractors": all_feature_extractors,
            "all_query_strategies": all_query_strategies,
            "all_balance_strategies": all_balance_strategies,
            "impossible_models": impossible_models,
        }

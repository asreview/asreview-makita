"""Render modelmatrix template."""

from asreviewcontrib.makita.template_base import TemplateBase


class TemplateModelMatrix(TemplateBase):
    template_file = "template_modelmatrix.txt.template"

    def __init__(
        self,
        classifiers,
        feature_extractors,
        queriers,
        balancers,
        impossible_models,
        n_runs,
        n_prior_included=None,
        n_prior_excluded=None,
        **kwargs,
    ):
        self.n_runs = n_runs
        self.all_classifiers = classifiers
        self.all_feature_extractors = feature_extractors
        self.all_queriers = queriers
        self.all_balancers = balancers
        self.impossible_models = impossible_models
        self.n_prior_included = n_prior_included
        self.n_prior_excluded = n_prior_excluded

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

        all_classifiers = (
            self.all_classifiers if self.all_classifiers is not None else ["nb", "svm"]
        )
        all_feature_extractors = (
            self.all_feature_extractors
            if self.all_feature_extractors is not None
            else ["onehot", "tfidf"]
        )
        all_queriers = self.all_queriers if self.all_queriers is not None else ["max"]
        all_balancers = (
            [
                None if strategy.lower() == "none" else strategy
                for strategy in self.all_balancers
            ]
            if self.all_balancers is not None and len(self.all_balancers) > 0
            else [None, "balanced"]
        )
        impossible_models = (
            [i.split(",") for i in self.impossible_models]
            if self.impossible_models is not None
            else [["nb", "doc2vec"], ["nb", "sbert"]]
        )
        n_runs = self.n_runs if self.n_runs is not None else 1

        return {
            "datasets": params,
            "n_query": self.n_query,
            "n_stop": self.n_stop,
            "output_folder": self.paths.output_folder,
            "scripts_folder": self.paths.scripts_folder,
            "n_runs": n_runs,
            "version": self.__version__,
            "n_prior_included": self.n_prior_included,
            "n_prior_excluded": self.n_prior_excluded,
            "all_classifiers": all_classifiers,
            "all_feature_extractors": all_feature_extractors,
            "all_queriers": all_queriers,
            "all_balancers": all_balancers,
            "impossible_models": impossible_models,
        }

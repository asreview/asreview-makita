"""Render basic template."""

from asreviewcontrib.makita.template_base import TemplateBase


class TemplateBasic(TemplateBase):
    template_file = "template_basic.txt.template"

    def __init__(
        self,
        ai,
        classifier,
        feature_extractor,
        querier,
        balancer,
        n_runs,
        n_prior_included=None,
        n_prior_excluded=None,
        **kwargs,
    ):
        self.ai = ai
        self.classifier = classifier
        self.feature_extractor = feature_extractor
        self.querier = querier
        self.balancer = balancer
        self.n_prior_included = n_prior_included
        self.n_prior_excluded = n_prior_excluded
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

        base_params = {
            "n_runs": self.n_runs if self.n_runs is not None else 1,
            "datasets": params,
            "n_query": self.n_query,
            "n_stop": self.n_stop,
            "n_prior_included": self.n_prior_included,
            "n_prior_excluded": self.n_prior_excluded,
            "output_folder": self.paths.output_folder,
            "scripts_folder": self.paths.scripts_folder,
            "version": self.__version__,
        }

        if self.classifier or self.querier or self.balancer or self.feature_extractor:
            base_params.update(
                {
                    "classifier": self.classifier,
                    "feature_extractor": self.feature_extractor,
                    "querier": self.querier,
                    "balancer": self.balancer,
                }
            )
        else:
            base_params["ais"] = [self.ai] if not isinstance(self.ai, list) else self.ai

        return base_params

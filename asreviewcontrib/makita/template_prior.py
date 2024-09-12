from pathlib import Path

import pandas as pd
from asreview import config as ASREVIEW_CONFIG
from asreview.data import load_data

from asreviewcontrib.makita.template_base import TemplateBase


class TemplatePrior(TemplateBase):
    template_file = "template_prior.txt.template"

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
        self.prior_makita_datasets = []
        super().__init__(**kwargs)

    def get_dataset_specific_params(self, index, fp_dataset):
        """Prepare dataset-specific parameters. These parameters are provided to the
        template once for each dataset."""

        # Load the dataset using load_data
        asreview_data = load_data(fp_dataset)

        # Create a DataFrame with the desired columns: label, abstract, and title
        dataset = pd.DataFrame({
            'label': asreview_data.labels,
            'abstract': asreview_data.abstract,
            'title': asreview_data.title
        })

        # Add the 'makita_priors' column
        if fp_dataset.name.startswith("priors_"):
            dataset["makita_priors"] = 1
            print("Found priors dataset")
        else:
            dataset["makita_priors"] = 0
            print("Found regular dataset")

        # Add the dataset to the list
        self.prior_makita_datasets.append(dataset)

        return {}

    def get_template_specific_params(self, params):
        """Prepare template-specific parameters. These parameters are provided to the
        template only once."""

        classifier = self.classifier if self.classifier is not None else ASREVIEW_CONFIG.DEFAULT_MODEL
        feature_extractor = self.feature_extractor if self.feature_extractor is not None else ASREVIEW_CONFIG.DEFAULT_FEATURE_EXTRACTION
        query_strategy = self.query_strategy if self.query_strategy is not None else ASREVIEW_CONFIG.DEFAULT_QUERY_STRATEGY
        balance_strategy = self.balance_strategy if self.balance_strategy is not None else ASREVIEW_CONFIG.DEFAULT_BALANCE_STRATEGY
        n_runs = self.n_runs if self.n_runs is not None else 1

        print(0)

        combined_dataset = pd.concat(self.prior_makita_datasets, ignore_index=True)

        generated_folder = Path("data/generated")
        generated_folder.mkdir(parents=True, exist_ok=True)

        filepath_with_priors = generated_folder / "dataset_with_priors.csv"
        filepath_without_priors = generated_folder / "dataset_without_priors.csv"

        combined_dataset.to_csv(filepath_with_priors, index=False)
        combined_dataset[combined_dataset["makita_priors"] != 1].to_csv(filepath_without_priors, index=False)  # noqa

        prior_idx = " ".join(map(str, combined_dataset[combined_dataset["makita_priors"] == 1].index.tolist()))  # noqa

        return {
            "classifier": classifier,
            "feature_extractor": feature_extractor,
            "query_strategy": query_strategy,
            "balance_strategy": balance_strategy,
            "n_runs": n_runs,
            "datasets": params,
            "skip_wordclouds": self.skip_wordclouds,
            "instances_per_query": self.instances_per_query,
            "stop_if": self.stop_if,
            "output_folder": self.output_folder,
            "scripts_folder": self.scripts_folder,
            "version": self.__version__,
            "model_seed": self.model_seed,
            "init_seed": self.init_seed,
            "filepath_with_priors": filepath_with_priors,
            "filepath_without_priors": filepath_without_priors,
            "prior_idx": prior_idx
        }
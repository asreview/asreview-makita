import warnings
from pathlib import Path

import pandas as pd
from asreview import config as ASREVIEW_CONFIG
from asreview.data import load_data

from asreviewcontrib.makita.template_base import TemplateBase

# Suppress FutureWarning messages
warnings.simplefilter(action="ignore", category=FutureWarning)


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

        self._prior_dataset_count = self._non_prior_dataset_count = 0

    def get_dataset_specific_params(self, index, fp_dataset):
        """Prepare dataset-specific parameters. These parameters are provided to the
        template once for each dataset."""

        # Load the dataset using load_data
        asreview_data = load_data(fp_dataset)

        # Create a DataFrame with the desired columns: label, abstract, and title
        dataset = pd.DataFrame(
            {
                "title": asreview_data.title,
                "abstract": asreview_data.abstract,
                "label": asreview_data.labels.astype(int),
            }
        )

        # Add the 'makita_priors' column
        if fp_dataset.name.startswith("prior_") or fp_dataset.name.startswith(
            "priors_"
        ):
            dataset["makita_priors"] = 1
            self._prior_dataset_count += 1
        else:
            dataset["makita_priors"] = 0
            self._non_prior_dataset_count += 1

        if -1 in dataset.label.values:
            index = dataset.label[dataset.label.values == -1].index[0]
            raise ValueError(
                f"Dataset {fp_dataset} contains unlabeled record at row {index}.\
                    \nTitle: '{dataset.title[index]}'"
            )

        # Add the dataset to the list
        self.prior_makita_datasets.append(dataset)

        return {}

    def get_template_specific_params(self, params):
        """Prepare template-specific parameters. These parameters are provided to the
        template only once."""

        classifier = (
            self.classifier
            if self.classifier is not None
            else ASREVIEW_CONFIG.DEFAULT_MODEL
        )
        feature_extractor = (
            self.feature_extractor
            if self.feature_extractor is not None
            else ASREVIEW_CONFIG.DEFAULT_FEATURE_EXTRACTION
        )
        query_strategy = (
            self.query_strategy
            if self.query_strategy is not None
            else ASREVIEW_CONFIG.DEFAULT_QUERY_STRATEGY
        )
        balance_strategy = (
            self.balance_strategy
            if self.balance_strategy is not None
            else ASREVIEW_CONFIG.DEFAULT_BALANCE_STRATEGY
        )
        n_runs = self.n_runs if self.n_runs is not None else 1

        # Check if at least one dataset with prior knowledge is present
        if self._prior_dataset_count == 0:
            raise ValueError(
                "At least one dataset with prior knowledge (prefix 'prior_' or \
                    'priors_') is required."
            )

        # Check if at least one dataset without prior knowledge is present
        if self._non_prior_dataset_count == 0:
            raise ValueError(
                "At least one dataset without prior knowledge is required."
            )

        # Print the number of datasets with and without prior knowledge
        print(f"\nTotal datasets with prior knowledge: {self._prior_dataset_count}")
        print(
            f"Total datasets without prior knowledge: {self._non_prior_dataset_count}"
        )

        # Create a directory for generated data if it doesn't already exist
        generated_folder = Path("generated_data")
        generated_folder.mkdir(parents=True, exist_ok=True)

        # Set file paths for datasets with and without prior knowledge
        filepath_with_priors = generated_folder / "dataset_with_priors.csv"
        filepath_without_priors = generated_folder / "dataset_without_priors.csv"

        # Combine all datasets into one DataFrame and remove rows where label is -1
        combined_dataset = pd.concat(self.prior_makita_datasets, ignore_index=True)
        combined_dataset.drop(
            combined_dataset[combined_dataset.label == -1].index, inplace=True
        )

        # Calculate the total number of rows with and without prior knowledge
        total_rows_with_priors = combined_dataset[
            combined_dataset["makita_priors"] == 1
        ].shape[0]
        total_rows_without_priors = combined_dataset[
            combined_dataset["makita_priors"] == 0
        ].shape[0]

        # Print the number of rows with and without prior knowledge
        print(f"Total rows of prior knowledge: {total_rows_with_priors}")
        print(f"Total rows of non-prior knowledge: {total_rows_without_priors}")

        # Save the combined dataset to the appropriate file paths
        combined_dataset.to_csv(filepath_with_priors, 
                                index=True, 
                                index_label='record_id')
        combined_dataset[combined_dataset["makita_priors"] != 1].to_csv(
            filepath_without_priors, 
            index=True,
            index_label='record_id'
        )

        # Create a string of indices for rows with prior knowledge
        prior_idx_list = combined_dataset[
            combined_dataset["makita_priors"] == 1
        ].index.tolist()
        if len(prior_idx_list) != total_rows_with_priors:
            raise ValueError(
                "prior_idx list is not equal in length to rows of prior \
                             knowledge"
            )
        prior_idx = " ".join(map(str, prior_idx_list))

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
            "filepath_with_priors_stem": filepath_with_priors.stem,
            "filepath_without_priors": filepath_without_priors,
            "filepath_without_priors_stem": filepath_without_priors.stem,
            "prior_idx": prior_idx,
        }

import warnings
from pathlib import Path

import pandas as pd
from asreview import load_dataset

from asreviewcontrib.makita.template_base import TemplateBase

# Suppress FutureWarning messages
warnings.simplefilter(action="ignore", category=FutureWarning)


class TemplatePrior(TemplateBase):
    template_file = "template_prior.txt.template"

    def __init__(
        self,
        ai,
        classifier,
        feature_extractor,
        querier,
        balancer,
        n_runs,
        **kwargs,
    ):
        self.ai = ai
        self.classifier = classifier
        self.feature_extractor = feature_extractor
        self.querier = querier
        self.balancer = balancer
        self.n_runs = n_runs
        self.prior_makita_datasets = []
        super().__init__(**kwargs)

        self._prior_dataset_count = self._non_prior_dataset_count = 0

    def get_dataset_specific_params(self, index, fp_dataset):
        """Prepare dataset-specific parameters. These parameters are provided to the
        template once for each dataset."""

        df = load_dataset(fp_dataset, dataset_id=Path(fp_dataset).name).get_df()

        if df["title"].fillna("").apply(lambda x: x.strip()).eq("").all():
            print(f"Warning: {fp_dataset} has no titles.")

        if df["abstract"].fillna("").apply(lambda x: x.strip()).eq("").all():
            print(f"Warning: {fp_dataset} has no abstracts.")

        if not df["included"].isin([None, 1, 0]).all():
            print(
                f"Warning: {fp_dataset} has 'included' column with None values or non-binary values."  # noqa: E501
            )

        # Add the 'makita_priors' column
        if fp_dataset.name.startswith("prior_") or fp_dataset.name.startswith(
            "priors_"
        ):
            df["makita_priors"] = 1
            self._prior_dataset_count += 1
        else:
            df["makita_priors"] = 0
            self._non_prior_dataset_count += 1

        # Add the dataset to the list
        self.prior_makita_datasets.append(df)

        return {}

    def get_template_specific_params(self, params):
        """Prepare template-specific parameters. These parameters are provided to the
        template only once."""

        n_runs = self.n_runs if self.n_runs is not None else 1

        # Check if at least one dataset with custom prior knowledge is present
        if self._prior_dataset_count == 0:
            raise ValueError(
                "At least one dataset with custom prior knowledge (prefix 'prior_' or 'priors_') is required."  # noqa: E501
            )

        # Check if at least one dataset without prior knowledge is present
        if self._non_prior_dataset_count == 0:
            raise ValueError(
                "At least one dataset without prior knowledge is required."
            )

        # Print the number of datasets with custom and without prior knowledge
        print(f"\nDatasets with custom prior knowledge: {self._prior_dataset_count}")
        print(f"Datasets without prior knowledge: {self._non_prior_dataset_count}")

        # Create a directory for generated data if it doesn't already exist
        generated_folder = Path(self.paths.project_folder, "generated_data")
        generated_folder.mkdir(parents=True, exist_ok=True)

        # Set file paths for datasets with custom records for prior knowledge
        # and without pre-set prior knowledge from which a minimal training
        # set of 2 will be selected
        filepath_with_priors = generated_folder / "dataset_custom_priors.csv"
        filepath_without_priors = generated_folder / "dataset_without_priors.csv"

        # Combine all datasets into one DataFrame and remove rows where label is -1
        combined_dataset = pd.concat(self.prior_makita_datasets, ignore_index=True)
        combined_dataset.drop(
            combined_dataset[combined_dataset.included == -1].index, inplace=True
        )

        combined_dataset = combined_dataset[
            ["dataset_id", "title", "abstract", "included", "makita_priors"]
        ]

        combined_dataset.rename(
            columns={"dataset_id": "original_dataset"}, inplace=True
        )

        # Calculate the total number of rows with and without prior knowledge
        total_rows_with_priors = combined_dataset[
            combined_dataset["makita_priors"] == 1
        ].shape[0]
        total_rows_without_priors = combined_dataset[
            combined_dataset["makita_priors"] == 0
        ].shape[0]

        # Print the number of rows with custom and without prior knowledge
        print(f"Total rows of prior knowledge: {total_rows_with_priors}")
        print(f"Total rows of non-prior knowledge: {total_rows_without_priors}")

        # Save the combined dataset to the appropriate file paths
        combined_dataset.to_csv(filepath_with_priors, index=False)
        combined_dataset[combined_dataset["makita_priors"] != 1].to_csv(
            filepath_without_priors, index=False
        )

        # Create a string of indices for rows with custom prior knowledge
        prior_idx_list = combined_dataset[
            combined_dataset["makita_priors"] == 1
        ].index.tolist()
        if len(prior_idx_list) != total_rows_with_priors:
            raise ValueError(
                "prior_idx list is not equal in length to rows of prior \
                             knowledge"
            )
        prior_idx = " ".join(map(str, prior_idx_list))

        base_params = {
            "n_runs": n_runs,
            "datasets": params,
            "n_query": self.n_query,
            "n_stop": self.n_stop,
            "output_folder": self.paths.output_folder,
            "scripts_folder": self.paths.scripts_folder,
            "version": self.__version__,
            "model_seed": self.model_seed,
            "prior_seed": self.prior_seed,
            "filepath_with_priors": f"{filepath_with_priors.parent.name}/{filepath_with_priors.name}",  # noqa: E501
            "filepath_with_priors_stem": filepath_with_priors.stem,
            "filepath_without_priors": f"{filepath_without_priors.parent.name}/{filepath_without_priors.name}",  # noqa: E501
            "filepath_without_priors_stem": filepath_without_priors.stem,
            "prior_idx": prior_idx,
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

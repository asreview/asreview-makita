# Simulation study

*This project was rendered with ASReview-Makita version 0.9.3.dev33+g89c72db.*

This project was rendered from the Makita-prior template. See [asreview/asreview-makita#templates](https://github.com/asreview/asreview-makita#templates) for template rules and formats.

The template is described as: 'Prior comparison simulations template'.

## Installation

This project depends on Python 3.7 or later (python.org/download), and [ASReview](https://asreview.nl/download/). Install the following dependencies to run the simulation and analysis in this project.

```sh
pip install asreview>=1.0 asreview-insights>=1.1.2 asreview-datatools
```

For generating wordclouds, install the following dependencies.

```sh
pip install asreview-wordcloud
```

## Data

The performance on the following datasets is evaluated:

- data\prior_Smid_2020.csv
- data\van_de_Schoot_2018.csv

## Run simulation

To start the simulation, run the following command in the project directory.

```sh
sh jobs.sh
```

## Structure

The following files are found in this project:

    📦Makita
    ├── 📜README.md
    ├── 📜jobs.sh
    ├── 📂data
    │   ├── 📜prior_Smid_2020.csv
    │   ├── 📜van_de_Schoot_2018.csv
    ├── 📂generated_data
    │   ├── 📜dataset_with_priors.csv
    │   ├── 📜dataset_without_priors.csv
    ├── 📂scripts
    │   ├── 📜get_plot.py
    │   ├── 📜merge_descriptives.py
    │   ├── 📜merge_metrics.py
    │   ├── 📜merge_tds.py
    │   └── 📜...
    └── 📂output
        ├── 📂simulation
        |   ├── 📂descriptives
        |   |   ├── 📜data_stats_dataset_with_priors.json
        |   |   └── 📜data_stats_dataset_without_priors.json
        |   ├── 📂state_files
        |   |   ├── 📜sim_with_priors_`x`.asreview
        |   |   ├── 📜sim_without_priors_`x`.asreview
        |   |   └── 📜...
        |   └── 📂metrics
        |       ├── 📜metrics_sim_with_priors_`x`.json
        |       ├── 📜metrics_sim_without_priors_`x`.json
        |       └── 📜...
        ├── 📂tables
        |   ├── 📜data_descriptives.csv
        |   ├── 📜data_descriptives.xlsx
        |   ├── 📜tds_sim_prior_Smid_2020.csv
        |   ├── 📜tds_sim_prior_Smid_2020.xlsx
        |   ├── 📜tds_sim_van_de_Schoot_2018.csv
        |   ├── 📜tds_sim_van_de_Schoot_2018.xlsx
        |   ├── 📜tds_summary.csv
        |   ├── 📜tds_summary.xlsx
        |   ├── 📜metrics_sim_prior_Smid_2020_metrics.csv
        |   ├── 📜metrics_sim_prior_Smid_2020_metrics.xlsx
        |   ├── 📜metrics_sim_van_de_Schoot_2018_metrics.csv
        |   ├── 📜metrics_sim_van_de_Schoot_2018_metrics.xlsx
        |   ├── 📜metrics_summary.csv
        |   └── 📜metrics_summary.xlsx
        └── 📂figures
            ├── 📈wordcloud_dataset_with_priors.png
            ├── 📈wordcloud_dataset_without_priors.png
            ├── 📈wordcloud_irrelevant_dataset_with_priors.png
            ├── 📈wordcloud_relevant_dataset_with_priors.png
            ├── 📈wordcloud_irrelevant_dataset_without_priors.png
            ├── 📈wordcloud_relevant_dataset_without_priors.png
            └── 📈plot_recall_sim.png

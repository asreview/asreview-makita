# Simulation study

*This project was rendered with ASReview-Makita version 0.0.0.*

This project was rendered from the Makita-basic template. See [asreview/asreview-makita#templates](https://github.com/asreview/asreview-makita#templates) for template rules and formats.

The template is described as: 'Basic simulation for N runs'.

## Installation

This project depends on Python 3.7 or later (python.org/download), and [ASReview](https://asreview.nl/download/). Install the following dependencies to run the simulation and analysis in this project.

```sh
pip install asreview>=1.0 asreview-insights>=1.1.2 asreview-datatools
```

If wordcloud images are required, install the following dependencies.

```sh
pip install asreview-wordcloud
```

## Data

The performance on the following datasets is evaluated:

- data/van_de_Schoot_2018.csv
- data/Smid_2020.csv

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
    │   ├── 📜van_de_Schoot_2018.csv
    │   ├── 📜Smid_2020.csv
    ├── 📂scripts
    │   ├── 📜get_plot.py
    │   ├── 📜merge_descriptives.py
    │   ├── 📜merge_metrics.py
    │   ├── 📜merge_tds.py
    │   └── 📜...
    └── 📂output
        ├── 📂simulation
        |   └── 📂van_de_Schoot_2018
        |       ├── 📂descriptives
        |       |   └── 📜data_stats_van_de_Schoot_2018.json
        |       ├── 📂state_files
        |       |   ├── 📜sim_van_de_Schoot_2018_`x`.asreview
        |       |   └── 📜...
        |       └── 📂metrics
        |           ├── 📜metrics_sim_van_de_Schoot_2018_`x`.json
        |           └── 📜...
        |   └── 📂Smid_2020
        |       ├── 📂descriptives
        |       |   └── 📜data_stats_Smid_2020.json
        |       ├── 📂state_files
        |       |   ├── 📜sim_Smid_2020_`x`.asreview
        |       |   └── 📜...
        |       └── 📂metrics
        |           ├── 📜metrics_sim_Smid_2020_`x`.json
        |           └── 📜...
        ├── 📂tables
        |   ├── 📜data_descriptives.csv
        |   ├── 📜data_descriptives.xlsx
        |   ├── 📜tds_sim_van_de_Schoot_2018.csv
        |   ├── 📜tds_sim_van_de_Schoot_2018.xlsx
        |   ├── 📜tds_sim_Smid_2020.csv
        |   ├── 📜tds_sim_Smid_2020.xlsx
        |   ├── 📜tds_summary.csv
        |   ├── 📜tds_summary.xlsx
        |   ├── 📜metrics_sim_van_de_Schoot_2018_metrics.csv
        |   ├── 📜metrics_sim_van_de_Schoot_2018_metrics.xlsx
        |   ├── 📜metrics_sim_Smid_2020_metrics.csv
        |   ├── 📜metrics_sim_Smid_2020_metrics.xlsx
        |   ├── 📜metrics_summary.csv
        |   └── 📜metrics_summary.xlsx
        └── 📂figures
            ├── 📈plot_recall_van_de_Schoot_2018.png
            ├── 📈plot_recall_Smid_2020.png
            ├── 📈wordcloud_van_de_Schoot_2018.png
            ├── 📈wordcloud_relevant_van_de_Schoot_2018.png
            └── 📈wordcloud_irrelevant_van_de_Schoot_2018.png
            ├── 📈wordcloud_Smid_2020.png
            ├── 📈wordcloud_relevant_Smid_2020.png
            └── 📈wordcloud_irrelevant_Smid_2020.png

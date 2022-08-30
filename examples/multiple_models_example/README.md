# Simulation study

*This project was rendered with ASReview-Makita version 0+unknown.*

This project was rendered from the Makita-multiple_models template. See [asreview/asreview-makita#templates](https://github.com/asreview/asreview-makita#templates) for template rules and formats.

The template is described as: 'Basic simulation for every possible combination of selected models'.

## Installation

This project depends on Python 3.7 or later (python.org/download), and [ASReview](https://asreview.nl/download/). Install the following dependencies to run the simulation and analysis in this project.

```sh
pip install asreview asreview-insights asreview-datatools
```

## Data

The performance on the following datasets is evaluated:

- data/ptsd_copy.csv
- data/ptsd.csv

## Run simulation

To start the simulation, run the following command in the project directory.

```sh
sh jobs.sh
```

## structure

The following files are found in this project:

    📦
    ├── 📂data
    │   ├── 📜ptsd_copy.csv
    │   ├── 📜ptsd.csv
    ├── 📂output
    │   ├── 📂simulation
    |   |   └── 📂ptsd_copy
    |   |       ├── 📂descriptives
    |   |       |   ├── 📜data_stats_ptsd_copy.json
    |   |       |   ├── 📜wordcloud_ptsd_copy.png
    |   |       |   ├── 📜wordcloud_relevant_ptsd_copy.png
    |   |       |   └── 📜wordcloud_irrelevant_ptsd_copy.png
    |   |       ├── 📂state_files
    |   |       |   ├── 📜sim_ptsd_copy_`x`.asreview
    |   |       |   └── 📜...
    |   |       ├── 📜metrics_sim_ptsd_copy_`x`.json
    |   |       ├── 📜...
    |   |       └── 📜plot_recall_ptsd_copy.png
    |   |   └── 📂ptsd
    |   |       ├── 📂descriptives
    |   |       |   ├── 📜data_stats_ptsd.json
    |   |       |   ├── 📜wordcloud_ptsd.png
    |   |       |   ├── 📜wordcloud_relevant_ptsd.png
    |   |       |   └── 📜wordcloud_irrelevant_ptsd.png
    |   |       ├── 📂state_files
    |   |       |   ├── 📜sim_ptsd_`x`.asreview
    |   |       |   └── 📜...
    |   |       ├── 📜metrics_sim_ptsd_`x`.json
    |   |       ├── 📜...
    |   |       └── 📜plot_recall_ptsd.png
    │   └── 📂tables
    |       ├── 📜data_descriptives.csv
    |       ├── 📜data_descriptives.xlsx
    |       ├── 📜data_metrics.csv
    |       └── 📜data_metrics.xlsx
    ├── 📂scripts
    │   ├── 📜get_plot.py
    │   ├── 📜merge_descriptives.py
    │   ├── 📜merge_metrics.py
    │   └── 📜...
    ├── 📜jobs.sh
    └── 📜README.md

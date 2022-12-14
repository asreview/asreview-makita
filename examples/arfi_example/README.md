# Simulation study

*This project was rendered with ASReview-Makita version 0.1.1+88.g0103c56.dirty.*

This project was rendered from the Makita-ARFI template. See [asreview/asreview-makita#templates](https://github.com/asreview/asreview-makita#templates) for template rules and formats.

The template is described as: 'All Relevant, Fixed Irrelevant'.

## Installation

This project depends on Python 3.7 or later (python.org/download), and [ASReview](https://asreview.nl/download/). Install the following dependencies to run the simulation and analysis in this project.

```sh
pip install asreview asreview-insights asreview-datatools
```

## Data

The performance on the following datasets is evaluated:

- data/ptsd_again.csv
- data/ptsd.csv

## Run simulation

To start the simulation, run the following command in the project directory.

```sh
sh jobs.sh
```

## structure

The following files are found in this project:

    ๐ฆ
    โโโ ๐data
    โ   โโโ ๐ptsd_again.csv
    โ   โโโ ๐ptsd.csv
    โโโ ๐output
    โ   โโโ ๐simulation
    |   |   โโโ ๐ptsd_again
    |   |       โโโ ๐descriptives
    |   |       |   โโโ ๐data_stats_ptsd_again.json
    |   |       |   โโโ ๐wordcloud_ptsd_again.png
    |   |       |   โโโ ๐wordcloud_relevant_ptsd_again.png
    |   |       |   โโโ ๐wordcloud_irrelevant_ptsd_again.png
    |   |       โโโ ๐state_files
    |   |       |   โโโ ๐sim_ptsd_again_`x`.asreview
    |   |       |   โโโ ๐...
    |   |       โโโ ๐metrics_sim_ptsd_again_`x`.json
    |   |       โโโ ๐...
    |   |       โโโ ๐plot_recall_ptsd_again.png
    |   |   โโโ ๐ptsd
    |   |       โโโ ๐descriptives
    |   |       |   โโโ ๐data_stats_ptsd.json
    |   |       |   โโโ ๐wordcloud_ptsd.png
    |   |       |   โโโ ๐wordcloud_relevant_ptsd.png
    |   |       |   โโโ ๐wordcloud_irrelevant_ptsd.png
    |   |       โโโ ๐state_files
    |   |       |   โโโ ๐sim_ptsd_`x`.asreview
    |   |       |   โโโ ๐...
    |   |       โโโ ๐metrics_sim_ptsd_`x`.json
    |   |       โโโ ๐...
    |   |       โโโ ๐plot_recall_ptsd.png
    โ   โโโ ๐tables
    |       โโโ ๐data_descriptives.csv
    |       โโโ ๐data_descriptives.xlsx
    |       โโโ ๐data_metrics.csv
    |       โโโ ๐data_metrics.xlsx
    โโโ ๐scripts
    โ   โโโ ๐get_plot.py
    โ   โโโ ๐merge_descriptives.py
    โ   โโโ ๐merge_metrics.py
    โ   โโโ ๐...
    โโโ ๐jobs.sh
    โโโ ๐README.md

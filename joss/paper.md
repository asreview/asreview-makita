---
title: Makita - A Workflow Generator for large scale Simulation Studies
tags:
  - Workflow generator
  - Simulation study
  - Reproducibility
  - ASReview
  - Automation
authors:
  - name: Jelle Jasper Teijema
    corresponding: true
    orcid: 0000-0001-9282-4311
    affiliation: 1
  - name: Gerbrich Ferdinands
    affiliation: 1
    orcid: 0000-0002-4998-3293
  - name: Rens van de Schoot
    affiliation: 1
    orcid: 0000-0001-7736-2091
  - name: Jonathan de Bruin
    affiliation: 2
    orcid: 0000-0002-4297-0502
affiliations:
 - name: Department of Methodology and Statistics, Faculty of Social and Behavioral Sciences, Utrecht University, The Netherlands
   index: 1
 - name: AFFILIATION
   index: 2
date: 1 September 2023
bibliography: paper.bib
---

# Summary

The field of accelerating the screening phase of systematic reviews with
advanced machine learning methods is rapidly evolving [@teijema2023simulation].
A simulation study involves mimicking the screening process for a systematic
review of a human in interaction with an Active learning model. The simulation
reenacts the screening process as if a researcher were using a machine learning
model. The performance of one or multiple model(s) can then be measured by
performance metrics, such as the Work Saved over Sampling, recall at a given
point in the screening process, or the average time to discover a relevant
record. However, setting up a simulation study can be a time-consuming and
error-prone process, especially since reproduciblity is of key importance.

This paper presents **ASReview’s Makita** (**MAK**e **IT** **A**utomatic)
[@makita_zenodo]. ASReview Makita streamlines the simulation study design
process for systematic reviews using ASReview [@asreview_nature], providing a
generative framework to simplify creating and running large-scale simulations.
Using Makita templates, different study workflows can be generated to fit the
study needs. If a study requires a unique template, a custom templated can be
used. Its implementation through the command-line interface aims to make
reproducible and repeatable research easy and efficient, to assist both novice
and expert researchers.

# Statement of need

Although tools such as ASReview LAB [@asreview_lab] offer various ways to
simulate the screening process in systematic reviews via its WebApp, there is a
need for automation in setting up the research environment for large scale
simulations research. ASReview Makita fills this gap by automating the workflow
setup, preparing GitHub repositories, documentation, pre/post-processing code,
and generating execution scripts.

Simplifying reproducibility and maintaining an organized folder structure are
crucial for scientific research. They ensure that experiments can be reliably
repeated and build upon by other researchers. A well-organized directory makes
it easier to understand the workflow, locate files, and contributes to the
transparency and credibility of the study.

# Technical Functionality

Utilizing a combination of Jinja-based templates and Python templates, ASReview
Makita automatically generates an hierarchical folder structure, a README.md
(including descriptions, instructions, file tree, and data statements), any
additional code used for pre- and post-processing, and batch or shell execution
scripts. Makita offers scripts for, among others, extracting dataset statistics
[@datatools], extracting simulation performance metrics, merging those metrics
into easy to read tables, generating wordclouds [@wordcloud], and plotting the
results [@insights]. Makita assures that all steps of the simulation study are
stored and thus reproducible and transparent.

The Jinja based templates handle study structure while accompanying Python
templates add extended functionality. A range of standard templates is
available, specifically tailored for ASReview simulations. Overall, the
architecture provides a modular and flexible framework, allowing users to easily
adapt the tool to their specific research needs.

What Makita does:

- Setting up a workflow for running a large-scale simulation study
- Preparing a Github repository
- Automating the many lines of code needed
- Creating an execution script for running the simulation study with just one
  line of code
- Making research fully reproducible
- Allowing for custom templates to accommodate specific research questions

What Makita does not do:

- Executing jobs or tasks itself
- Writing the study paper

While Makita was originally developed for use with ASReview’s simulation CLI,
Makita’s design allows it to be integrated with any other CLI tool via a
customized template, broadening its applicability across different large
scale research environments. Makita can be run locally, on a server, or in
the cloud, and can be used in combination with Docker and Kubernetes.

Very large scale simulation studies have been successfully run using Makita,
with over 27.000 simulations in a single study, using 26 different datasets and
13 different simulation models [@paper3]. The study implemented Makita within a
kubernetes cluster, generating custom templates on the fly for each of the
cluster nodes' specific needs [@simulation_project].

## Usage

Upon creating a `data` folder with the desired datasets, running the Makita
command for the `basic` template generates the study structure. In this case, a
`n_runs` argument is added to the command, indicating 100 simulations with
different seeds are needed for the study. Executing the generated jobs file
starts the simulation tests, producing output logs and metrics within the
created folder structure. This allows for easy access to performance metrics and
study results. Below are filetree results for running the basic template and
executing the jobs file. Filetrees are generated in scientific ordering,
following Scitree [@scitree].

    > asreview makita template basic -n_runs 100

Before execution:

    Makita_basic/
    ├── README.md
    ├── jobs.bat
    ├── data/
    │   └── generic_labels.csv
    └── scripts/
        ├── get_plot.py
        ├── merge_descriptives.py
        ├── merge_metrics.py
        └── merge_tds.py

And after execution of the `jobs.bat` file.

    Makita_basic/
    ├── README.md
    ├── jobs.bat
    ├── data/
    │   └── generic_labels.csv
    ├── scripts/
    │   ├── get_plot.py
    │   ├── merge_descriptives.py
    │   ├── merge_metrics.py
    │   └── merge_tds.py
    └── output/
        ├── figures/
        │   ├── plot_recall_sim_generic_labels.png
        │   ├── wordcloud_generic_labels.png
        │   ├── wordcloud_irrelevant_generic_labels.png
        │   └── wordcloud_relevant_generic_labels.png
        ├── simulation/
        │   └── generic_labels/
        │       ├── descriptives/
        │       │   └── data_stats_generic_labels.json
        │       ├── metrics/
        │       │   ├── metrics_sim_generic_labels_0.json
        │       │   ├── ...
        │       │   └── metrics_sim_generic_labels_99.json
        │       └── state_files/
        │           ├── sim_generic_labels_0.asreview
        │           ├── ...
        │           └── sim_generic_labels_99.asreview
        └── tables/
            ├── metrics_sim_all.csv
            ├── metrics_sim_all.xlsx
            ├── data_descriptives_all.csv
            ├── data_descriptives_all.xlsx
            ├── metrics/
            │   ├── metrics_sim_generic_labels.csv
            │   └── metrics_sim_generic_labels.xlsx
            └── time_to_discovery/
                ├── tds_sim_generic_labels.csv
                └── tds_sim_generic_labels.xlsx

# Ongoing Research and Contributions

Makita is already in use in multiple research projects, in both many unpublished
exploratory studies, and in studies referenced by [@teijema2023active;
@oude2023can; @ferdinands2023performance; @neeleman2023addressing;
@campos2023screening]. Its usage in these projects highlights its utility and
relevance in modern research settings.

# References

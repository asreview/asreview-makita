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
  - name: Jonathan de Bruin
    affiliation: 1
    orcid: 0000-0002-4297-0502
  - name: Rens van de Schoot
    affiliation: 1
    orcid: 000-0001-7736-2091
affiliations:
 - name: Department of Methodology and Statistics, Faculty of Social and Behavioral Sciences, Utrecht University, The Netherlands
   index: 1
date: 29 September 2023
bibliography: paper.bib
---

# Summary
This paper presents **ASReview’s Makita** (**MAK**e **IT**
**A**utomatic) [@makita_zenodo]. ASReview Makita streamlines the simulation study process
for systematic reviews, providing a generative framework to simplify
creating and running large-scale simulations. While originally developed
for use with ASReview’s simulation CLI [@asreview_nature], Makita’s design allows it to be
integrated with other tools, broadening its applicability across
different large scale research environments. Its implementation through
a command-line interface aims to make reproducible/repeatable research
easy and efficient, to assist both novice and expert researchers.

# Statement of need

Although tools such as ASReview LAB [@asreview_lab] offer various ways to simulate the
screening process in systematic reviews, there is a need for automation
in setting up the research environment for large scale simulations
research. ASReview Makita fills this gap by automating the workflow
setup, preparing GitHub repositories, documentation, and generating
execution scripts.

Simplifying reproducibility and maintaining an organized folder
structure are crucial for scientific research. They ensure that
experiments can be reliably repeated and scrutinized by other
researchers. A well-organized directory makes it easier to understand
the workflow, locate files, and contributes to the transparency and
credibility of the study.

# Technical Functionality

Utilizing a combination of Jinja-based templates and Python templates,
ASReview Makita automatically generates an hierarchical folder
structure, a README.md (including descriptions, instructions, file tree,
and data statements), any additional code used for pre- and
post-processing, and batch or shell execution scripts. The Jinja
templates handle study structure while Python templates add extended
functionality. A range of standard templates is available, specifically
tailored for ASReview simulations. These pre-designed templates
facilitate tasks like setting up large-scale simulation studies,
automating lines of code, and preparing GitHub repositories for research
reproducibility. Overall, the architecture provides a modular and
flexible framework, allowing users to easily adapt the tool to their
specific research needs.

Upon creating a ’data’ folder with the desired datasets, running the
Makita command for the `basic` template generates the study
structure. In this case, a `n_runs` argument is added
to the command, indicating 2 simulations with different seeds is needed
for the study. Executing the generated jobs file starts the simulation
tests, producing output logs and metrics within the created folder
structure. This allows for easy access to performance metrics and study
results. Below are filetree results for running the basic template and
executing the jobs file. Filetrees are generated in scientific ordering,
following Scitree [@scitree].

    > asreview makita template basic -n_runs 2

Before execution:
```console
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
```

And after execution of the `jobs.bat` file.

```console
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
    │       │   └── metrics_sim_generic_labels_1.json
    │       └── state_files/
    │           ├── sim_generic_labels_0.asreview
    │           └── sim_generic_labels_1.asreview
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
```

# Ongoing Research and Contributions

Makita is already in use in multiple research projects, in both many
unpublished exploratory studies, and in studies referenced by [@teijema2023active; @oude2023can; @ferdinands2023performance; @neeleman2023addressing; @campos2023screening]. Its
usage in these projects highlights its utility and relevance in
modern research settings.

# References

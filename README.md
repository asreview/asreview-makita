# ASReview Makita

[![PyPI version](https://badge.fury.io/py/asreview-makita.svg)](https://badge.fury.io/py/asreview-makita) [![Downloads](https://pepy.tech/badge/asreview-makita)](https://pepy.tech/project/asreview-makita) ![PyPI - License](https://img.shields.io/pypi/l/asreview-makita) [![DOI](https://zenodo.org/badge/530642619.svg)](https://zenodo.org/badge/latestdoi/530642619)

[ASReviews](https://github.com/asreview/asreview)' Makita (**MAK**e **IT** **A**utomatic) is a workflow generator for simulation studies using the command line interface of [ASReview
LAB](https://asreview.readthedocs.io/en/latest/simulation_cli.html). Makita can be used to effortlessly generate the framework and code for your simulation study.

A simulation involves mimicking the screening process for a systematic review of a human in interaction with an Active learning model (i.e., a combination of a feature extractor, classifier,
balancing method, and a query strategy). The simulation reenacts the screening process as if a researcher were using active learning. The performance of one or multiple model(s) can then be
measured by performance metrics, such as the Work Saved over Sampling, recall at a given point in the screening process, or the average time to discover a relevant record.

Using Makita templates, different study structures can be generated to fit the needs of your very own study. If your study requires a unique template, you can create a new one and use it
instead.

With [ASReview LAB](https://github.com/asreview/asreview), you can [simulate]( https://asreview.readthedocs.io/en/latest/simulation_overview.html#overview) with the [web
interface](https://asreview.readthedocs.io/en/latest/simulation_overview.html#simulating-with-asreview-lab), the [Python API](https://asreview.readthedocs.io/en/latest/simulation_api_example.html), or
the [Command Line Interface (CLI)]( https://asreview.readthedocs.io/en/latest/simulation_cli.html). Makita makes use of the CLI.

What Makita does:

- Setting up a workflow for running a large-scale simulation study
- Preparing a Github repository
- Automating the many lines of code needed
- Creating a batch script for running the simulation study with just one line of code
- Making your research fully reproducible
- Allowing you to add templates to accommodate your own specific research question

What Makita does not do:

- Executing jobs or tasks itself
- Being a black-box
- Writing your paper

For a tutorial on using Makita we refer to the [Exercise on Using the ASReview Simulation Mode](https://github.com/asreview/asreview-academy/blob/main/introducing-simulation-mode/README.md).

## Installation

Install the Makita extension with pip:

``` bash
pip install asreview-makita
```

For upgrading, use:

``` bash
pip install --upgrade asreview-makita
```

After installing the extension, ASReview should automatically detect Makita. If installed correctly, `asreview --help` should list Makita as an option.

## Getting started

You can create the framework and code for your own simulation study in 4 steps.

1. Create an project folder on your computer.
2. Create a subfolder named `data` and fill it using one or more datasets.
3. Using your preferred command line tool, `cd` into the project folder.
4. Create a simulation study from a template found in the [list of templates](#templates) via

```console
asreview makita template NAME_OF_TEMPLATE
```

where `NAME_OF_TEMPLATE` is one of the templates (e.g. `asreview makita template arfi`).

Your simulation study is now properly set up and ready for use. To start the simulations, execute the following shell script in the project folder:

```console
sh jobs.sh
```

Or on Windows:

```console
jobs.bat
```

The `jobs` script runs all jobs in the project folder.

### Platform support

By default, ASReview Makita renders job files for the platform of rendering. It is possible to render jobs for other platforms as well. Use the argument `--platform` with values "Windows", "Linux", or "Darwin" (MacOS) to change the output.

```console
asreview makita template basic --platform Windows
```

By default, the job file depends on the platform. Windows users will see a `jobs.bat` file, while other users will see `jobs.sh`. You can overwrite this with

```console
asreview makita template basic --job_file my_jobs_file.my_ext
```

## Templates

The following table gives an overview of the available templates.
See [Getting started](#getting-started) for instructions on usage.

> Note: If no seed is set with the template command, the default seed is used.
> While this is important for the reproducibility of the results, it may lead to
> long-term bias. To avoid seed-related bias across different simulation
> studies, a seed should be for the prior records and models.

### Basic template

command: `basic`

The basic template prepares a script for conducting a simulation study with one run using the default model settings, and two randomly chosen priors (one relevant and one irrelevant record).

optional arguments:

```console
  -h, --help                                show this help message and exit
  --job_file JOB_FILE, -f JOB_FILE          The name of the file with jobs.                 Default jobs.bat for Windows, otherwise jobs.sh.
  -s DATA_FOLDER                            Dataset folder
  -o OUTPUT_FOLDER                          Output folder
  --init_seed INIT_SEED                     Seed of the priors.                             Seed is set to 535 by default.
  --model_seed MODEL_SEED                   Seed of the models.                             Seed is set to 165 by default.
  --template TEMPLATE                       Overwrite template with template file path.
  --platform PLATFORM                       Platform to run jobs: Windows, Darwin, Linux.   Default: the system of rendering templates.
  --n_runs N_RUNS                           Number of runs.                                 Default: 1.
  --no_wordclouds                           Disables the generation of wordclouds.
  --classifier CLASSIFIER                   Classifier to use.                              Default: nb.
  --feature_extractor FEATURE_EXTRACTOR     Feature_extractor to use.                       Default: tfidf.
  --query_strategy QUERY_STRATEGY           Query strategy to use.                          Default: max.
  --balance_strategy BALANCE_STRATEGY       Balance strategy to use.                        Default: double.
  --instances_per_query INSTANCES_PER_QUERY Number of instances per query.                  Default: 1.
  --stop_if STOP_IF                         The number of label actions to simulate.        Default 'min' will stop simulating when all relevant records are found.
```

### ARFI template

command: `arfi`

The ARFI template (All relevant, fixed irrelevant) prepares a script for running a simulation study in such a way that for every relevant record 1 run will be executed with 10 randomly chosen irrelevant records which are kept constant over runs. When multiple datasets are available the template orders the tasks in the job file per dataset.

optional arguments:

```console
  -h, --help                                show this help message and exit
  --job_file JOB_FILE, -f JOB_FILE          The name of the file with jobs.                 Default jobs.bat for Windows, otherwise jobs.sh.
  -s DATA_FOLDER                            Dataset folder
  -o OUTPUT_FOLDER                          Output folder
  --init_seed INIT_SEED                     Seed of the priors.                             Seed is set to 535 by default.
  --model_seed MODEL_SEED                   Seed of the models.                             Seed is set to 165 by default.
  --template TEMPLATE                       Overwrite template with template file path.
  --platform PLATFORM                       Platform to run jobs: Windows, Darwin, Linux.   Default: the system of rendering templates.
  --n_priors N_PRIORS                       Number of priors.                               Default: 10.
  --no_wordclouds                           Disables the generation of wordclouds.
  --classifier CLASSIFIER                   Classifier to use.                              Default: nb.
  --feature_extractor FEATURE_EXTRACTOR     Feature_extractor to use.                       Default: tfidf.
  --query_strategy QUERY_STRATEGY           Query strategy to use.                          Default: max.
  --balance_strategy BALANCE_STRATEGY       Balance strategy to use.                        Default: double.
  --instances_per_query INSTANCES_PER_QUERY Number of instances per query.                  Default: 1.
  --stop_if STOP_IF                         The number of label actions to simulate.        Default 'min' will stop simulating when all relevant records are found.
```

### Multimodel template

command: `multimodel`

The multiple model template prepares a script for running a simulation study comparing multiple models for one dataset and a fixed set of priors (one relevant and one irrelevant record; identical across models).

optional arguments:

```console
  -h, --help                                show this help message and exit
  --job_file JOB_FILE, -f JOB_FILE          The name of the file with jobs.                 Default jobs.bat for Windows, otherwise jobs.sh.
  -s DATA_FOLDER                            Dataset folder
  -o OUTPUT_FOLDER                          Output folder
  --init_seed INIT_SEED                     Seed of the priors.                             Seed is set to 535 by default.
  --model_seed MODEL_SEED                   Seed of the models.                             Seed is set to 165 by default.
  --template TEMPLATE                       Overwrite template with template file path.
  --platform PLATFORM                       Platform to run jobs: Windows, Darwin, Linux.   Default: the system of rendering templates.
  --n_runs N_RUNS                           Number of runs.                                 Default: 1.
  --no_wordclouds                           Disables the generation of wordclouds.
  --query_strategy QUERY_STRATEGY           Query strategy to use.                          Default: max.
  --balance_strategy BALANCE_STRATEGY       Balance strategy to use.                        Default: double.
  --instances_per_query INSTANCES_PER_QUERY Number of instances per query.                  Default: 1.
  --stop_if STOP_IF                         The number of label actions to simulate.        Default 'min' will stop simulating when all relevant records are found.
  --classifiers CLASSIFIERS                 Classifiers to use                              Default: ['logistic', 'nb', 'rf', 'svm']
  --feature_extractors FEATURE_EXTRACTOR    Feature extractors to use                       Default: ['doc2vec', 'sbert', 'tfidf']
  --impossible_models IMPOSSIBLE_MODELS     Model combinations to exclude                   Default: ['nb,doc2vec', 'nb,sbert']
```

If you want to specify certain combinations of classifiers and feature
extractors that should and should not be used, you can use the `--classifiers`,
`--feature_extractors`, and `--impossible_models` option. For instance, if you
want to exclude the combinations of `nb` with `doc2vec` and `logistic` with
`tfidf`, use the following command:

```console
asreview makita template multimodel --classifiers logistic nb --feature_extractors tfidf doc2vec --impossible_models nb,doc2vec logistic,tfidf
```

## Advanced usage

### Create and use custom templates

It is possible to overwrite the internal templates. This can be useful for simulation studies with different needs.

1. Select an existing template that looks similar to your needs. For example, you want to run ARFI with a different model, then you pick the [ARFI template](#arfi-template).
2. Download the template you selected in step 1 from the [Github repository](https://github.com/asreview/asreview-makita/tree/main/asreviewcontrib/makita/templates). Template files have the following
   structure `template_*.txt.template`. For the ARFI example, the template is
   [template_arfi.txt.template](https://github.com/asreview/asreview-makita/blob/main/asreviewcontrib/makita/templates/template_arfi.txt.template).
3. Save the downloaded template somewhere on your computer. The template is a so-called "Jinja" template. The template consists of [ASReview command line
   commands](https://asreview.readthedocs.io/en/latest/API/cli.html) combined with jinja syntax. The Jinja syntax is very intuitive. See this
   [Cheatsheet](https://cheatography.com/skalavala/cheat-sheets/jinja/).
4. Edit the Jinja template to your needs.
5. Run the custom template with the command line option `--template PATH_TO_MY_TEMPLATE.txt.template`. For the ARFI example, this would be `asreview makita template arfi --template
   PATH_TO_MY_TEMPLATE.txt.template`. Please keep in mind that you follow the usual steps for running a template.
6. A `jobs.sh` file should be in the your folder.

Please contribute your templates back to the project by making a Pull Request. Then, we can integrate it in the core of the makita package.

### Add and use scripts

Makita can add scripts to your repository. The scripts are mainly pre- and postprocessing scripts. These scripts are not (yet) available in any existing ASReview software. Therefore, they can be added manually
with `asreview makita add-script NAME_OF_SCRIPT`.

For example, the results from *ASReview datatools* are merged via the script `merge_descriptives.py` (or `merge_metrics.py` for *ASReview insights*), using:

1. Collect statistics (with template)
2. Run  `asreview makita add-script merge_descriptives.py`
3. Run `python scripts/merge_descriptives.py`

Use `-s`  (source) and `-o` (output) to tweak paths.

Some scripts are added automatically to the folder, as they are part of the
template. For example, the `get_plot.py` script is added to the generated folder
when using any template, as it is used to generate the plots.

Still, `get_plot.py` can be used on its own, as it is a standalone script. To use it,
use `-s` (source) and `-o` (output) to tweak paths.

Adding a legend to the plot can be done with the `-l` or `--show_legend` flag,
with the labels clustered on any of the following: `'filename', 'model', 'query_strategy', 'balance_strategy', 'feature_extraction', 'n_instances', 'stop_if', 'n_prior_included', 'n_prior_excluded', 'model_param', 'query_param', 'feature_param', 'balance_param'`

#### Available scripts

The following scripts are available:

- get_plot.py
- get_settings_from_state.py
- merge_descriptives.py
- merge_metrics.py
- merge_tds.py
- split_data_with_multiple_labels.py [DEPRECATED]

#### Time to Discovery Tables

The 'merge_tds.py' script creates a table of the time to discovery (TD) values for each dataset, with each row corresponding to each record ID of the relevant records in a dataset, and the columns correspond to each simulation run (e.g, for the Multimodel template each column corresponds to a simualtion run with each active learning model). Additionally, the tables includes the average-record-TD values (the average of the TD values for a record across multiple simulation runs), and the average-simulation-TD values (the average of the TD values across all records for a single simulation run).

#### Run Makita via Docker

To run Makita template with Docker use the following command:

```docker
docker run -v $PWD:/app ghcr.io/asreview/asreview makita <YOUR COMMAND>
```

## License

This extension is published under the [MIT license](/LICENSE).

## Contact

This extension is part of the ASReview project ([asreview.ai](https://asreview.ai)). It is maintained by the maintainers of ASReview LAB. See [ASReview LAB](https://github.com/asreview/asreview) for
contact information and more resources.

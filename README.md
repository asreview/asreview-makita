# ASReview Makita

[![PyPI
version](https://badge.fury.io/py/asreview-makita.svg)](https://badge.fury.io/py/asreview-makita)
[![Downloads](https://static.pepy.tech/badge/asreview-makita)](https://pepy.tech/project/asreview-makita)
![PyPI - License](https://img.shields.io/pypi/l/asreview-makita)
[![DOI](https://zenodo.org/badge/530642619.svg)](https://zenodo.org/badge/latestdoi/530642619)
[![DOI](https://img.shields.io/badge/DOI-10.1016%2Fj.simpa.2024.100663-blue)](https://doi.org/10.1016/j.simpa.2024.100663)

> [!IMPORTANT]
> **ASReview Makita v1.x** and later requires ASReview version 2 (`asreview>=2`). For ASReview version 1, use **ASReview Makita v0.x**. 

[ASReviews](https://github.com/asreview/asreview)' Makita (**MAK**e **IT**
**A**utomatic) is a workflow generator for simulation studies using the command
line interface of [ASReview
LAB](https://asreview.readthedocs.io/en/latest/simulation_cli.html). Makita can
be used to effortlessly generate the framework and code for your simulation
study.

A simulation involves mimicking the screening process for a systematic review of
a human in interaction with an Active learning model (i.e., a combination of a
feature extractor, classifier, balancing method, and a query strategy). The
simulation reenacts the screening process as if a researcher were using active
learning. The performance of one or multiple model(s) can then be measured by
performance metrics, such as the Work Saved over Sampling, recall at a given
point in the screening process, or the average time to discover a relevant
record.

Using Makita templates, different study structures can be generated to fit the
needs of your very own study. If your study requires a unique template, you can
create a new one and use it instead.

With [ASReview LAB](https://github.com/asreview/asreview), you can
[simulate](https://asreview.readthedocs.io/en/latest/lab/simulation_overview.html)
with the [web
interface](https://asreview.readthedocs.io/en/latest/lab/index.html),
the [Python
API](https://asreview.readthedocs.io/en/latest/technical/overview_development.html#api), or
the [Command Line Interface
(CLI)](https://asreview.readthedocs.io/en/latest/technical/overview_development.html#cli). Makita
makes use of the CLI.

What Makita does:

- Setting up a workflow for running a large-scale simulation study
- Preparing a Github repository
- Automating the many lines of code needed
- Creating a batch script for running the simulation study with just one line of
  code
- Making your research fully reproducible
- Allowing you to add templates to accommodate your own specific research
  question

What Makita does not do:

- Executing jobs or tasks itself
- Being a black-box
- Writing your paper

For a tutorial on using Makita we refer to the [Exercise on Using the ASReview
Simulation Mode](https://asreview.github.io/asreview-academy/simulation.html).

### ASReview Makita Helper Tool

For users of ASReview Makita, there's a handy helper tool available. This tool
simplifies the process of formulating your Makita commands, ensuring
compatibility and ease of use. It's designed to work with ASReview Makita
version 1.0 and above.

[Makita helper Tool](https://asreview.github.io/asreview-makita/)

## Installation

ASReview Makita requires Python 3.10 or later. Install the extension using pip:

```bash
pip install asreview-makita
```

To upgrade to the latest version, use:

```bash
pip install --upgrade asreview-makita
```

Once installed, ASReview should automatically detect Makita. To verify the installation, run:

```bash
asreview --help
```

If installed correctly, Makita will appear as an available option.

## Getting Started

### Render a Study

Follow these steps to set up the framework and code for your simulation study:

1. **Install ASReview Makita**
   Follow the [Installation](#installation) instructions to set up ASReview Makita.

2. **Prepare Your Datasets**
   Place all your datasets in a single folder.

3. **Choose a Project Folder**
   Decide on a path for your project folder. You don't need to create the folder manually; `makita` will handle it for you.

4. **Generate a Simulation Study**
   Select a template from the [list of templates](#templates) and create your study using:
   ```bash
   asreview makita template NAME_OF_TEMPLATE -d 'path/to/your/datasets' -p 'path/to/your/project-folder'
   ```
   Replace `NAME_OF_TEMPLATE` with the desired template name (e.g., `arfi` for the ARFI template).

### Run a Study

Follow these steps to execute the simulation study:

1. **Install Dependencies**
   Ensure all dependencies mentioned in the rendered `README.md` file are installed.

2. **Run the Simulation Study**
   Execute the jobs script to run all tasks in the project folder:

   #### On Unix-based systems (e.g., macOS, Linux)

   ```bash
   sh jobs.sh
   ```

   #### On Windows

   ```cmd
   jobs.bat
   ```

   The `jobs` script will process all jobs in the project folder.

### Alternative rendering

If you run the makita command in the directory where you want to generate your
project, you don't need to specify the project folder using the -p flag.
Similarly, if your datasets are stored in a folder named data within the same
location, you can omit the -d flag.

For example:

```console
asreview makita template basic
```

is equivalent to:

```console
asreview makita template basic -p 'current/working/directory' -d 'current/working/directory/data'
```

## Platform support

By default, ASReview Makita renders job files for the platform of rendering. It
is possible to render jobs for other platforms as well. Use the argument
`--platform` with values "Windows", "Linux", or "Darwin" (MacOS) to change the
output.

```console
asreview makita template basic --platform Windows
```

By default, the job file depends on the platform. Windows users will see a
`jobs.bat` file, while other users will see `jobs.sh`. You can overwrite this
with

```console
asreview makita template basic --job-file my_jobs_file.my_ext
```

## Templates

The following table gives an overview of the available templates. See [Getting
started](#getting-started) for instructions on usage.

> Note: If no seed is set with the template command, the default seed is used.
> While this is important for the reproducibility of the results, it may lead to
> long-term bias. To avoid seed-related bias across different simulation
> studies, a seed should be for the prior records and models.

### Basic template

Template name: `basic`

The basic template prepares a script for conducting a simulation study with one
run using the default [ASReview CLI simulate
parameters](https://asreview.readthedocs.io/en/stable/lab/simulation_cli.html).

> [!IMPORTANT]
>
> The default behavior of ASReview regarding prior knowledge sampling has changed. In ASReview version 1, the default values for `--n-prior-included` and `--n-prior-excluded` were set to 1. However, in version 2 of ASReview, these values are now set to 0 by default. This means that simulations will begin with top-down screening until sufficient prior knowledge is gathered.
>
> To revert to the previous behavior, use the following options: `--n-prior-included 1 --n-prior-excluded 1`.

optional arguments:

| Argument                                | Description                                                         | Default Value                                                                               |
| --------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `-h`, `--help`                          | Show this help message and exit                                     |                                                                                             |
| `-p`, `--project-folder PROJECT_FOLDER` | The folder the project will be rendered to                          | The current working directory                                                               |
| `-d`, `--data-folder DATA_FOLDER`       | The dataset source folder                                           | `Data` folder in working directory                                                          |
| `-j`, `--job-file JOB_FILE`             | The name of the file with jobs                                      | `jobs.bat` for Windows, otherwise `jobs.sh`                                                 |
| `--prior-seed prior_seed`               | Seed of the priors                                                  | 535                                                                                         |
| `--model-seed MODEL_SEED`               | Seed of the models                                                  | 165                                                                                         |
| `--template TEMPLATE`                   | Overwrite template with template file path                          |                                                                                             |
| `--platform PLATFORM`                   | Platform to run jobs: Windows, Darwin, Linux                        | The system of rendering templates                                                           |
| `--n-runs N_RUNS`                       | Number of runs                                                      | 1                                                                                           |
| `--overwrite`                           | Automatically accepts all overwrite requests                        |                                                                                             |
| `--ai AI`                               | AI(s) to use. Multiple values can be used to simulate multiple AIs. | [Latest Ultra model of ASReview](https://asreview.readthedocs.io/en/latest/lab/models.html) |
| `--classifier CLASSIFIER`               | Classifier to use                                                   | `svm` if `--ai` not set                                                                     |
| `--feature-extractor FEATURE_EXTRACTOR` | Feature extractor to use                                            | `tfidf` if `--ai` not set                                                                   |
| `--querier QUERIER`                     | Query strategy to use                                               | `max` if `--ai` not set                                                                     |
| `--balancer BALANCE_STRATEGY`           | Balance strategy to use                                             | `balanced` if `--ai` not set                                                                |
| `--n-query n_query`                     | Number of instances per query                                       | 1                                                                                           |
| `--n-stop n_stop`                       | The number of label actions to simulate                             | Will stop simulating when all relevant records are found                                    |
| `--n-prior-included N_PRIOR_INCLUDED`   | Sample n prior included records. Only for basic and modelmatrix templates. | 0 (just as in ASReview)                                                                |
| `--n-prior-excluded N_PRIOR_EXCLUDED`   | Sample n prior excluded records. Only for basic and modelmatrix templates. | 0 (just as in ASReview)                                                                |

### ARFI template

Template name: `arfi`

The ARFI template (All relevant, fixed irrelevant) prepares a script for running
a simulation study in such a way that for every relevant record 1 run will be
executed with 10 randomly chosen irrelevant records which are kept constant over
runs. When multiple datasets are available the template orders the tasks in the
job file per dataset.

optional arguments:

| Argument                                | Description                                                         | Default Value                                                                               |
| --------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `-h`, `--help`                          | Show this help message and exit                                     |                                                                                             |
| `-p`, `--project-folder PROJECT_FOLDER` | The folder the project will be rendered to                          | The current working directory                                                               |
| `-d`, `--data-folder DATA_FOLDER`       | The dataset source folder                                           | `Data` folder in working directory                                                          |
| `-j`, `--job-file JOB_FILE`             | The name of the file with jobs                                      | `jobs.bat` for Windows, otherwise `jobs.sh`                                                 |
| `--prior-seed prior_seed`               | Seed of the priors                                                  | 535                                                                                         |
| `--model-seed MODEL_SEED`               | Seed of the models                                                  | 165                                                                                         |
| `--template TEMPLATE`                   | Overwrite template with template file path                          |                                                                                             |
| `--platform PLATFORM`                   | Platform to run jobs: Windows, Darwin, Linux                        | The system of rendering templates                                                           |
| `--n-priors N_PRIORS`                   | Number of priors                                                    | 10                                                                                          |
| `--overwrite`                           | Automatically accepts all overwrite requests                        |                                                                                             |
| `--ai AI`                               | AI(s) to use. Multiple values can be used to simulate multiple AIs. | [Latest Ultra model of ASReview](https://asreview.readthedocs.io/en/latest/lab/models.html) |
| `--classifier CLASSIFIER`               | Classifier to use                                                   | `svm` if `--ai` not set                                                                     |
| `--feature-extractor FEATURE_EXTRACTOR` | Feature extractor to use                                            | `tfidf` if `--ai` not set                                                                   |
| `--querier QUERIER`                     | Query strategy to use                                               | `max` if `--ai` not set                                                                     |
| `--balancer BALANCE_STRATEGY`           | Balance strategy to use                                             | `balanced` if `--ai` not set                                                                |
| `--n-query n_query`                     | Number of instances per query                                       | 1                                                                                           |
| `--n-stop n_stop`                       | The number of label actions to simulate                             | Will stop simulating when all relevant records are found                                    |

### Model matrix template

Template name: `modelmatrix` (formerly `multimodel`)

The model matrix template prepares a simulation study comparing a matrix of
model components for your dataset(s). All other parameters are the default [ASReview CLI simulate
parameters](https://asreview.readthedocs.io/en/stable/lab/simulation_cli.html).


> [!IMPORTANT]
>
> The default behavior of ASReview regarding prior knowledge sampling has changed. In ASReview version 1, the default values for `--n-prior-included` and `--n-prior-excluded` were set to 1. However, in version 2 of ASReview, these values are now set to 0 by default. This means that simulations will begin with top-down screening until sufficient prior knowledge is gathered.
>
> To revert to the previous behavior, use the following options: `--n-prior-included 1 --n-prior-excluded 1`.

optional arguments:

| Argument                                 | Description                                  | Default Value                                            |
| ---------------------------------------- | -------------------------------------------- | -------------------------------------------------------- |
| `-h`, `--help`                           | Show this help message and exit              |                                                          |
| `-p`, `--project-folder PROJECT_FOLDER`  | The folder the project will be rendered to   | The current working directory                            |
| `-d`, `--data-folder DATA_FOLDER`        | The dataset source folder                    | `Data` folder in working directory                       |
| `-j`, `--job-file JOB_FILE`              | The name of the file with jobs               | `jobs.bat` for Windows, otherwise `jobs.sh`              |
| `--prior-seed prior_seed`                | Seed of the priors                           | 535                                                      |
| `--model-seed MODEL_SEED`                | Seed of the models                           | 165                                                      |
| `--template TEMPLATE`                    | Overwrite template with template file path   |                                                          |
| `--platform PLATFORM`                    | Platform to run jobs: Windows, Darwin, Linux | The system of rendering templates                        |
| `--n-runs N_RUNS`                        | Number of runs                               | 1                                                        |
| `--overwrite`                            | Automatically accepts all overwrite requests |                                                          |
| `--n-query n_query`                      | Number of instances per query                | 1                                                        |
| `--n-stop n_stop`                        | The number of label actions to simulate      | Will stop simulating when all relevant records are found |
| `--n-prior-included N_PRIOR_INCLUDED`    | Sample n prior included records. Only for basic and modelmatrix templates. | 0 (just as in ASReview)                            |
| `--n-prior-excluded N_PRIOR_EXCLUDED`    | Sample n prior excluded records. Only for basic and modelmatrix templates. | 0 (just as in ASReview)                            |
| `--classifiers CLASSIFIERS`              | Classifiers to use                           | `nb svm`                                          |
| `--feature-extractors FEATURE_EXTRACTOR` | Feature extractors to use                    | `tfidf onehot`                                    |
| `--queriers QUERIER`                     | Query strategies to use                      | `max`                                                |
| `--balancers BALANCE_STRATEGY`           | Balance strategies to use                    | `none balanced`                                   |
| `--impossible-models IMPOSSIBLE_MODELS`  | Model combinations to exclude                | `nb,doc2vec nb,sbert`                             |

#### Example usage

If you want to specify certain combinations of classifiers and feature
extractors that should and should not be used, you can use the `--classifiers`,
`--feature-extractors`, `--queriers`, `--balancers` and
`--impossible-models` option. For instance, if you want to exclude the
combinations of `nb` with `doc2vec` and `logistic` with `tfidf`, use the
following command:

```console
asreview makita template modelmatrix --classifiers logistic nb --feature-extractors tfidf doc2vec --queriers max max_random max_uncertainty cluster --impossible-models nb,doc2vec logistic,tfidf
```

### Prior template

Template name: `prior`

The prior template evaluates how a set of custom prior knowledge might affect
simulation performance. It processes two types of data in the data folder:
labeled dataset(s) to be simulated and labeled dataset(s) to be used as prior
knowledge. The filename(s) of the dataset(s) containing the custom prior
knowledge should use the naming prefix `prior_[dataset_name]`.

The template runs two simulations: the first simulation uses all records from
the `prior_` dataset(s) as prior knowledge, and the second uses a 1+1 randomly
chosen set of prior knowledge from the non-prior knowledge dataset as a minimal
training set. Both runs simulate performance on the combined non-prior
dataset(s).

Running this template creates a `generated_data` folder. This folder contains
two datasets; `dataset_with_priors.csv` and `dataset_without_priors.csv`. The
simulations specified in the generated jobs file will use these datasets for
their simulations.

optional arguments:

| Argument                                | Description                                                         | Default Value                                                                               |
| --------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `-h`, `--help`                          | Show this help message and exit                                     |                                                                                             |
| `-p`, `--project-folder PROJECT_FOLDER` | The folder the project will be rendered to                          | The current working directory                                                               |
| `-d`, `--data-folder DATA_FOLDER`       | The dataset source folder                                           | `Data` folder in working directory                                                          |
| `-j`, `--job-file JOB_FILE`             | The name of the file with jobs                                      | `jobs.bat` for Windows, otherwise `jobs.sh`                                                 |
| `--prior-seed prior_seed`               | Seed of the priors                                                  | 535                                                                                         |
| `--model-seed MODEL_SEED`               | Seed of the models                                                  | 165                                                                                         |
| `--template TEMPLATE`                   | Overwrite template with template file path                          |                                                                                             |
| `--platform PLATFORM`                   | Platform to run jobs: Windows, Darwin, Linux                        | The system of rendering templates                                                           |
| `--n-runs N_RUNS`                       | Number of runs                                                      | 1                                                                                           |
| `--overwrite`                           | Automatically accepts all overwrite requests                        |                                                                                             |
| `--ai AI`                               | AI(s) to use. Multiple values can be used to simulate multiple AIs. | [Latest Ultra model of ASReview](https://asreview.readthedocs.io/en/latest/lab/models.html) |
| `--classifier CLASSIFIER`               | Classifier to use                                                   | `svm` if `--ai` not set                                                                     |
| `--feature-extractor FEATURE_EXTRACTOR` | Feature extractor to use                                            | `tfidf` if `--ai` not set                                                                   |
| `--querier QUERIER`                     | Query strategy to use                                               | `max` if `--ai` not set                                                                     |
| `--balancer BALANCE_STRATEGY`           | Balance strategy to use                                             | `balanced` if `--ai` not set                                                                |
| `--n-query n_query`                     | Number of instances per query                                       | 1                                                                                           |
| `--n-stop n_stop`                       | The number of label actions to simulate                             | Will stop simulating when all relevant records are found                                    |

#### Example usage

Put at least 2 datasets in the data folder. One starting with the `prior_`
prefix, and one without this prefix.

> note: `priors_` will also work.

```console
asreview makita template prior
```

## Advanced usage

### Create and use custom templates

It is possible to overwrite the internal templates. This can be useful for
simulation studies with different needs.

1. Select an existing template that looks similar to your needs. For example,
   you want to run ARFI with a different model, then you pick the [ARFI
   template](#arfi-template).
2. Download the template you selected in step 1 from the [Github
   repository](https://github.com/asreview/asreview-makita/tree/main/asreviewcontrib/makita/templates).
   Template files have the following structure `template_*.txt.template`. For
   the ARFI example, the template is
   [template_arfi.txt.template](https://github.com/asreview/asreview-makita/blob/main/asreviewcontrib/makita/templates/template_arfi.txt.template).
3. Save the downloaded template somewhere on your computer. The template is a
   so-called "Jinja" template. The template consists of [ASReview command line
   commands](https://asreview.readthedocs.io/en/latest/API/cli.html) combined
   with jinja syntax. The Jinja syntax is very intuitive. See this
   [Cheatsheet](https://cheatography.com/skalavala/cheat-sheets/jinja/).
4. Edit the Jinja template to your needs.
5. Run the custom template with the command line option `--template
PATH_TO_MY_TEMPLATE.txt.template`. For the ARFI example, this would be `asreview
makita template arfi --template PATH_TO_MY_TEMPLATE.txt.template`. Please keep
   in mind that you follow the usual steps for running a template.
6. A `jobs.sh` file should be in the your folder.

Please contribute your templates back to the project by making a Pull Request.
Then, we can integrate it in the core of the makita package.

### Add and use scripts

Makita can add scripts to your repository. The scripts are mainly pre- and
postprocessing scripts. These scripts are not (yet) available in any existing
ASReview software. Therefore, they can be added manually with `asreview makita
add-script NAME_OF_SCRIPT`.

For example, the results from data describe are merged via the script
`merge_descriptives.py` (or `merge_metrics.py` for _ASReview insights_), using:

1. Collect statistics (with template)
2. Run `asreview makita add-script merge_descriptives.py`
3. Run `python scripts/merge_descriptives.py`

Use `-s` (source) and `-o` (output) to tweak paths.

Some scripts are added automatically to the folder, as they are part of the
template. For example, the `get_plot.py` script is added to the generated folder
when using any template, as it is used to generate the plots.

Still, `get_plot.py` can be used on its own, as it is a standalone script. To
use it, use `-s` (source) and `-o` (output) to tweak paths.

Adding a legend to the plot can be done with the `-l` or `--show-legend` flag,
with the labels clustered on any of the following: `'filename', 'model',
'classifier', 'querier', 'balancer', 'feature_extraction'`

#### Available scripts

The following scripts are available:

- get_plot.py
- get_settings_from_state.py
- merge_descriptives.py
- merge_metrics.py
- merge_tds.py
- split_data_with_multiple_labels.py [DEPRECATED]

#### Time to Discovery Tables

The 'merge_tds.py' script creates a table of the time to discovery (TD) values
for each dataset, with each row corresponding to each record ID of the relevant
records in a dataset, and the columns correspond to each simulation run (e.g,
for the `modelmatrix` template each column corresponds to a simualtion run with
each active learning model). Additionally, the tables includes the
average-record-TD values (the average of the TD values for a record across
multiple simulation runs), and the average-simulation-TD values (the average of
the TD values across all records for a single simulation run).

#### Run Makita via Docker

To run Makita template with Docker use the following command:

```docker
docker run -v $PWD:/app ghcr.io/asreview/asreview makita <YOUR COMMAND>
```

## License

This extension is published under the [MIT license](/LICENSE).

## Contact

This extension is part of the ASReview project
([asreview.ai](https://asreview.ai)). It is maintained by the maintainers of
ASReview LAB. See [ASReview LAB](https://github.com/asreview/asreview) for
contact information and more resources.

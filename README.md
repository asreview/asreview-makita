# ASReview Makita

[ASReviews](https://github.com/asreview/asreview)' `MAKe IT Automatic (Makita)` is a workflow generator for simulation studies using the command line interface of [ASReview
LAB](https://asreview.readthedocs.io/en/latest/simulation_cli.html). Makita can be used to effortlessly generate the framework and code for your simulation study.

A simulation involves mimicking the screening process for a systematic review of a human in interaction with an Active learning model (i.e., a combination of a feature extractor, classifier,
balancing method, and a query strategy). The simulation reenacts the screening process as if a researcher were using active learning. The performance of one or multiple model(s) can then be
measured by performance metrics, such as the Work Saved over Sampling, recall at a given point in the screening process, or the average time to discover a relevant record.

Using Makita templates, different study structures can be generated to fit the needs of your very own study. If your study requires a unique template, you can create a new one and use it
instead.

In [ASReview LAB](https://github.com/asreview/asreview), a [simulation]( https://asreview.readthedocs.io/en/latest/simulation_overview.html#overview) can be run in the [web
interface](https://asreview.readthedocs.io/en/latest/simulation_overview.html#simulating-with-asreview-lab), the [Python API](https://asreview.readthedocs.io/en/latest/simulation_api_example.html), or
the [Command Line Interface]( https://asreview.readthedocs.io/en/latest/simulation_cli.html). Makita can be used only via the CLI.

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

The `jobs.sh` script is a shell script that runs all jobs in the project folder.

### Windows support

For Windows users, ASReview Makita offers support for batch files. Use the `-f` option to generate a `jobs.bat` script instead of the default `jobs.sh` script.

```console
asreview makita template basic -f jobs.bat
```

> Alternatively, Windows CMD does not support the `sh` command, and a bash shell is required. You can use tools such as Git Bash, Cygwin, WSL, etc. to run the `jobs.sh` script instead.

## Templates

The following table gives an overview of the available templates. See [Getting started](#getting-started) for instructions on usage.

> Note: If no seed is set with the template command, the default seed is used. While this is important for the reproducibility of the results, it may lead to long-term bias. To avoid seed-related bias across different simulation studies, a seed should be for the prior records and models.

### Basic template

command: `basic`

The basic template prepares a script for conducting a simulation study with one run using the default model settings, and two randomly chosen priors (one relevant and one irrelevant record).

optional arguments:

```console
  -h, --help                                       show this help message and exit
  -f OUTPUT_FILE                                   File with jobs
  -s DATA_FOLDER                                   Dataset folder
  -o OUTPUT_FOLDER                                 Output folder
  --init_seed INIT_SEED                            Seed of the priors. Seed is set by default!
  --model_seed MODEL_SEED                          Seed of the models. Seed is set by default!
  --template TEMPLATE                              Overwrite template with template file path.
  --n_runs N_RUNS                                  Number of runs
```

### ARFI template

command: `arfi`

The ARFI template (All relevant, fixed irrelevant) prepares a script for running a simulation study in such a way that for every relevant record 1 run will be executed with 10 randomly chosen irrelevant records which are kept constant over runs. When multiple datasets are available the template orders the tasks in the job file per dataset.

optional arguments:

```console
  -h, --help                                       show this help message and exit
  -f OUTPUT_FILE                                   File with jobs
  -s DATA_FOLDER                                   Dataset folder
  -o OUTPUT_FOLDER                                 Output folder
  --init_seed INIT_SEED                            Seed of the priors. Seed is set by default!
  --model_seed MODEL_SEED                          Seed of the models. Seed is set by default!
  --template TEMPLATE                              Overwrite template with template file path.
  --n_priors N_PRIORS                              Number of priors
```

### Multiple models template

command: `multiple_models`

The multiple model template prepares a script for running a simulation study comparing multiple models for one dataset and a fixed set of priors (one relevant and one irrelevant record; identical across models).

optional arguments:

```console
  -h, --help                                       Show this help message and exit
  -f OUTPUT_FILE                                   File with jobs
  -s DATA_FOLDER                                   Dataset folder
  -o OUTPUT_FOLDER                                 Output folder
  --init_seed INIT_SEED                            Seed of the priors. Seed is set by default!
  --model_seed MODEL_SEED                          Seed of the models. Seed is set by default!
  --template TEMPLATE                              Overwrite template with template file path.
  --classifiers CLASSIFIERS [CLASSIFIERS ...]                           Classifiers to use
  --feature_extractions FEATURE_EXTRACTIONS [FEATURE_EXTRACTIONS ...]   Feature extractions to use
  --impossible_models IMPOSSIBLE_MODELS [IMPOSSIBLE_MODELS ...]         Model combinations to exclude
```

The default models are:

```python
classifiers           ["logistic", "nb", "rf", "svm"]
feature_extractions   ["doc2vec", "sbert", "tfidf"]
impossible_models     [["nb", "doc2vec"], ["nb", "sbert"]]
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

#### Available scripts

The following scripts are available:

- get_plot.py
- get_settings_from_state.py
- merge_descriptives.py
- merge_metrics.py
- split_data_with_multiple_labels.py [DEPRECATED]

## License

This extension is published under the [MIT license](/LICENSE).

## Contact

This extension is part of the ASReview project ([asreview.ai](https://asreview.ai)). It is maintained by the maintainers of ASReview LAB. See [ASReview LAB](https://github.com/asreview/asreview) for
contact information and more resources.

# Simulation study

*This project was rendered with ASReview-Makita version {{ version }}.*

{% if template_name == 'custom' %}This project was rendered using a `custom` template.{%else %}This project was rendered from the Makita-{{ template_name }} template. See [asreview/asreview-makita#templates](https://github.com/asreview/asreview-makita#templates) for template rules and formats.{% endif %}

The template is described as: '{{ template_name_long }}'.

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

{% for dataset in datasets %}- {{ dataset }}
{% endfor %}
## Run simulation

{% if job_file == 'jobs.sh' %}To start the simulation, run the following command in the project directory.

```sh
sh jobs.sh
```{% else %}To start the simulation, run the `{{ job_file }}` file.{% endif %}

{% if template_name != 'custom' %}## Structure

The following files are found in this project:

    📦Makita
    ├── 📜README.md
    ├── 📜{{ job_file }}
    ├── 📂data{% for dataset in datasets %}
    │   ├── 📜{{ dataset.name }}{% endfor %}
    ├── 📂scripts{% for script in template_scripts %}
    │   ├── 📜{{ script }}{% endfor %}
    │   └── 📜...
    └── 📂{{ output_folder }}
        ├── 📂simulation{% for dataset in datasets %}
        |   └── 📂{{ dataset.stem }}
        |       ├── 📂descriptives
        |       |   └── 📜data_stats_{{ dataset.stem }}.json
        |       ├── 📂state_files
        |       |   ├── 📜sim_{{ dataset.stem }}_`x`.asreview
        |       |   └── 📜...
        |       └── 📂metrics
        |           ├── 📜metrics_sim_{{ dataset.stem }}_`x`.json
        |           └── 📜...{% endfor %}
        ├── 📂tables
        |   ├── 📜data_descriptives.csv
        |   ├── 📜data_descriptives.xlsx{% for dataset in datasets %}
        |   ├── 📜tds_sim_{{ dataset.stem }}.csv
        |   ├── 📜tds_sim_{{ dataset.stem }}.xlsx{% endfor %}
        |   ├── 📜tds_summary.csv
        |   ├── 📜tds_summary.xlsx{% for dataset in datasets %}
        |   ├── 📜metrics_sim_{{ dataset.stem }}_metrics.csv
        |   ├── 📜metrics_sim_{{ dataset.stem }}_metrics.xlsx{% endfor %}
        |   ├── 📜metrics_summary.csv
        |   └── 📜metrics_summary.xlsx
        └── 📂figures{% for dataset in datasets %}
            ├── 📈plot_recall_{{ dataset.stem }}.png{% endfor %}{% for dataset in datasets %}
            ├── 📈wordcloud_{{ dataset.stem }}.png
            ├── 📈wordcloud_relevant_{{ dataset.stem }}.png
            └── 📈wordcloud_irrelevant_{{ dataset.stem }}.png{% endfor %}
{%endif %}

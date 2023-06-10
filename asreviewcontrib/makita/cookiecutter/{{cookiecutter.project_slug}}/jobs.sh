---
name: ARFI
name_long: All Relevant, Fixed Irrelevant

scripts:
  - get_plot.py
  - merge_descriptives.py
  - merge_metrics.py
  - merge_tds.py

docs:
  - README.md

---

{# This is a template for the ARFI method #}

# version {{ cookiecutter.version }}

# Create folder structure. By default, the folder 'output' is used to store output.
mkdir {{ cookiecutter.output_folder }}
mkdir {{ cookiecutter.output_folder }}/simulation
mkdir {{ cookiecutter.output_folder }}/tables
mkdir {{ cookiecutter.output_folder }}/tables/metrics
mkdir {{ cookiecutter.output_folder }}/tables/time_to_discovery
mkdir {{ cookiecutter.output_folder }}/figures

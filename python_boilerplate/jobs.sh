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



# version 0.1.0

# Create folder structure. By default, the folder 'output' is used to store output.
mkdir output
mkdir output/simulation
mkdir output/tables
mkdir output/tables/metrics
mkdir output/tables/time_to_discovery
mkdir output/figures

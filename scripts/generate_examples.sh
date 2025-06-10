#!/bin/bash
set -e

# Use a temporary folder for examples/data
DATA_DIR=$(mktemp -d)

# Download datasets
synergy_dataset get -d van_de_Schoot_2018 Smid_2020 -o "$DATA_DIR" -l

# Rename file for prior example
mv "$DATA_DIR/Smid_2020.csv" "$DATA_DIR/prior_Smid_2020.csv"

# Generate example templates
asreview makita template arfi -d "$DATA_DIR" -p ./examples/arfi_example --overwrite --platform linux
asreview makita template basic -d "$DATA_DIR" -p ./examples/basic_example --overwrite --platform linux
asreview makita template multimodel -d "$DATA_DIR" -p ./examples/multimodel_example --overwrite --platform linux
asreview makita template prior -d "$DATA_DIR" -p ./examples/prior_example --overwrite --platform linux

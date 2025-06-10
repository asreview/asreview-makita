#!/bin/bash
set -e

# Download datasets
synergy_dataset get -d van_de_Schoot_2018 Smid_2020 -o examples/data -l

# Rename file for prior example
mv ./examples/data/Smid_2020.csv ./examples/data/prior_Smid_2020.csv

# Generate example templates
asreview makita template arfi -d ./examples/data -p ./examples/arfi_example --overwrite --platform linux
asreview makita template basic -d ./examples/data -p ./examples/basic_example --overwrite --platform linux
asreview makita template multimodel -d ./examples/data -p ./examples/multimodel_example --overwrite --platform linux
asreview makita template prior -d ./examples/data -p ./examples/prior_example --overwrite --platform linux

#!/bin/bash
set -e

export ASREVIEW_MAKITA_VERSION_OVERRIDE="1.generated.example"

# Remove all output folders from examples
rm -rf ./examples/*/output

# Use a temporary folder for examples/data
DATA_DIR=$(mktemp -d)

# Download datasets
synergy_dataset get -d van_de_Schoot_2018 Smid_2020 -o "$DATA_DIR" -l

# Generate basic, arfi, and modelmatrix examples
asreview makita template basic -d "$DATA_DIR" -p ./examples/basic_example --overwrite --platform linux
asreview makita template basic -d "$DATA_DIR" -p ./examples/basic_multi_ai_example --overwrite --platform linux --ai elas_u3 elas_u4
asreview makita template arfi -d "$DATA_DIR" -p ./examples/arfi_example --overwrite --platform linux
asreview makita template arfi -d "$DATA_DIR" -p ./examples/arfi_multi_ai_example --overwrite --platform linux --ai elas_u3 elas_u4
asreview makita template modelmatrix -d "$DATA_DIR" -p ./examples/modelmatrix_example --overwrite --platform linux

# Copy data for prior template example
PRIOR_DATA_DIR=$(mktemp -d)
cp "$DATA_DIR/van_de_Schoot_2018.csv" "$PRIOR_DATA_DIR/"
cp "$DATA_DIR/Smid_2020.csv" "$PRIOR_DATA_DIR/prior_Smid_2020.csv"

# Generate prior template example
asreview makita template prior -d "$PRIOR_DATA_DIR" -p ./examples/prior_example --overwrite --platform linux

rm -rf "$DATA_DIR" "$PRIOR_DATA_DIR"

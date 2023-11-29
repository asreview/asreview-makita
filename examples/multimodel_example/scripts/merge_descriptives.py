"""Script to merge descriptive files.

Example
-------

> python scripts/merge_descriptives.py

or

> python scripts/merge_descriptives.py -s data_descriptives

or

> python scripts/merge_descriptives.py -o my_table.json

Authors
-------
- De Bruin, Jonathan
"""

# version 0.0.0

import argparse
import glob
import json
from pathlib import Path

import pandas as pd


def create_table_descriptives(datasets):
    """Merge dataset descriptives."""

    stats = []

    for ds in datasets:
        with open(ds) as f:
            data = json.load(f)["data"]["items"]
            values = {}
            for item in data:
                values[item["id"]] = item["value"]
            stats.append(values)

    df = pd.DataFrame(stats, index=[Path(ds).name for ds in datasets])
    return df


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Merge descriptives of multiple files into single table."
    )
    parser.add_argument(
        "-s",
        type=str,
        default="output/simulation/*/descriptives/",
        help="Datasets location",
    )
    parser.add_argument(
        "-o",
        type=str,
        default="output/tables/data_descriptives_all.csv",
        help="Output table location",
    )
    args = parser.parse_args()

    # load datasets
    datasets = glob.glob(args.s + "data_stats_*.json")

    # check if states are found
    if len(datasets) == 0:
        raise FileNotFoundError("No datasets found in " + args.s)

    # merge results
    result = create_table_descriptives(datasets)

    # store result in output folder
    Path(args.o).parent.mkdir(parents=True, exist_ok=True)
    result.to_csv(Path(args.o))
    result.to_excel(Path(args.o).with_suffix(".xlsx"))

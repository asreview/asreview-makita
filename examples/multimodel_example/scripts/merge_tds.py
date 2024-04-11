"""Script to merge td files.

Example
-------

> python scripts/merge_tds.py

or

> python scripts/merge_tds.py -s output/simulation/*/metrics_sim*.json

or

> python scripts/merge_tds.py -o output/my_table.json

Authors
-------
- Teijema, Jelle
- De Bruin, Jonathan
"""

# version 0.0.0

import argparse
import glob
import json
from pathlib import Path

import pandas as pd


def create_table_state_tds(metrics):
    values = []
    file_counter = 0

    for metric in metrics:
        with open(metric) as f:
            i = next(filter(lambda x: x["id"] == "td", json.load(f)["data"]["items"]))[
                "value"
            ]  # noqa
            values.extend((item[0], item[1], file_counter) for item in i)
            file_counter += 1

    df = pd.DataFrame(values, columns=["record_id", "td", "metric_file"])
    pivoted = df.pivot_table(
        index="record_id",
        columns="metric_file",
        values="td",
        aggfunc="first",
        fill_value=0,
    )
    pivoted.columns = [f"td_sim_{col}" for col in pivoted.columns]
    return pivoted


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Merge tds of multiple metrics into single table."
    )
    parser.add_argument(
        "-s", type=str, default="output/simulation/*/metrics/", help="metrics location"
    )
    parser.add_argument(
        "-o",
        type=str,
        default="output/tables/tds_sim_all.csv",
        help="Output table location",
    )
    args = parser.parse_args()

    # load metric files
    metric_files = glob.glob(args.s + "metrics_sim_*.json")

    # check if states are found
    if len(metric_files) == 0:
        raise FileNotFoundError("No metrics found in " + args.s)

    states_table = create_table_state_tds(metric_files)

    # store table
    Path(args.o).parent.mkdir(parents=True, exist_ok=True)
    states_table.to_csv(Path(args.o))
    states_table.to_excel(Path(args.o).with_suffix(".xlsx"))

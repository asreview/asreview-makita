"""Script to describe the properties of the dataset.

Example
-------

> python scripts/data_describe.py

or

> python scripts/data_describe.py -s my_csv.csv -o my_stats.json


Authors
-------
- Datatools authors
"""

# version 1.generated.example

import argparse
import json
from pathlib import Path

import asreview
import numpy as np
from asreview import load_dataset
from asreview.data.utils import duplicated

from asreviewcontrib.makita import __version__


def describe(input_path, output_path=None):
    # read data in ASReview data object
    asdata = load_dataset(input_path)[["included", "title", "abstract", "doi", "url"]]

    # based on https://google.github.io/styleguide/jsoncstyleguide.xml
    stats = {
        "asreviewVersion": asreview.__version__,
        "apiVersion": __version__,
        "data": {
            "items": [
                {
                    "id": "n_records",
                    "title": "Number of records",
                    "description": "The number of records in the dataset.",
                    "value": len(asdata),
                },
                {
                    "id": "n_relevant",
                    "title": "Number of relevant records",
                    "description": "The number of relevant records in the dataset.",
                    "value": len(np.where(asdata.included == 1)[0]),
                },
                {
                    "id": "n_irrelevant",
                    "title": "Number of irrelevant records",
                    "description": "The number of irrelevant records in the dataset.",
                    "value": len(np.where(asdata.included == 0)[0]),
                },
                {
                    "id": "n_unlabeled",
                    "title": "Number of unlabeled records",
                    "description": "The number of unlabeled records in the dataset.",
                    "value": len(asdata)
                    - len(np.where(asdata.included == 1)[0])
                    - len(np.where(asdata.included == 0)[0]),
                },
                {
                    "id": "n_missing_title",
                    "title": "Number of records with missing title",
                    "description": (
                        "The number of records in the dataset with missing title."
                    ),
                    "value": int(asdata.title.isnull().sum()),
                },
                {
                    "id": "n_missing_abstract",
                    "title": "Number of records with missing abstract",
                    "description": (
                        "The number of records in the dataset with missing abstract."
                    ),
                    "value": int(asdata.abstract.isnull().sum()),
                },
                {
                    "id": "n_duplicates",
                    "title": "Number of duplicate records (basic algorithm)",
                    "description": (
                        "The number of duplicate records in the dataset based on"
                        " similar text."
                    ),
                    "value": int(duplicated(asdata).sum()),
                },
            ]
        },
    }  # noqa

    if output_path:
        Path(output_path).parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, "w") as f:
            json.dump(stats, f, indent=2)
    else:
        print(json.dumps(stats, indent=2))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("input_path", type=str, help="The file path of the dataset.")
    parser.add_argument(
        "--output-path",
        "-o",
        default=None,
        type=str,
        help="The file path of the dataset.",
    )

    args = parser.parse_args()
    describe(args.input_path, args.output_path)

"""Script to get dataset sorted on the average time to discovery.

Example
-------

> python scripts/get_plot.py

or

> python scripts/get_plot.py -s output/simulation/ptsd/state_files -o output/simulation/ptsd/ptsd_recall_plot.png


Authors
-------
- Teijema, Jelle
"""

# version 0+unknown

import argparse
from pathlib import Path
import matplotlib.pyplot as plt

from asreview import open_state
from asreviewcontrib.insights.plot import plot_recall


def get_plot_from_states(state_path, filename):
    """Generate an ASReview plot from state files."""

    fig, ax = plt.subplots()

    for state_file in Path(state_path).glob("*.asreview"):
        with open_state(state_file) as state:
            plot_recall(ax, state)

    fig.savefig(str(filename))


if __name__ == "__main__":

    parser = argparse.ArgumentParser(
        description="Generate an ASReview plot from the found state files."
    )
    parser.add_argument(
        "-s",
        type=str,
        help="States location")
    parser.add_argument(
        "-o",
        type=str,
        help="Output location")
    args = parser.parse_args()

    # generate plot and save results
    get_plot_from_states(args.s, args.o)

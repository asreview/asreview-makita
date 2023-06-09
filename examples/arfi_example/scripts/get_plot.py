"""Script to get dataset sorted on the average time to discovery.

Example
-------

> python scripts/get_plot.py

or

> python scripts/get_plot.py -s asreview_files -o plot.png


Authors
-------
- Teijema, Jelle
"""

# version 0.0.0

import argparse
from pathlib import Path

import matplotlib.colors as mcolors
import matplotlib.pyplot as plt
from asreview import open_state

from asreviewcontrib.insights.plot import plot_recall


def get_plot_from_states(states, filename, legend=None):
    """Generate an ASReview plot from state files."""

    fig, ax = plt.subplots()

    labels = []
    colors = list(mcolors.TABLEAU_COLORS.values())

    for state_file in states:
        with open_state(state_file) as state:
            # draw the plot
            plot_recall(ax, state)

            # set the label
            if legend == "filename":
                ax.lines[-2].set_label(state_file.stem)
                ax.legend(loc=4, prop={"size": 8})
            elif legend:
                metadata = state.settings_metadata

                if legend == "model":
                    label = " - ".join(
                        [
                            metadata["settings"]["model"],
                            metadata["settings"]["feature_extraction"],
                            metadata["settings"]["balance_strategy"],
                            metadata["settings"]["query_strategy"],
                        ]
                    )
                elif legend == "classifier":
                    label = metadata["settings"]["model"]
                else:
                    try:
                        label = metadata["settings"][legend]
                    except KeyError as exc:
                        raise ValueError(
                            f"Legend setting '{legend}' "
                            "not found in state file settings."
                        ) from exc
                if label not in labels:
                    ax.lines[-2].set_label(label)
                    labels.append(label)
                ax.lines[-2].set_color(colors[labels.index(label) % len(colors)])
                ax.legend(loc=4, prop={"size": 8})

    fig.savefig(str(filename))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate an ASReview plot from the found state files."
    )
    parser.add_argument("-s", type=str, help="States location")
    parser.add_argument("-o", type=str, help="Output location")
    parser.add_argument(
        "--show_legend",
        "-l",
        type=str,
        help="Add a legend to the plot, based on the given parameter.",
    )
    args = parser.parse_args()

    # load states
    states = Path(args.s).glob("*.asreview")

    # check if states are found
    if len(list(states)) == 0:
        raise FileNotFoundError(f"No state files found in {args.s}")

    # generate plot and save results
    get_plot_from_states(states, args.o, args.show_legend)

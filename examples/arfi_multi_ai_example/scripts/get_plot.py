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

# version 1.generated.example

import argparse
from pathlib import Path

import matplotlib.pyplot as plt
from asreview import open_state

from asreviewcontrib.insights.plot import plot_recall


def _set_legend(
    ax, state, legend_option, label_to_line, state_file, hide_random, hide_optimal
):
    label = None

    if legend_option == "filename":
        label = state_file.stem
    elif legend_option == "model":
        metadata = state.get_results_table().tail(1).to_dict(orient="records")[0]
        label = " - ".join(
            [
                metadata["classifier"],
                metadata["feature_extractor"],
                metadata["balancer"],
                metadata["querier"],
            ]
        )
    elif legend_option == "classifier":
        metadata = state.get_results_table().tail(1).to_dict(orient="records")[0]
        label = metadata["classifier"]
    else:
        try:
            metadata = state.get_results_table().tail(1).to_dict(orient="records")[0]
            label = metadata[legend_option]
        except KeyError as err:
            raise ValueError(f"Invalid legend setting: '{legend_option}'") from err  # noqa: E501

    if label:
        # plot_recall: series is plotted first, then random and optimal, so adjust index
        line_index = -3 + hide_random + hide_optimal
        # add label to line
        if label not in label_to_line:
            ax.lines[line_index].set_label(label)
            label_to_line[label] = ax.lines[line_index]
        # set color of line to the color of the first line with the same label
        else:
            ax.lines[line_index].set_color(label_to_line[label].get_color())
            ax.lines[line_index].set_label("_no_legend_")


def get_plot_from_states(
    states, filename, legend=None, hide_random=False, hide_optimal=False
):
    """Generate an ASReview plot from state files.

    Arguments
    ---------
    states: list
        List of state files.
    filename: str
        Filename of the plot.
    legend: str
        Add a legend to the plot, based on the given parameter.
        Possible values: "filename", "model", "feature_extraction",
        "balancer", "querier", "classifier".
    """
    states = sorted(states)
    fig, ax = plt.subplots()
    label_to_line = {}

    for state_file in states:
        plot_recall(
            ax, state_file, show_random=not hide_random, show_optimal=not hide_optimal
        )
        if legend:
            with open_state(state_file) as state:
                _set_legend(
                    ax,
                    state,
                    legend,
                    label_to_line,
                    state_file,
                    hide_random,
                    hide_optimal,
                )

    if legend:
        ax.legend(loc=4, prop={"size": 8})
    fig.savefig(str(filename))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate an ASReview plot from the found state files."
    )
    parser.add_argument("-s", type=str, help="States location")
    parser.add_argument("-o", type=str, help="Output location")
    parser.add_argument(
        "--show-legend",
        "-l",
        type=str,
        help="Add a legend to the plot, based on the given parameter.",
    )
    parser.add_argument(
        "--hide-random",
        action="store_true",
        help="Hide the random line.",
    )
    parser.add_argument(
        "--hide-optimal",
        action="store_true",
        help="Hide the optimal line.",
    )
    args = parser.parse_args()

    # load states
    states = list(Path(args.s).glob("*.asreview"))

    # check if states are found
    if len(states) == 0:
        raise FileNotFoundError(f"No state files found in {args.s}")

    # generate plot and save results
    get_plot_from_states(
        states, args.o, args.show_legend, args.hide_random, args.hide_optimal
    )

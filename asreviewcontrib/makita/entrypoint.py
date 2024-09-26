import argparse
import os
from pathlib import Path

from asreview import config as ASREVIEW_CONFIG
from asreview.entry_points import BaseEntryPoint
from asreview.utils import _entry_points

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.config import TEMPLATES_FP
from asreviewcontrib.makita.utils import FileHandler


class MakitaEntryPoint(BaseEntryPoint):
    # backward compat?
    description = "Makita functionality for ASReview datasets."
    extension_name = "asreview-makita"

    def execute(self, argv):  # noqa: C901
        # get tool and version number

        # create the top-level parser
        parser = argparse.ArgumentParser(prog="asreview makita")
        parser.add_argument(
            "-V",
            "--version",
            action="version",
            version=__version__,
        )
        subparsers = parser.add_subparsers(required=True)

        parser_template = subparsers.add_parser("template")
        parser_template.add_argument("name", type=str, help="The name of the template.")
        parser_template.add_argument(
            "--job_file",
            "-f",
            type=str,
            help="The name of the file with jobs. Default "
            "jobs.bat for Windows, otherwise jobs.sh.",
        )
        parser_template.add_argument(
            "-s", type=str, default="data", help="Dataset folder"
        )
        parser_template.add_argument(
            "-o", type=str, default="output", help="Output folder"
        )
        parser_template.add_argument(
            "--init_seed",
            type=int,
            default=535,
            help="Seed of the priors. 535 by default.",
        )
        parser_template.add_argument(
            "--model_seed",
            type=int,
            default=165,
            help="Seed of the models. 165 by default.",
        )
        parser_template.add_argument(
            "--template", type=str, help="Overwrite template with template file path."
        )
        parser_template.add_argument(
            "--platform",
            type=str,
            help="Platform to run jobs: Windows, Darwin, Linux. "
            "Default: the system of rendering templates.",
        )
        parser_template.add_argument(
            "--instances_per_query",
            type=int,
            default=ASREVIEW_CONFIG.DEFAULT_N_INSTANCES,
            help="Number of instances per query.",
        )
        parser_template.add_argument(
            "--stop_if",
            type=str,
            default="min",
            help="The number of label actions to simulate.",
        )
        parser_template.add_argument(
            "--n_runs",
            type=int,
            help="Number of runs.",
        )
        parser_template.add_argument(
            "--n_priors",
            type=int,
            help="Number of priors.",
        )
        parser_template.add_argument(
            "--skip_wordclouds",
            action="store_true",
            help="Disables the generation of wordclouds.",
        )
        parser_template.add_argument(
            "--overwrite",
            action="store_true",
            help="Overwrite existing files in the output folder.",
        )
        parser_template.add_argument(
            "--classifier",
            type=str,
            help="Classifier to use.",
        )
        parser_template.add_argument(
            "--feature_extractor",
            type=str,
            help="Feature_extractor to use.",
        )
        parser_template.add_argument(
            "--query_strategy",
            type=str,
            help="Query strategy to use.",
        )
        parser_template.add_argument(
            "--balance_strategy",
            type=str,
            help="Balance strategy to use.",
        )
        parser_template.add_argument(
            "--classifiers",
            nargs="+",
            help="Classifiers to use.",
        )
        parser_template.add_argument(
            "--feature_extractors",
            nargs="+",
            help="Feature extractors to use.",
        )
        parser_template.add_argument(
            "--query_strategies",
            nargs="+",
            help="Query strategies to use.",
        )
        parser_template.add_argument(
            "--balance_strategies",
            nargs="+",
            help="Balancing strategies to use.",
        )
        parser_template.add_argument(
            "--impossible_models",
            nargs="+",
            help="Model combinations to exclude.",
        )

        parser_template.set_defaults(func=self._template_cli)

        parser_script = subparsers.add_parser("add-script")
        parser_script.add_argument(
            "name", type=str, nargs="?", help="The name of the script."
        )
        parser_script.add_argument(
            "--all", "-a", action="store_true", help="Add all scripts."
        )
        parser_script.add_argument(
            "-o",
            type=str,
            default="scripts",
            help="Location of the scripts folder.",
        )
        parser_script.set_defaults(func=self._add_script_cli)

        # parse the args and call the selected function
        args = parser.parse_args(argv)
        args.func(args)

    def _template_cli(self, args):
        try:
            self._template(args)
        except Exception as err:
            print(f"\u001b[31mERROR: {err}\u001b[0m")

    def _template(self, args):
        """Generate a template."""

        # lowercase name
        args.name = args.name.lower()

        # check if args.name is in _entry_points
        if args.name not in _entry_points(group="asreview.makita.templates").names:
            raise ValueError(f"Template {args.name} not found.")

        # if a custom template is provided, check if it exists
        if args.template:
            fp_template = Path(args.template)
            if not fp_template.is_file():
                raise ValueError(f"Custom template {args.template} not found")
            print(
                f"\033[33mRendering custom template {args.template} using {args.name}.\u001b[0m\n"  # noqa: E501
            )
        else:
            fp_template = None
            print(f"\033[33mRendering template {args.name}.\u001b[0m\n")

        # load datasets
        datasets = (
            list(Path(args.s).glob("*.csv"))
            + list(Path(args.s).glob("*.ris"))
            + list(Path(args.s).glob("*.xlsx"))
        )

        # throw exception if no datasets are found
        if len(datasets) == 0:
            raise ValueError("No datasets found in the selected data folder.")

        # create output folder
        Path(args.o).parent.mkdir(parents=True, exist_ok=True)

        # get job file
        if args.job_file is None:
            if args.platform == "Windows" or (
                args.platform is None and os.name == "nt"
            ):  # noqa: E501
                args.job_file = "jobs.bat"
            else:
                args.job_file = "jobs.sh"

        # load template
        template = _entry_points(group="asreview.makita.templates")[args.name].load()

        keys_of_interest = [
            "skip_wordclouds",
            "overwrite",
            "n_runs",
            "n_priors",
            "init_seed",
            "model_seed",
            "classifier",
            "feature_extractor",
            "query_strategy",
            "balance_strategy",
            "classifiers",
            "feature_extractors",
            "query_strategies",
            "balance_strategies",
            "impossible_models",
            "instances_per_query",
            "stop_if",
            "job_file",
        ]

        job = template(
            datasets=datasets,
            fp_template=fp_template,
            output_folder=Path(args.o),
            scripts_folder=Path("scripts"),
            **{key: vars(args)[key] for key in keys_of_interest if key in vars(args)},
        ).render()

        # convert shell to batch if needed
        if args.job_file.endswith(".bat"):
            job = f"@ echo off\nCOLOR E0{job}"
            job = job.replace("#", "::")
            job = job.replace("/", "\\")

        # store result in output folder
        with open(args.job_file, "w") as f:
            f.write(job)
        print(f"Rendered template {args.name} and saved to {args.job_file}")

    def _add_script_cli(self, args):
        try:
            self._add_script(args)
        except Exception as err:
            print(f"\u001b[31mERROR: {err}\u001b[0m")

    def _add_script(self, args):
        # initialize file handler
        self.file_handler = FileHandler()

        tmp_scripts = []
        if args.all:
            tmp_scripts = [
                p.name[7:-9] for p in Path(TEMPLATES_FP).glob("script_*.template")
            ]
        else:
            tmp_scripts = [args.name]

        for script in tmp_scripts:
            params = {}
            new_script = self.file_handler.render_file_from_template(
                script, "script", **params
            )

            # export script
            export_fp = Path(args.o, script)
            self.file_handler.add_file(new_script, export_fp)
        self.file_handler.print_summary()

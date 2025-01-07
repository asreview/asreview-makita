import argparse
import os
import shutil
from dataclasses import dataclass
from pathlib import Path
from typing import Optional

from asreview import config as ASREVIEW_CONFIG
from asreview.entry_points import BaseEntryPoint
from asreview.utils import _entry_points

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.config import TEMPLATES_FP
from asreviewcontrib.makita.utils import FileHandler


class MakitaEntryPoint(BaseEntryPoint):
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
            "-j",
            type=str,
            help="The name of the file with jobs. Default "
            "jobs.bat for Windows, otherwise jobs.sh.",
        )
        parser_template.add_argument(
            "--data_folder",
            "-d",
            type=str,
            default="data",
            help="Dataset source folder. "
            "Default will use the `data` folder in the current directory as source.",
        )
        parser_template.add_argument(
            "--project_folder",
            "-p",
            type=str,
            help="Set project folder path." "Default will use current directory.",
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
            "--output",
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
            template_renderer = TemplateRenderer(args)
            template_renderer.render_template()
        except Exception as err:
            print(f"\u001b[31mERROR: {err}\u001b[0m")

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
            export_fp = Path(args.output, script)
            self.file_handler.add_file(new_script, export_fp)
        self.file_handler.print_summary()


class TemplateRenderer:
    def __init__(self, args):
        self.args = args
        self.paths = self._setup_project_folder()
        self.datasets = self._load_datasets()

    def render_template(self):
        """Main function to render the template."""
        template_class = self._get_template_class(self.args.name.lower())
        fp_custom_template = self._get_custom_template(self.args.template)
        file_handler = FileHandler(self.args.overwrite)

        job = template_class(
            datasets=self.datasets,
            fp_template=fp_custom_template,
            file_handler=file_handler,
            paths=self.paths,
            **self._get_template_args(),
        ).render()

        job = self._convert_job_for_platform(job)

        file_handler.add_file(content=job, export_fp=self.paths.job_file_path)
        file_handler.print_summary()

    def _convert_job_for_platform(self, job):
        if self.paths.job_file_path.suffix == ".bat":
            job = f"@ echo off\nCOLOR E0{job}".replace("#", "::").replace("/", "\\")
        return job

    def _get_template_class(self, template_name):
        """Validate and load the template."""
        entry_points = _entry_points(group="asreview.makita.templates")
        if template_name not in entry_points.names:
            raise ValueError(f"Template {template_name} not found.")
        return entry_points[template_name].load()

    def _get_custom_template(self, template_path):
        """Check for a custom template file."""
        if template_path:
            fp_template = Path(template_path)
            if not fp_template.is_file():
                raise ValueError(f"Custom template {template_path} not found.")
            print(f"Using custom template: {fp_template}")
            return fp_template
        print("Using default template.")
        return None

    def _setup_project_folder(self):
        """Set up project folder paths."""

        paths = ProjectPaths(
            project_folder=Path(self.args.project_folder or Path.cwd()),
            output_folder="output",
            data_folder="data",
            scripts_folder="scripts",
            job_file=self.args.job_file,
            platform=self.args.platform,
        )

        paths.output_folder_path.mkdir(parents=True, exist_ok=True)
        paths.data_folder_path.mkdir(parents=True, exist_ok=True)
        paths.scripts_folder_path.mkdir(parents=True, exist_ok=True)

        return paths

    def _load_datasets(self):
        """Load and validate datasets, returning files from the new location."""
        source_path = Path(self.args.data_folder)

        datasets = (
            list(source_path.glob("*.csv"))
            + list(source_path.glob("*.ris"))
            + list(source_path.glob("*.xlsx"))
        )

        if not datasets:
            raise ValueError("No datasets found in the selected data folder.")

        copied_files = []
        for dataset in datasets:
            target_path = self.paths.data_folder_path / dataset.name
            if source_path != self.paths.data_folder_path:
                shutil.copyfile(dataset, target_path)
            copied_files.append(target_path)

        return copied_files

    def _get_template_args(self):
        """Extract relevant arguments for the template."""
        args_to_pass = [
            "skip_wordclouds",
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
        ]
        return {
            key: vars(self.args).get(key)
            for key in args_to_pass
            if key in vars(self.args)
        }


@dataclass
class ProjectPaths:
    project_folder: Path = Path.cwd()
    output_folder: str = "output"
    data_folder: str = "data"
    scripts_folder: str = "scripts"
    job_file: Optional[str] = None
    platform: Optional[str] = None

    def __post_init__(self):
        if self.job_file is None:
            if (self.platform and self.platform.lower() == "windows") or (
                self.platform is None and os.name == "nt"
            ):
                self.job_file = "jobs.bat"
            else:
                self.job_file = "jobs.sh"

    @property
    def output_folder_path(self):
        return self.project_folder / self.output_folder

    @property
    def data_folder_path(self):
        return self.project_folder / self.data_folder

    @property
    def scripts_folder_path(self):
        return self.project_folder / self.scripts_folder

    @property
    def job_file_path(self):
        return self.project_folder / self.job_file

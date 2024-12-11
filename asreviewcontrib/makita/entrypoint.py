import argparse
import os
import shutil
from dataclasses import dataclass
from pathlib import Path

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
            "-f",
            type=str,
            help="The name of the file with jobs. Default "
            "jobs.bat for Windows, otherwise jobs.sh.",
        )
        parser_template.add_argument(
            "--source",
            "-s",
            type=str,
            default="data",
            help="Dataset source folder. "
            "If not set, will use the `data` folder in the current directory as source.",
        )
        parser_template.add_argument(
            "--project_folder",
            "-p",
            type=str,
            help="Set project folder path." "If not set, will use current directory.",
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
        template_name = self.args.name.lower()
        template = self._get_template(template_name)
        fp_custom_template = self._get_custom_template(self.args.template)

        job = template(
            datasets=self.datasets,
            fp_template=fp_custom_template,
            project_folder=self.paths.project_folder,
            output_folder=self.paths.output_folder,
            scripts_folder=self.paths.scripts_folder,
            job_file=self.paths.job_file_path,
            **self._get_template_args(),
        ).render()

        self._save_job(job)

    def _get_template(self, template_name):
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
        project_folder = Path(self.args.project_folder or Path.cwd())
        output_folder = project_folder / "output"
        data_folder = project_folder / "data"
        scripts_folder = project_folder / "scripts"
        job_file_path = project_folder / (
            self.args.job_file or self._get_job_file_name()
        )

        output_folder.mkdir(parents=True, exist_ok=True)
        data_folder.mkdir(parents=True, exist_ok=True)
        scripts_folder.mkdir(parents=True, exist_ok=True)

        return ProjectFolders(
            project_folder, output_folder, data_folder, scripts_folder, job_file_path
        )

    def _load_datasets(self):
        """Load and validate datasets."""
        source_path = Path(self.args.source)
        data_folder = self.paths.data_folder

        datasets = (
            list(source_path.glob("*.csv"))
            + list(source_path.glob("*.ris"))
            + list(source_path.glob("*.xlsx"))
        )
        if not datasets:
            raise ValueError("No datasets found in the selected data folder.")

        if source_path != data_folder:
            for dataset in datasets:
                shutil.copyfile(dataset, data_folder / dataset.name)

        return datasets

    def _get_job_file_name(self):
        """Determine the job file name based on the platform."""
        if self.args.platform == "Windows" or (
            self.args.platform is None and os.name == "nt"
        ):
            return "jobs.bat"
        return "jobs.sh"

    def _get_template_args(self):
        """Extract relevant arguments for the template."""
        args_to_pass = [
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
        ]
        return {
            key: vars(self.args).get(key)
            for key in args_to_pass
            if key in vars(self.args)
        }

    def _save_job(self, job: str):
        """Save the rendered job file."""
        job_file_path = self.paths.job_file_path
        if job_file_path.suffix == ".bat":
            job = f"@ echo off\nCOLOR E0{job}".replace("#", "::").replace("/", "\\")
        with open(job_file_path, "w") as f:
            f.write(job)
        print(f"Saved rendered job to: {job_file_path}")


@dataclass
class ProjectFolders:
    project_folder: Path
    output_folder: Path
    data_folder: Path
    scripts_folder: Path
    job_file_path: Path

import argparse
import os
from pathlib import Path

from asreview.entry_points import BaseEntryPoint

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.config import TEMPLATES_FP
from asreviewcontrib.makita.template_arfi import render_jobs_arfi
from asreviewcontrib.makita.template_basic import render_jobs_basic
from asreviewcontrib.makita.template_multimodel import render_jobs_multimodel
from asreviewcontrib.makita.utils import FileHandler


def _get_template_fp(name):
    return Path(TEMPLATES_FP, f"template_{name}.txt.template")


def _is_valid_template(fp):
    if fp and Path(fp).is_file():
        return True
    else:
        raise ValueError(f"Template {fp} not found")


def _shell_to_batch(job):
    job = f"@ echo off\nCOLOR E0{job}"
    job = job.replace("#", "::")
    job = job.replace("/", "\\")
    return job


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
            help="Seed of the priors. Seed is set to 535 by default.",
        )
        parser_template.add_argument(
            "--model_seed",
            type=int,
            default=165,
            help="Seed of the models. Seed is set to 165 by default.",
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
            "--n_runs",
            type=int,
            default=1,
            help="Number of runs. Only for templates 'basic' and 'multimodel'. "
            "Default: 1.",
        )
        parser_template.add_argument(
            "--n_priors",
            type=int,
            default=10,
            help="Number of priors. Only for template 'arfi'. "
            "Default: 10.",
        )
        parser_template.add_argument(
            "--no_wordclouds",
            action="store_false",
            help="Disables the generation of wordclouds. "
        )
        parser_template.add_argument(
            "--classifier",
            type=str,
            default="nb",
            help="Classifier to use. Only for template 'basic' and 'arfi'. "
            "Default: nb.",
        )
        parser_template.add_argument(
            "--feature_extractor",
            type=str,
            default="tfidf",
            help="Feature_extractor to use. Only for template 'basic' and 'arfi'. "
            "Default: tfidf.",
        )
        parser_template.add_argument(
            "--query_strategy",
            type=str,
            default="max",
            help="Query strategy to use. "
            "Default: max.",
        )
        parser_template.add_argument(
            "--balance_strategy",
            type=str,
            default="double",
            help="Balance strategy to use. "
            "Default: double.",
        )
        parser_template.add_argument(
            "--instances_per_query",
            type=int,
            default=1,
            help="Number of instances per query. "
            "Default: 1.",
        )
        parser_template.add_argument(
            "--stop_if",
            type=str,
            default="min",
            help="The number of label actions to simulate. "
            "Default 'min' will stop simulating when all relevant records are found.",
        )
        parser_template.add_argument(
            "--classifiers",
            nargs="+",
            default=["logistic", "nb", "rf", "svm"],
            help="Classifiers to use. Only for template 'multimodel'. "
            "Default: ['logistic', 'nb', 'rf', 'svm']",
        )
        parser_template.add_argument(
            "--feature_extractors",
            nargs="+",
            default=["doc2vec", "sbert", "tfidf"],
            help="Feature extractors to use. Only for template 'multimodel'. "
            "Default: ['doc2vec', 'sbert', 'tfidf']",
        )
        parser_template.add_argument(
            "--impossible_models",
            nargs="+",
            default=["nb,doc2vec", "nb,sbert"],
            help="Model combinations to exclude. Only for template 'multimodel'. "
            "Default: ['nb,doc2vec', 'nb,sbert']",
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
            "-o", type=str, default="scripts", help="Location of the scripts folder."
        )
        parser_script.set_defaults(func=self._add_script_cli)

        # parse the args and call whatever function was selected
        args = parser.parse_args(argv)
        args.func(args)

    def _template_cli(self, args):
        try:
            self._template(args)
        except Exception as err:
            print(f"\u001b[31mERROR: {err}\u001b[0m")

    def _template(self, args):
        """Generate a template."""

        # backwards compatibility for 'multiple_models'
        if args.name == "multiple_models":
            args.name = "multimodel"

        # check if a custom template is used, otherwise use the default template
        fp_template = args.template or (args.name and _get_template_fp(args.name))
        _is_valid_template(fp_template)

        # load datasets
        datasets = (
            list(Path(args.s).glob("*.csv"))
            + list(Path(args.s).glob("*.ris"))
            + list(Path(args.s).glob("*.xlsx"))
        )

        # throw exception if no datasets are found
        if len(datasets) == 0:
            raise ValueError("No datasets found in the specified folder.")

        # create output folder
        Path(args.o).parent.mkdir(parents=True, exist_ok=True)

        if args.name in ["basic"]:
            # render jobs
            job = render_jobs_basic(
                datasets,
                output_folder=Path(args.o),
                create_wordclouds=args.no_wordclouds,
                n_runs=args.n_runs,
                init_seed=args.init_seed,
                model_seed=args.model_seed,
                classifier=args.classifier,
                feature_extractor=args.feature_extractor,
                query_strategy=args.query_strategy,
                balance_strategy=args.balance_strategy,
                instances_per_query=args.instances_per_query,
                stop_if=args.stop_if,
                fp_template=fp_template,
                job_file=args.job_file,
                platform_sys=args.platform,
            )

        elif args.name in ["arfi"]:
            # render jobs
            job = render_jobs_arfi(
                datasets,
                output_folder=Path(args.o),
                create_wordclouds=args.no_wordclouds,
                n_priors=args.n_priors,
                init_seed=args.init_seed,
                model_seed=args.model_seed,
                classifier=args.classifier,
                feature_extractor=args.feature_extractor,
                query_strategy=args.query_strategy,
                balance_strategy=args.balance_strategy,
                instances_per_query=args.instances_per_query,
                stop_if=args.stop_if,
                fp_template=fp_template,
                job_file=args.job_file,
                platform_sys=args.platform,
            )

        elif args.name in ["multimodel"]:
            # render jobs
            job = render_jobs_multimodel(
                datasets,
                output_folder=Path(args.o),
                create_wordclouds=args.no_wordclouds,
                n_runs=args.n_runs,
                init_seed=args.init_seed,
                model_seed=args.model_seed,
                all_classifiers=args.classifiers,
                all_feature_extractors=args.feature_extractors,
                impossible_models=args.impossible_models,
                query_strategy=args.query_strategy,
                balance_strategy=args.balance_strategy,
                instances_per_query=args.instances_per_query,
                stop_if=args.stop_if,
                fp_template=fp_template,
                job_file=args.job_file,
                platform_sys=args.platform,
            )

        else:
            # render jobs
            job = render_jobs_basic(
                datasets,
                output_folder=Path(args.o),
                init_seed=args.init_seed,
                model_seed=args.model_seed,
                fp_template=fp_template,
                job_file=args.job_file,
                platform_sys=args.platform,
            )

        if args.platform == "Windows" or (args.platform is None and os.name == "nt"):
            job = _shell_to_batch(job)
            job_file = "jobs.bat" if args.job_file is None else args.job_file
        else:
            job_file = "jobs.sh" if args.job_file is None else args.job_file

        # store result in output folder
        with open(job_file, "w") as f:
            f.write(job)
        print(f"Rendered template {args.name} and saved to {job_file}")

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

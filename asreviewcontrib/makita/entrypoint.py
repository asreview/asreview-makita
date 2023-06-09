import argparse
from pathlib import Path

from asreview.entry_points import BaseEntryPoint

from asreviewcontrib.makita.config import TEMPLATES_FP
from asreviewcontrib.makita.template_arfi import render_jobs_arfi
from asreviewcontrib.makita.template_basic import render_jobs_basic
from asreviewcontrib.makita.template_multiple_models import render_jobs_multiple_models
from asreviewcontrib.makita.utils import FileHandler


def get_template_fp(name):
    return Path(TEMPLATES_FP, f"template_{name}.txt.template")


def is_valid_template(fp):
    if Path(fp).is_file():
        return True
    else:
        raise ValueError(f"Template {fp} not found")


def _valid_job_file(param):
    ext = Path(param).suffix
    if ext.lower() not in (".sh", ".bat", ".yaml"):
        raise argparse.ArgumentTypeError("File must have a .sh, .bat, .yaml extension")
    return param


def _shell_to_batch(job):
    job = f"@ echo off\nCOLOR E0{job}"
    job = job.replace("#", "::")
    job = job.replace("/", "\\")
    return job


class MakitaEntryPoint(BaseEntryPoint):
    description = "Makita functionality for ASReview datasets."
    extension_name = "asreview-makita"

    def __init__(self):
        from asreviewcontrib.makita.__init__ import __version__

        super().__init__()

        self.version = __version__

    def execute(self, argv):  # noqa: C901
        # get tool and version number
        parser = _parse_arguments_program(self.version)
        args_program, args_name = parser.parse_known_args(argv)

        # Main entry point of the program, routing to either the 'template' 
        # or 'add-script' functions based on user input.

        # route to template
        if args_program.tool == "template":
            try:
                self._template(args_name, args_program)
            except Exception as err:
                print(f"\u001b[31mERROR: {err}\u001b[0m")
        # route to add-script
        elif args_program.tool == "add-script":
            self._add_script(args_name, args_program)
        # error if tool is not recognized
        else:
            parser.error(
                f"Error: Can't find '{args_program.tool}' "
                f"and '{args_program.name}'. Check spelling."
            )

    def _template(self, args_name, args_program):
        '''Generate a template.'''

        # generate arguments used for all templates
        parser = _parse_arguments_template()

        # template specific arguments
        if args_program.name in ["basic", "multiple_models"]:
            parser.add_argument("--n_runs", type=int, default=1, help="Number of runs")
        if args_program.name in ["arfi"]:
            parser.add_argument(
                "--n_priors", type=int, default=10, help="Number of priors"
            )
        if args_program.name in ["multiple_models"]:
            parser.add_argument(
                "--classifiers",
                nargs="+",
                default=["logistic", "nb", "rf", "svm"],
                help="Classifiers to use",
            )
            parser.add_argument(
                "--feature_extractors",
                nargs="+",
                default=["doc2vec", "sbert", "tfidf"],
                help="Feature extractors to use",
            )
            parser.add_argument(
                "--impossible_models",
                nargs="+",
                default=["nb,doc2vec", "nb,sbert"],
                help="Model combinations to exclude",
            )

        # parse arguments
        args = parser.parse_args(args_name)

        # check if a custom template is used, otherwise use the default template
        fp_template = args.template or get_template_fp(args_program.name)
        is_valid_template(fp_template)

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

        if args_program.name in ["basic"]:
            # render jobs
            job = render_jobs_basic(
                datasets,
                output_folder=Path(args.o),
                n_runs=args.n_runs,
                init_seed=args.init_seed,
                model_seed=args.model_seed,
                fp_template=fp_template,
                job_file=args.f,
            )

        elif args_program.name in ["arfi"]:
            # render jobs
            job = render_jobs_arfi(
                datasets,
                output_folder=Path(args.o),
                n_priors=args.n_priors,
                init_seed=args.init_seed,
                model_seed=args.model_seed,
                fp_template=fp_template,
                job_file=args.f,
            )

        elif args_program.name in ["multiple_models"]:
            # render jobs
            job = render_jobs_multiple_models(
                datasets,
                output_folder=Path(args.o),
                n_runs=args.n_runs,
                init_seed=args.init_seed,
                model_seed=args.model_seed,
                all_classifiers=args.classifiers,
                all_feature_extractors=args.feature_extractors,
                impossible_models=args.impossible_models,
                fp_template=fp_template,
                job_file=args.f,
            )

        else:
            # render jobs
            job = render_jobs_basic(
                datasets,
                output_folder=Path(args.o),
                init_seed=args.init_seed,
                model_seed=args.model_seed,
                fp_template=fp_template,
                job_file=args.f,
            )

        if Path(args.f).suffix.lower() == ".bat":
            job = _shell_to_batch(job)

        # store result in output folder
        Path(args.f).parent.mkdir(parents=True, exist_ok=True)
        with open(args.f, "w") as f:
            f.write(job)
        print(f"Rendered template {args_program.name} and saved to {args.f}")

    def _add_script(self, args_name, args_program):
        # initialize file handler
        self.file_handler = FileHandler()

        # parse arguments
        parser = _parse_arguments_scripts()
        args = parser.parse_args(args_name)

        tmp_scripts = []
        if args.all:
            tmp_scripts = [
                p.name[7:-9] for p in Path(TEMPLATES_FP).glob("script_*.template")
            ]
        else:
            tmp_scripts = [args_program.name]

        for script in tmp_scripts:
            params = {}
            new_script = self.file_handler.render_file_from_template(
                script, "script", **params
            )

            # export script
            export_fp = Path(args.o, script)
            self.file_handler.add_file(new_script, export_fp)
        self.file_handler.print_summary()


def _parse_arguments_program(version="Unknown", add_help=False):
    parser = argparse.ArgumentParser(prog="asreview makita", add_help=add_help)
    parser.add_argument(
        "tool",
        type=str,
        choices=["template", "add-script"],
        help="The internal tool to use (template or add-script).",
    )
    parser.add_argument(
        "name", type=str, nargs="?", help="The name of the template or script."
    )
    parser.add_argument(
        "-V",
        "--version",
        action="version",
        version=version,
    )
    return parser


def _parse_arguments_template():
    parser = argparse.ArgumentParser(prog="asreview makita", add_help=True)

    parser.add_argument(
        "-f",
        type=_valid_job_file,
        default="jobs.sh",
        help="Script with study jobs to run",
    )
    parser.add_argument("-s", type=str, default="data", help="Dataset folder")
    parser.add_argument("-o", type=str, default="output", help="Output folder")
    parser.add_argument(
        "--init_seed",
        type=int,
        default=535,
        help="Seed of the priors. Seed is set by default!",
    )
    parser.add_argument(
        "--model_seed",
        type=int,
        default=165,
        help="Seed of the models. Seed is set by default!",
    )
    parser.add_argument(
        "--template", type=str, help="Overwrite template with template file path."
    )
    return parser


def _parse_arguments_scripts():
    parser = argparse.ArgumentParser(prog="asreview makita", add_help=True)
    parser.add_argument("--all", "-a", action="store_true", help="Add all scripts.")
    parser.add_argument(
        "-o", type=str, default="scripts", help="Location of the scripts folder."
    )
    return parser

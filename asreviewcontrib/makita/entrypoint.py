import argparse
from pathlib import Path

from asreview.entry_points import BaseEntryPoint

from asreviewcontrib.makita.config import TEMPLATES_FP
from asreviewcontrib.makita.template_arfi import render_jobs_arfi
from asreviewcontrib.makita.template_basic import render_jobs_basic
from asreviewcontrib.makita.template_multiple_models import render_jobs_multiple_models
from asreviewcontrib.makita.utils import add_file
from asreviewcontrib.makita.utils import get_file


def get_template_fp(name):

    return Path(TEMPLATES_FP, f"template_{name}.txt.template")


def is_valid_template(fp):
    if Path(fp).is_file():
        return True
    else:
        raise ValueError(f"Template {fp} not found")


def _valid_job_file(param):
    ext = Path(param).suffix
    if ext.lower() not in ('.sh', '.bat'):
        raise argparse.ArgumentTypeError('File must have a .sh or .bat extension')
    return param


def shell_to_batch(job):
    job = f'@ echo off\nCOLOR E0{job}'
    job = job.replace('#', '::')
    job = job.replace('/', '\\')
    return job


class MakitaEntryPoint(BaseEntryPoint):
    description = "Makita functionality for ASReview datasets."
    extension_name = "asreview-makita"

    def __init__(self):
        from asreviewcontrib.makita.__init__ import __version__

        super(MakitaEntryPoint, self).__init__()

        self.version = __version__

    def execute(self, argv):  # noqa: C901

        if len(argv) <= 2:
            parser = _parse_arguments_program(self.version, add_help=True)
            parser.parse_args(argv)

        # get tool and version number
        parser = _parse_arguments_program(self.version)
        args_program, args_name = parser.parse_known_args(argv)

        # generate templates
        if args_program.tool == "template":
            try:
                self._template(args_name, args_program)
            except Exception as err:
                print(f"\u001b[31mERROR: {err}\u001b[0m")
        elif args_program.tool == "add-script":
            self._add_script(args_name, args_program)
        else:
            parser.error(
                f"Error: Can't find '{args_program.tool}' "
                f"and '{args_program.name}'. Check spelling."
            )

    def _template(self, args_name, args_program):
        # generate basic arguments
        parser = _parse_arguments_template(self.version)

        # template specific arguments
        if args_program.name in ["basic"]:
            parser.add_argument("--n_runs",
                                type=int,
                                default=1,
                                help="Number of runs"
                                )
        if args_program.name in ["arfi"]:
            parser.add_argument("--n_priors",
                                type=int,
                                default=10,
                                help="Number of priors"
                                )
        if args_program.name in ["multiple_models"]:
            parser.add_argument("--classifiers",
                                nargs="+",
                                default=["logistic", "nb", "rf", "svm"],
                                help="Classifiers to use"
                                )
            parser.add_argument("--feature_extractions",
                                nargs="+",
                                default=["doc2vec", "sbert", "tfidf"],
                                help="Feature extractions to use"
                                )
            parser.add_argument("--impossible_models",
                                nargs="+",
                                default=[["nb", "doc2vec"], ["nb", "sbert"]],
                                help="Model combinations to exclude"
                                )

        # parse arguments
        args = parser.parse_args(args_name)

        # check if a custom template is used, otherwise use the default template
        fp_template = args.template or get_template_fp(args_program.name)
        is_valid_template(fp_template)

        # load datasets
        datasets = list(Path(args.s).glob("*.csv")) \
            + list(Path(args.s).glob("*.ris")) + list(Path(args.s).glob("*.xlsx"))

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
                init_seed=args.init_seed,
                model_seed=args.model_seed,
                all_classifiers=args.classifiers,
                all_feature_extractions=args.feature_extractions,
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

        if Path(args.f).suffix.lower() == '.bat':
            job = shell_to_batch(job)

        # store result in output folder
        Path(args.f).parent.mkdir(parents=True, exist_ok=True)
        with open(args.f, "w") as f:
            f.write(job)
        print(f"Rendered template {args_program.name} and saved to {args.f}")

    def _add_script(self, args_name, args_program):
        parser = _parse_arguments_scripts(self.version)
        args = parser.parse_args(args_name)
        params = {}
        new_script = get_file(args_program.name, "script", **params)

        export_fp = Path(args.o, args_program.name)
        add_file(new_script, export_fp)


def _parse_arguments_program(version="Unknown", add_help=False):
    parser = argparse.ArgumentParser(prog="asreview makita", add_help=add_help)
    parser.add_argument(
        "tool",
        type=str,
        choices=["template", "add-script"],
        help="The internal tool to use (template or add-script).",
    )
    parser.add_argument("name", type=str, help="The name of the template or script.")
    parser.add_argument(
        "-V",
        "--version",
        action="version",
        version=version,
    )
    return parser


def _parse_arguments_template(version):

    # parser = _parse_arguments_program(version)
    parser = argparse.ArgumentParser(prog="asreview makita", add_help=True)

    parser.add_argument("-f", type=_valid_job_file, default="jobs.sh",
                        help="Script with study jobs to run")
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


def _parse_arguments_scripts(version):
    parser = argparse.ArgumentParser(prog="asreview makita", add_help=True)

    # parser = _parse_arguments_program(version)
    parser.add_argument(
        "-o", type=str, default="scripts", help="Location of the scripts folder."
    )
    return parser

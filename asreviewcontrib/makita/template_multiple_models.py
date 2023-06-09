"""Render multiple_models template."""

from pathlib import Path

from cfgtemplater.config_template import ConfigTemplate

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.utils import FileHandler
from asreviewcontrib.makita.utils import check_filename_dataset

ALL_CLASSIFIERS = ["logistic", "nb", "rf", "svm"]
ALL_FEATURE_EXTRACTORS = ["doc2vec", "sbert", "tfidf"]
IMPOSSIBLE_MODELS = ["nb,doc2vec", "nb,sbert"]


def render_jobs_multiple_models(
    datasets,
    output_folder="output",
    n_runs=1,
    scripts_folder="scripts",
    init_seed=535,
    model_seed=165,
    all_classifiers=ALL_CLASSIFIERS,
    all_feature_extractors=ALL_FEATURE_EXTRACTORS,
    impossible_models=IMPOSSIBLE_MODELS,
    fp_template=None,
    job_file="jobs.sh",
):
    """Render jobs."""
    params = []

    # initialize file handler
    file_handler = FileHandler()

    for i, fp_dataset in enumerate(sorted(datasets)):
        check_filename_dataset(fp_dataset)

        fp_dataset = Path(fp_dataset)

        # params for single dataset
        params.append(
            {
                "input_file": fp_dataset.as_posix(),
                "input_file_stem": fp_dataset.stem,
                "model_seed": model_seed + i,
                "init_seed": init_seed,
            }
        )

    # open template TODO@{Replace by more sustainable module}
    template = ConfigTemplate(fp_template)

    # render scripts
    for s in template.scripts:
        t_script = file_handler.render_file_from_template(
            s, 
            "script", 
            output_folder=output_folder
        )
        export_fp = Path(scripts_folder, s)
        file_handler.add_file(t_script, export_fp)

    # render docs
    for s in template.docs:
        t_docs = file_handler.render_file_from_template(
            s,
            "doc",
            datasets=datasets,
            template_name=template.name
            if template.name == "multiple_models"
            else "custom",  # NOQA
            template_name_long=template.name_long,  # NOQA
            template_scripts=template.scripts,  # NOQA
            output_folder=output_folder,
            job_file=job_file,
        )
        file_handler.add_file(t_docs, s)

    file_handler.print_summary()

    return template.render(
        {
            "datasets": params,
            "output_folder": output_folder,
            "n_runs": n_runs,
            "scripts_folder": scripts_folder,
            "version": __version__,
            "all_classifiers": all_classifiers,
            "all_feature_extractors": all_feature_extractors,
            "impossible_models": [i.split(",") for i in impossible_models],
        }
    )

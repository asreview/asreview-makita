"""Render multimodel template."""

import os
import platform
from pathlib import Path

from cfgtemplater.config_template import ConfigTemplate

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.utils import FileHandler
from asreviewcontrib.makita.utils import check_filename_dataset


def render_jobs_multimodel(
    datasets,
    output_folder="output",
    n_runs=1,
    scripts_folder="scripts",
    create_wordclouds=True,
    init_seed=535,
    model_seed=165,
    all_classifiers=None,
    all_feature_extractors=None,
    impossible_models=None,
    query_strategy="max",
    balance_strategy="double",
    instances_per_query=1,
    stop_if='min',
    fp_template=None,
    job_file=None,
    platform_sys=None,
):
    if all_classifiers is None:
        all_classifiers = ["logistic", "nb", "rf", "svm"]

    if all_feature_extractors is None:
        all_feature_extractors = ["doc2vec", "sbert", "tfidf"]

    if impossible_models is None:
        impossible_models = ["nb,doc2vec", "nb,sbert"]

    """Render jobs."""

    if not platform_sys:
        platform_sys = platform.system()
    if not job_file:
        job_file = "jobs.bat" if os.name == "nt" else "jobs.sh"

    params = []

    # initialize file handler
    file_handler = FileHandler()

    # generate params for all simulations
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

    # Instantiate a ConfigTemplate object, initializing a Jinja2 environment and
    # setting up template variables and extensions.
    template = ConfigTemplate(fp_template)

    # render scripts
    if template.scripts is not None:
        for s in template.scripts:
            t_script = file_handler.render_file_from_template(
                s, "script", output_folder=output_folder
            )
            export_fp = Path(scripts_folder, s)
            file_handler.add_file(t_script, export_fp)

    # render docs
    if template.docs is not None:
        for s in template.docs:
            t_docs = file_handler.render_file_from_template(
                s,
                "doc",
                datasets=datasets,
                template_name=template.name
                if template.name == "multimodel"
                else "custom",
                template_name_long=template.name_long,
                template_scripts=template.scripts,
                output_folder=output_folder,
                job_file=job_file,
            )
            file_handler.add_file(t_docs, s)

    # print summary to console
    file_handler.print_summary()

    # render file and return
    return template.render(
        {
            "datasets": params,
            "create_wordclouds": create_wordclouds,
            "query_strategy": query_strategy,
            "balance_strategy": balance_strategy,
            "instances_per_query": instances_per_query,
            "stop_if": stop_if,
            "output_folder": output_folder,
            "n_runs": n_runs,
            "scripts_folder": scripts_folder,
            "platform": platform_sys,
            "version": __version__,
            "all_classifiers": all_classifiers,
            "all_feature_extractors": all_feature_extractors,
            "impossible_models": [i.split(",") for i in impossible_models],
        }
    )

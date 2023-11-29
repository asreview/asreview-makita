"""Render ARFI template."""

import os
import platform
from pathlib import Path

import numpy as np
from asreview import ASReviewData
from cfgtemplater.config_template import ConfigTemplate

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.utils import FileHandler
from asreviewcontrib.makita.utils import check_filename_dataset


def render_jobs_arfi(
    datasets,
    output_folder="output",
    scripts_folder="scripts",
    create_wordclouds=True,
    n_priors=10,
    init_seed=535,
    model_seed=165,
    classifier="nb",
    feature_extractor="tfidf",
    query_strategy="max",
    balance_strategy="double",
    instances_per_query=1,
    stop_if='min',
    fp_template=None,
    job_file=None,
    platform_sys=None,
):
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

        # render priors
        priors = _get_priors(fp_dataset, init_seed=init_seed + i, n_priors=n_priors)

        # params for single dataset
        params.append(
            {
                "input_file": fp_dataset.as_posix(),
                "input_file_stem": fp_dataset.stem,
                "priors": priors,
                "model_seed": model_seed + i,
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
                template_name=template.name if template.name == "ARFI" else "custom",
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
            "classifier": classifier,
            "feature_extractor": feature_extractor,
            "query_strategy": query_strategy,
            "balance_strategy": balance_strategy,
            "instances_per_query": instances_per_query,
            "stop_if": stop_if,
            "init_seed": init_seed,
            "output_folder": output_folder,
            "scripts_folder": scripts_folder,
            "platform": platform_sys,
            "version": __version__,
        }
    )


def _get_priors(dataset, init_seed, n_priors):
    """Sample priors."""
    asdata = ASReviewData.from_file(dataset)
    relevant_record_ids = asdata.record_ids[asdata.labels == 1]
    relevant_irrecord_ids = asdata.record_ids[asdata.labels == 0]

    if len(relevant_record_ids) == 0:
        raise ValueError("Not enough relevant records found.")
    if len(relevant_irrecord_ids) == 0:
        raise ValueError("Not enough irrelevant records found.")

    np.random.seed(init_seed)

    # sample n_priors irrelevant records
    prior_irrelevant = list(
        np.random.choice(relevant_irrecord_ids, n_priors, replace=False)
    )

    priors = []

    for incl in list(relevant_record_ids):
        priors_list = [incl] + prior_irrelevant
        priors.append(list(map(str, priors_list)))

    return priors

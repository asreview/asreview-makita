"""Render ARFI template."""

from pathlib import Path

import numpy as np
from asreview import ASReviewData
from cfgtemplater.config_template import ConfigTemplate

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.utils import add_file
from asreviewcontrib.makita.utils import check_filename_dataset
from asreviewcontrib.makita.utils import get_file


def get_priors(dataset, init_seed, n_priors):
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
    prior_irrelevant = list(np.random.choice(relevant_irrecord_ids, n_priors))

    priors = []

    for incl in list(relevant_record_ids):
        priors_list = [incl] + prior_irrelevant
        priors.append(list(map(str, priors_list)))

    return priors


def render_jobs_arfi(
    datasets,
    output_folder="output",
    scripts_folder="scripts",
    n_priors=10,
    init_seed=535,
    model_seed=165,
    fp_template=None,
    job_file='jobs.sh',
):
    """Render jobs."""
    params = []

    for i, fp_dataset in enumerate(sorted(datasets)):

        check_filename_dataset(fp_dataset)

        # render priors
        priors = get_priors(fp_dataset, init_seed=init_seed + i, n_priors=n_priors)

        # params for single dataset
        params.append(
            {
                "input_file": fp_dataset.as_posix(),
                "input_file_stem": fp_dataset.stem,
                "priors": priors,
                "model_seed": model_seed + i,
            }
        )

    # open template TODO@{Replace by more sustainable module}
    template = ConfigTemplate(fp_template)

    for s in template.scripts:
        t_script = get_file(s, "script")
        export_fp = Path(scripts_folder, s)
        add_file(t_script, export_fp)

    for s in template.docs:
        t_docs = get_file(s,
                          "doc",
                          datasets=datasets,
                          template_name=template.name if template.name == "ARFI" else "custom", # NOQA
                          template_name_long=template.name_long,
                          template_scripts=template.scripts,
                          output_folder=output_folder,
                          job_file=job_file,
                          )
        add_file(t_docs, s)

    return template.render(
        {
            "datasets": params,
            "init_seed": init_seed,
            "output_folder": output_folder,
            "scripts_folder": scripts_folder,
            "version": __version__,
        }
    )

"""Render basic template."""

from pathlib import Path

from cfgtemplater.config_template import ConfigTemplate

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.utils import add_file
from asreviewcontrib.makita.utils import check_filename_dataset
from asreviewcontrib.makita.utils import get_file


def render_jobs_multiple_models(
    datasets,
    output_folder="output",
    scripts_folder="scripts",
    init_seed=535,
    model_seed=165,
    all_classifiers=["logistic", "nb", "rf", "svm"],
    all_feature_extractions=["doc2vec", "sbert", "tfidf"],
    impossible_models=[["nb", "doc2vec"], ["nb", "sbert"]],
    fp_template=None,
    job_file='jobs.sh',
):
    """Render jobs."""
    params = []

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

    for s in template.scripts:
        t_script = get_file(s, "script")
        export_fp = Path(scripts_folder, s)
        add_file(t_script, export_fp)

    for s in template.docs:
        t_docs = get_file(s,
                          "doc",
                          datasets=datasets,
                          template_name=template.name if template.name == "multiple_models" else "custom", # NOQA
                          template_name_long=template.name_long,
                          template_scripts=template.scripts,
                          output_folder=output_folder,
                          job_file=job_file,
                          )
        add_file(t_docs, s)

    return template.render(
        {
            "datasets": params,
            "output_folder": output_folder,
            "scripts_folder": scripts_folder,
            "version": __version__,
            "all_classifiers": all_classifiers,
            "all_feature_extractions": all_feature_extractions,
            "impossible_models": impossible_models,
        }
    )

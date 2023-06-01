"""Render basic template."""

from pathlib import Path

from cfgtemplater.config_template import ConfigTemplate

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.utils import FileHandler
from asreviewcontrib.makita.utils import check_filename_dataset


def render_jobs_basic(
    datasets,
    output_folder="output",
    scripts_folder="scripts",
    n_runs=1,
    init_seed=535,
    model_seed=165,
    fp_template=None,
    job_file=None,
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
                "n_runs": n_runs,
            }
        )

    # open template TODO@{Replace by more sustainable module}
    template = ConfigTemplate(fp_template)

    for s in template.scripts:
        t_script = file_handler.render_file_from_template(s, "script")
        export_fp = Path(scripts_folder, s)
        file_handler.add_file(t_script, export_fp)

    for s in template.docs:
        t_docs = file_handler.render_file_from_template(s,
                                                        "doc",
                                                        datasets=datasets,
                                                        template_name=template.name if template.name == "basic" else "custom",  # NOQA
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
            "scripts_folder": scripts_folder,
            "version": __version__,
        }
    )

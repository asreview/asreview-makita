from pathlib import Path

from jinja2 import Template

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.config import TEMPLATES_FP


def get_file(name, file_type, **kwargs):

    params = {
        "version": __version__,
    }

    print(f"Loading {file_type} {name}")

    # open template
    with open(Path(TEMPLATES_FP, f"{file_type}_{name}.template")) as f:
        template = Template(f.read())

    return template.render({**params, **kwargs})


def add_file(content, export_fp):

    # store result in output folder
    Path(export_fp).parent.mkdir(parents=True, exist_ok=True)

    with open(export_fp, "w") as f:
        f.write(content)

    print(f"Added {export_fp}")


def check_filename_dataset(fp):
    if (' ' in Path(fp).stem):
        raise ValueError(f"Dataset filename '{fp}' cannot contain whitespace.")

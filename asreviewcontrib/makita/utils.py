from pathlib import Path

from jinja2 import Template

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.config import TEMPLATES_FP


class FileHandler:
    def __init__(self):
        self.overwrite_all = False
        self.total_files = 0

    def add_file(self, content, export_fp):
        # Check if the file already exists
        if Path(export_fp).exists() and not self.overwrite_all:
            response = None
            while response not in ["y", "n", "a"]:
                response = input(f"Overwrite {export_fp} (Yes/No/All)? ").lower()
                if response == "y":
                    # Overwrite the file
                    break
                elif response == "n":
                    # Do not overwrite, return from function
                    print(f"Skipped {export_fp}")
                    return
                elif response == "a":
                    # Overwrite all files
                    self.overwrite_all = True
                    break

        # store result in output folder
        Path(export_fp).parent.mkdir(parents=True, exist_ok=True)

        with open(export_fp, "w") as f:
            f.write(content)

        print(f"Added {export_fp}")
        self.total_files += 1

    def print_summary(self):
        print(f"{self.total_files} file(s) created.")

    def get_file(self, name, file_type, **kwargs):

        params = {
            "version": __version__,
        }

        print(f"Loading {file_type} {name}")

        # open template
        with open(Path(TEMPLATES_FP, f"{file_type}_{name}.template")) as f:
            template = Template(f.read())

        return template.render({**params, **kwargs})


def check_filename_dataset(fp):
    if (' ' in Path(fp).stem):
        raise ValueError(f"Dataset filename '{fp}' cannot contain whitespace.")

from pathlib import Path

from jinja2 import Template

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.config import TEMPLATES_FP


class FileHandler:
    """
    The FileHandler class handles file operations such as adding files and rendering
    scripts.
    """

    def __init__(self):
        self.overwrite_all = False
        self.total_files = 0

    def add_file(self, content, export_fp):
        """
        Add a file to the specified directory.

        Args:
        content (str): The content to be written into the file.
        export_fp (Path): A Path object that specifies the directory where the file
        should be added.
        """

        def allow_overwrite():
            response = input(f"Overwrite {export_fp} ([Y]es/[N]o/[A]ll)? ").lower()
            if response in ["y", "yes"]:
                # Overwrite the file
                return True
            elif response in ["n", "no"]:
                # Do not overwrite, return from function
                print(f"Skipped {export_fp}")
                return False
            elif response in ["a", "all"]:
                # Overwrite all files
                self.overwrite_all = True
                return True
            else:
                # Ask again
                allow_overwrite()

        # If the file does not exist, or overwrite all is True, or the user allows it:
        if not Path(export_fp).exists() or self.overwrite_all or allow_overwrite():
            # store result in output folder
            Path(export_fp).parent.mkdir(parents=True, exist_ok=True)

            with open(export_fp, "w") as f:
                f.write(content)

            print(f"Added {export_fp}")
            self.total_files += 1

    def print_summary(self):
        """
        Print the total number of files created by the FileHandler object.
        """

        print(f"{self.total_files} file(s) created.")

    def render_file_from_template(self, name, file_type, **kwargs):
        """
        Render a file from a template.

        Args:
        name (str): The name of the file to be rendered.
        file_type (str): The type of the file to be rendered.
        kwargs: Additional keyword arguments.

        Returns:
        str: The content of the file rendered from the template.
        """

        params = {
            "version": __version__,
        }

        print(f"Loading {file_type} {name}")

        # open template
        with open(Path(TEMPLATES_FP, f"{file_type}_{name}.template")) as f:
            template = Template(f.read())

        return template.render({**params, **kwargs})


def check_filename_dataset(fp):
    """
    Check if the filename of the dataset contains any whitespace.

    Args:
    fp (str): The file path of the dataset.

    Raises:
    ValueError: If the filename of the dataset contains whitespace.
    """

    if " " in Path(fp).stem:
        raise ValueError(f"Dataset filename '{fp}' cannot contain whitespace.")

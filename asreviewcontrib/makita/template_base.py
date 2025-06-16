"""Rendering base class for templates."""

from pathlib import Path

from cfgtemplater.config_template import ConfigTemplate

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.config import TEMPLATES_FP
from asreviewcontrib.makita.entrypoint import ProjectPaths
from asreviewcontrib.makita.utils import FileHandler


class TemplateBase:
    template_file = ""

    def __init__(
        self,
        datasets,
        fp_template,
        file_handler: FileHandler,
        paths: ProjectPaths,
        prior_seed,
        model_seed,
        n_query,
        n_stop,
        **kwargs,
    ):
        self.datasets = datasets
        self.paths = paths
        self.prior_seed = prior_seed
        self.model_seed = model_seed
        self.n_query = n_query
        self.n_stop = n_stop
        self.file_handler = file_handler
        self.__version__ = __version__

        self.template = ConfigTemplate(
            fp_template if fp_template is not None else self.get_template_file()
        )  # noqa: E501

        for param in kwargs:
            if kwargs[param] is not None:
                # print value of param
                print(f"{param} = {kwargs[param]}")
                raise ValueError(f"{param} should not be set for this template.")

    def get_template_file(self):
        return Path(TEMPLATES_FP, self.template_file)

    def get_dataset_specific_params(self, index, fp_dataset):
        """Prepare dataset-specific parameters. These parameters are provided to the
        template once for each dataset."""

        raise NotImplementedError(
            "Subclasses should implement this method to prepare dataset-specific parameters."  # noqa: E501
        )

    def get_template_specific_params(self, params):
        """Prepare template-specific parameters. These parameters are provided to the
        template only once."""

        raise NotImplementedError(
            "Subclasses should implement this method to prepare template-specific parameters."  # noqa: E501
        )

    def render_scripts(self, scripts: list):
        """Render scripts."""

        for s in scripts:
            t_script = self.file_handler.render_file_from_template(
                s, "script", output_folder=self.paths.output_folder
            )
            self.file_handler.add_file(
                t_script, Path(self.paths.scripts_folder_path, s)
            )

    def render_docs(self, documents: list):
        """Render docs."""

        for document in documents:
            t_docs = self.file_handler.render_file_from_template(
                document,
                "doc",
                datasets=[
                    Path(dataset.parent.name, dataset.name) for dataset in self.datasets
                ],
                template_name=self.template.name,
                template_name_long=self.template.name_long,
                template_scripts=self.template.scripts,
                paths=self.paths,
            )
            self.file_handler.add_file(
                t_docs, Path(self.paths.project_folder, document)
            )

    def render(self):
        """Render template."""

        # render scripts
        if self.template.scripts:
            self.render_scripts(self.template.scripts)

        # render docs
        if self.template.docs:
            self.render_docs(self.template.docs)

        # collect dynamic parameters
        params = []
        for i, fp_dataset in enumerate(sorted(self.datasets)):
            if " " in Path(fp_dataset).stem:
                raise ValueError(
                    f"Dataset filename '{fp_dataset}' cannot contain whitespace."
                )
            fp_dataset = Path(fp_dataset)
            params.append(self.get_dataset_specific_params(i, fp_dataset))

        try:
            rendered_output = self.template.render(
                self.get_template_specific_params(params)
            )
        except TypeError as e:
            if "'StrictUndefined' object cannot be interpreted as an integer" in str(e):
                print("\033[31mERROR: A rendering exception occurred -", e)
                print(
                    "The rendering process failed due to an attempt to use an undefined variable where an integer was expected."  # noqa: E501
                )
                print(
                    "\033[33mPlease check your template for variables that are not properly defined or passed in.\033[0m"  # noqa: E501
                )
                exit(1)
            else:
                raise e

        return rendered_output

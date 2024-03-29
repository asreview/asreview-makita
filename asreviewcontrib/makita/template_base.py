"""Rendering base class for templates."""

import os
import platform
from pathlib import Path

from cfgtemplater.config_template import ConfigTemplate

from asreviewcontrib.makita import __version__
from asreviewcontrib.makita.utils import FileHandler
from asreviewcontrib.makita.utils import check_filename_dataset


class RenderTemplateBase:
    def __init__(self, datasets, output_folder="output", scripts_folder="scripts",
                 create_wordclouds=True, allow_overwrite=False, init_seed=535,
                 model_seed=165, query_strategy="max", balance_strategy="double",
                 instances_per_query=1, stop_if='min', fp_template=None, job_file=None,
                 platform_sys=None):
        self.datasets = datasets
        self.output_folder = output_folder
        self.scripts_folder = scripts_folder
        self.create_wordclouds = create_wordclouds
        self.init_seed = init_seed
        self.model_seed = model_seed
        self.query_strategy = query_strategy
        self.balance_strategy = balance_strategy
        self.instances_per_query = instances_per_query
        self.stop_if = stop_if
        self.fp_template = fp_template
        self.job_file = job_file if job_file else "jobs.bat" if os.name == "nt" else "jobs.sh"
        self.platform_sys = platform_sys if platform_sys else platform.system()
        self.file_handler = FileHandler(allow_overwrite)
        self.template = ConfigTemplate(fp_template)
        self.__version__ = __version__

        assert self.template is not None, "Template is None."
        assert self.fp_template is not None, "Template file is None."

    def prepare_dataset_params(self, index, fp_dataset):
        raise NotImplementedError("Subclasses should implement this method to prepare dataset-specific parameters.")  # noqa

    def prepare_template_params(self, params):
        raise NotImplementedError("Subclasses should implement this method to prepare template-specific parameters.")  # noqa

    def gather_dataset_params(self):
        params = []
        for i, fp_dataset in enumerate(sorted(self.datasets)):
            check_filename_dataset(fp_dataset)
            fp_dataset = Path(fp_dataset)
            params.append(self.prepare_dataset_params(i, fp_dataset))
        return params

    def render_scripts(self, scripts: list):
        for s in scripts:
            t_script = self.file_handler.render_file_from_template(
                s, "script", output_folder=self.output_folder
            )
            export_fp = Path(self.scripts_folder, s)
            self.file_handler.add_file(t_script, export_fp)

    def render_docs(self, docs: list):
        for s in docs:
            t_docs = self.file_handler.render_file_from_template(
                s,
                "doc",
                datasets=self.datasets,
                template_name=self.template.name,
                template_name_long=self.template.name_long,
                template_scripts=self.template.scripts,
                create_wordclouds=self.create_wordclouds,
                output_folder=self.output_folder,
                job_file=self.job_file,
            )
            self.file_handler.add_file(t_docs, s)

    def render(self):
        dataset_params = self.gather_dataset_params()

        if self.template.scripts:
            self.render_scripts(self.template.scripts)

        if self.template.docs:
            self.render_docs(self.template.docs)

        try:
            rendered_output = self.template.render(
                self.prepare_template_params(dataset_params)
            )
        except Exception as e:
            if str(e) == "'StrictUndefined' object cannot be interpreted as an integer":
                if self.template_name is None:
                    print("\033[31mERROR: A rendering exception occurred -", e)
                    print("The rendering process failed due to undefined parameters in the template.")  # noqa
                    print("\033[33mPlease verify that the chosen base template is compatible with the selected template.\033[0m")  # noqa
                    exit(1)
                else:
                    raise

        self.file_handler.print_summary()
        return rendered_output

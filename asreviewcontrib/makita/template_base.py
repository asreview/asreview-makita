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
        self.file_handler = FileHandler()
        self.file_handler.overwrite_all = allow_overwrite
        self.template = ConfigTemplate(fp_template)
        self.__version__ = __version__

    def render(self):
        raise NotImplementedError("Subclasses should implement this method to render specific templates.")

    def prepare_common_params(self):
        params = []
        for i, fp_dataset in enumerate(sorted(self.datasets)):
            check_filename_dataset(fp_dataset)
            fp_dataset = Path(fp_dataset)
            params.append(self.prepare_dataset_params(i, fp_dataset))
        return params

    def prepare_dataset_params(self, index, fp_dataset):
        raise NotImplementedError("Subclasses should implement this method to prepare dataset-specific parameters.")

    def render_scripts(self, scripts: list):
        for s in scripts:
            t_script = self.file_handler.render_file_from_template(
                s, "script", output_folder=self.output_folder
            )
            export_fp = Path(self.scripts_folder, s)
            self.file_handler.add_file(t_script, export_fp)

    def render_docs(self, docs: list, name: str):
        for s in docs:
            t_docs = self.file_handler.render_file_from_template(
                s,
                "doc",
                datasets=self.datasets,
                template_name=self.template.name if self.template.name == name else "custom",
                template_name_long=self.template.name_long,
                template_scripts=self.template.scripts,
                output_folder=self.output_folder,
                job_file=self.job_file,
            )
            self.file_handler.add_file(t_docs, s)

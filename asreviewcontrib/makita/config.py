from pathlib import Path

TEMPLATES_FP = Path(Path(__file__).parent, "templates")

DEFAULTS = {
    "dataset_folder": "data",
    "output_folder": "output",
    "scripts_folder": "scripts",
    "init_seed": 535,
    "model_seed": 165,
    "balance_strategy": "double",
    "instances_per_query": 1,
    "stop_if": "min",
}

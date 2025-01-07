from dataclasses import dataclass
from pathlib import Path

TEMPLATES_FP = Path(Path(__file__).parent, "templates")

@dataclass(frozen=True)
class ASReviewConfig:
    DEFAULT_MODEL: str = "nb"
    DEFAULT_FEATURE_EXTRACTION: str = "tfidf"
    DEFAULT_QUERY_STRATEGY: str = "max"
    DEFAULT_BALANCE_STRATEGY: str = "balanced"
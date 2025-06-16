import os

env_version = os.environ.get("ASREVIEW_MAKITA_VERSION_OVERRIDE")
if env_version is not None:
    __version__ = env_version
    try:
        __version_tuple__ = tuple(env_version.split("."))
    except Exception:
        __version_tuple__ = (0, 0, 0)
else:
    try:
        from asreviewcontrib.makita._version import __version__
        from asreviewcontrib.makita._version import __version_tuple__
    except ImportError:
        __version__ = "0.0.0"
        __version_tuple__ = (0, 0, 0)

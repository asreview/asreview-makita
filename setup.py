from setuptools import setup, find_namespace_packages
from os import path
from io import open

import versioneer

here = path.abspath(path.dirname(__file__))

# Get the long description from the README file
with open(path.join(here, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='asreview-makita',
    version=versioneer.get_version(),
    cmdclass=versioneer.get_cmdclass(),
    description='Makita workflow tool for the ASReview project',
    long_description=long_description,
    long_description_content_type='text/markdown',
    url='https://github.com/asreview/asreview-makita',
    author='ASReview LAB developers',
    author_email='asreview@uu.nl',
    classifiers=[
        'Development Status :: 4 - Beta',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
        'Programming Language :: Python :: 3.10',
    ],
    keywords='asreview makita',
    packages=find_namespace_packages(include=['asreviewcontrib.*']),
    install_requires=[
        "asreview",
        "jinja2",
        "cfgtemplater",
    ],
    include_package_data=True,
    package_data={
        '': ['*.template']
    },
    extras_require={
    },

    entry_points={
        "asreview.entry_points": [
            "makita = asreviewcontrib.makita.entrypoint:MakitaEntryPoint",
        ]
    },

    project_urls={
        'Bug Reports':
            "https://github.com/asreview/asreview-makita/issues",
        'Source':
            "https://github.com/asreview/asreview-makita",
    },
)

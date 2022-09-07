#!/usr/bin/env python3
import sys

from setuptools import setup, find_packages

config = {
    'description': 'Toy Robot',
    'author': 'Lauchlin Wilkinson',
    'url': 'https://github.com/lokulin/toy-robot-python',
    'download_url': 'https://github.com/lokulin/toy-robot-python',
    'author_email': 'lauchlin@lauchlin.com',
    'version': '0.1',
    'install_requires': [],
    'packages': find_packages('.', exclude=['tests*']),
    'scripts': ['bin/toy-robot'],
    'name': 'toyrobot'
}

setup(**config)

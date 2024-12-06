# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import sys
import pathlib

this_path = pathlib.Path(__file__)
sys.path.insert(0, str(this_path.parent.parent.parent))

import glpilib2


# -- Project information -----------------------------------------------------

project = "glpilib2"
copyright = "2024, Marcelo Lacerda"
author = "Marcelo Lacerda"

# The full version, including alpha/beta/rc tags
release = glpilib2.__version__
version = release


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.

extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.intersphinx",
    "sphinx.ext.todo",
    "sphinx.ext.viewcode",
    "numpydoc",
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ["_templates"]

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = "alabaster"
add_module_names = True

html_theme_options = {
    "show_powered_by": False,
    "github_user": "marceloslacerda",
    "github_repo": "glpi",
    "github_banner": False,
    "show_related": False,
    "note_bg": "#FFF59C",
}

html_use_smartypants = False

intersphinx_mapping = {
    "python": ("https://docs.python.org/3/", None),
    "requests": ("https://docs.python-requests.org/en/master/", None),
}

autodoc_typehints = "none"
autodoc_member_order = "bysource"
numpydoc_show_class_members = True

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".

# html_static_path = ["_static"]

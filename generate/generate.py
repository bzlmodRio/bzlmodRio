import os

import yaml
from bazelrio_gentool.load_cached_versions import load_cached_versions
from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.utils import render_template, write_file
from bazelrio_gentool.utils import TEMPLATE_BASE_DIR, write_file, render_template
from get_libraries_remapping import get_libraries
from get_mega_group import create_mega_group

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
REPO_DIR = os.path.join(SCRIPT_DIR, "..")

def write_library_alias(libraries):
    template_file = os.path.join(SCRIPT_DIR, "templates", "library_alias.jinja2")
    library_dir = os.path.join(REPO_DIR, "libraries")
    
    for lib in libraries:
        output_file = os.path.join(library_dir, lib.subfolder, "BUILD")
        render_template(template_file, output_file, lib=lib)


    # render_template(template_file, json_file, group=group, module_bazel_file=module_bazel_file, hash=hash)


def load_repos():
    repos = []
    
    cached_versions = load_cached_versions()

    for repo, repo_info in cached_versions.items():
        repos.append((repo, repo_info))

    return repos



def write_repo_loads():
    repos = load_repos()

    template_file = os.path.join(SCRIPT_DIR, "templates", "load_library.jinja2")
    load_dir = os.path.join(REPO_DIR, "private/non_bzlmod/smart_dependencies")

    for repo, repo_info in repos:
        write_file(os.path.join(load_dir, repo, "BUILD"), "")
        
        output_file = os.path.join(load_dir, repo, f"load_{repo}.bzl")
        render_template(template_file, output_file, repo=repo, repo_info=repo_info)

    write_file(os.path.join(REPO_DIR, "private/non_bzlmod", "BUILD"), "")


def write_module_templates():

    group = create_mega_group()
    
    template_files = [
        "defs.bzl",
        "MODULE.bazel",
        "WORKSPACE",
        "private/non_bzlmod/download_dependencies.bzl",
        "private/non_bzlmod/setup_dependencies.bzl",
        "tests/MODULE.bazel",
        "tests/WORKSPACE",
    ]
    repos = load_repos()

    for tf in template_files:
        template_file = os.path.join(SCRIPT_DIR, "templates", "module", tf + ".jinja2")
        output_file = os.path.join(REPO_DIR, tf)
        render_template(template_file, output_file, group=group, repos=repos)
    
    template_files = [
        ".github/workflows/build.yml",
        ".github/workflows/lint.yml",
        ".bazelrc-buildbuddy",
        ".bazelignore",
        ".bazelrc",
        ".gitignore",
        "BUILD.bazel",
        "README.md",
        "WORKSPACE.bzlmod",
        "tests/.bazelrc",
        "tests/.bazelrc-buildbuddy",
        "tests/.bazelversion",
        "tests/WORKSPACE.bzlmod",
    ]

    for tf in template_files:
        template_file = os.path.join(TEMPLATE_BASE_DIR, "module", tf + ".jinja2")
        output_file = os.path.join(REPO_DIR, tf)
        render_template(template_file, output_file, group=group)


def main():
    
    clean_existing_version(os.path.join(REPO_DIR), extra_dir_blacklist=["robot"])
    # clean_existing_version(os.path.join(REPO_DIR, "private"))
    write_library_alias(get_libraries())
    write_repo_loads()
    write_module_templates()
    
    



if __name__ == "__main__":
    """
    bazel run @bazelrio//generate
    """
    main()

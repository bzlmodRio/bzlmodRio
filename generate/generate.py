import os

import yaml
from bazelrio_gentool.utils import render_template, write_file
from bazelrio_gentool.load_cached_versions import load_cached_versions
from get_libraries import get_libraries
from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.utils import TEMPLATE_BASE_DIR, write_file, render_template

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
REPO_DIR = os.path.join(SCRIPT_DIR, "..")

def write_library_alias(libraries):
    template_file = os.path.join(SCRIPT_DIR, "templates", "library_alias.jinja2")
    library_dir = os.path.join(REPO_DIR, "libraries")
    
    for lib in libraries:
        output_file = os.path.join(library_dir, lib.subfolder, "BUILD")
        render_template(template_file, output_file, lib=lib)


    # render_template(template_file, json_file, group=group, module_bazel_file=module_bazel_file, hash=hash)



def write_repo_loads():
    cached_versions = load_cached_versions()

    template_file = os.path.join(SCRIPT_DIR, "templates", "load_library.jinja2")
    load_dir = os.path.join(REPO_DIR, "private/non_bzlmod/smart_dependencies")

    for repo, repo_info in cached_versions.items():
        write_file(os.path.join(load_dir, repo, "BUILD"), "")
        
        output_file = os.path.join(load_dir, repo, f"load_{repo}.bzl")
        render_template(template_file, output_file, repo=repo, repo_info=repo_info)

    write_file(os.path.join(REPO_DIR, "private/non_bzlmod", "BUILD"), "")



def main():
    
    clean_existing_version(os.path.join(REPO_DIR), extra_dir_blacklist=["robot"])
    # clean_existing_version(os.path.join(REPO_DIR, "private"))
    write_library_alias(get_libraries())
    write_repo_loads()
    
    
    template_files = [
        "defs.bzl",
        "MODULE.bazel",
        "WORKSPACE",
        "private/non_bzlmod/download_dependencies.bzl",
        "private/non_bzlmod/setup_dependencies.bzl",
        "tests/MODULE.bazel",
        "tests/WORKSPACE",
    ]

    for tf in template_files:
        template_file = os.path.join(SCRIPT_DIR, "templates", "module", tf + ".jinja2")
        output_file = os.path.join(REPO_DIR, tf)
        render_template(template_file, output_file, group={})
    
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
        render_template(template_file, output_file, group={})



if __name__ == "__main__":
    """
    bazel run @bazelrio//generate
    """
    main()

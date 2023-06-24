import os

import yaml
import argparse
from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.utils import render_template, write_file
from bazelrio_gentool.utils import (
    TEMPLATE_BASE_DIR,
    write_file,
    render_template,
    render_templates,
)
from get_libraries_remapping import get_libraries
from get_mega_group import create_mega_group
from load_repos import load_repos
from bazelrio_gentool.cli import add_generic_cli, GenericCliArgs
from bazelrio_gentool.generate_shared_files import (
    write_shared_root_files,
    write_shared_test_files,
)
from bazelrio_gentool.generate_module_project_files import (
    create_default_mandatory_settings,
)
from bazelrio_gentool.generate_shared_files import get_bazel_dependencies

SCRIPT_DIR = os.environ["BUILD_WORKSPACE_DIRECTORY"]
REPO_DIR = os.path.join(SCRIPT_DIR, "..")


def write_library_alias(libraries):
    template_file = os.path.join(SCRIPT_DIR, "templates", "library_alias.jinja2")
    library_dir = os.path.join(REPO_DIR, "libraries")

    for lib in libraries:
        output_file = os.path.join(library_dir, lib.subfolder, "BUILD.bazel")
        render_template(template_file, output_file, lib=lib)


def write_repo_loads():
    repos = load_repos()

    template_file = os.path.join(SCRIPT_DIR, "templates", "load_library.jinja2")
    load_dir = os.path.join(REPO_DIR, "private/non_bzlmod/smart_dependencies")

    for repo, repo_info in repos:
        write_file(os.path.join(load_dir, repo, "BUILD.bazel"), "")

        output_file = os.path.join(load_dir, repo, f"load_{repo}.bzl")
        render_template(template_file, output_file, repo=repo, repo_info=repo_info)

    write_file(os.path.join(REPO_DIR, "private/non_bzlmod", "BUILD.bazel"), "")


def write_module_templates(mandatory_dependencies):
    group = create_mega_group()

    write_shared_root_files(REPO_DIR, group)
    write_shared_test_files(REPO_DIR, group)

    template_files = [
        "defs.bzl",
        "MODULE.bazel",
        "WORKSPACE",
        "replace_legacy_names.sh",
        "constraints/is_roborio/BUILD.bazel",
        "private/non_bzlmod/create_null_repository.bzl",
        "private/non_bzlmod/download_dependencies.bzl",
        "private/non_bzlmod/setup_dependencies.bzl",
        "tests/MODULE.bazel",
        "tests/WORKSPACE",
    ]

    repos = load_repos()
    libraries = get_libraries()

    render_templates(
        template_files,
        REPO_DIR,
        os.path.join(SCRIPT_DIR, "templates", "module"),
        group=group,
        repos=repos,
        libraries=libraries,
        bazel_dependencies=get_bazel_dependencies(),
        mandatory_dependencies=mandatory_dependencies,
    )


def fixup_build_ci_name():
    build_file = os.path.join(REPO_DIR, '.github/workflows/build.yml')
    with open(build_file, 'r') as f:
        contents = f.read()
    
    contents = contents.replace('@bzlmodrio//...', "@bazelrio//...")
    with open(build_file, 'w') as f:
        f.write(contents)


def main():
    parser = argparse.ArgumentParser()
    add_generic_cli(parser)
    args = parser.parse_args()

    clean_existing_version(
        os.path.join(REPO_DIR),
        extra_dir_blacklist=["robot"],
        file_blacklist=[
            "deps.bzl",
            "bzlmodrio_dependencies.bzl",
            "bzlmodrio_setup.bzl",
            "platforms/roborio/BUILD",
        ],
    )

    mandatory_dependencies = create_default_mandatory_settings(GenericCliArgs(args))

    write_library_alias(get_libraries())
    write_repo_loads()
    write_module_templates(mandatory_dependencies)
    fixup_build_ci_name()


if __name__ == "__main__":
    main()

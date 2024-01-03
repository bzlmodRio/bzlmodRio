import os

import shutil
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

    write_shared_root_files(REPO_DIR, group, include_windows_arm_compiler=False)
    write_shared_test_files(REPO_DIR, group)

    template_files = [
        "MODULE.bazel",
        "WORKSPACE",
        "replace_legacy_names.sh",
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


def manual_fixes(repo_dir):
    def helper(filename, callback):
        with open(filename, "r") as f:
            contents = f.read()

        new_contents = callback(contents)
        if new_contents == contents:
            raise Exception("Nothing was replaced!")

        with open(filename, "w") as f:
            f.write(new_contents)

    helper(
        os.path.join(repo_dir, ".github", "workflows", "build.yml"),
        lambda contents: contents.replace("@bzlmodrio//...", "@bazelrio//..."),
    )

    helper(
        os.path.join(repo_dir, ".github", "workflows", "build.yml"),
        lambda contents: contents.replace(
            'command: "test"',
            'command: "build"',
        ),
    )


def copy_robot_files():
    ctre_tests_dir = os.path.join(
        REPO_DIR, "..", "libraries", "bzlmodRio-phoenix", "tests"
    )

    shutil.copy(
        os.path.join(ctre_tests_dir, "robot-cpp", "subsystems", "shooter.hpp"),
        os.path.join(REPO_DIR, "tests", "robot-cpp", "subsystems", "shooter.hpp"),
    )
    shutil.copy(
        os.path.join(ctre_tests_dir, "robot-cpp", "subsystems", "shooter.cpp"),
        os.path.join(REPO_DIR, "tests", "robot-cpp", "subsystems", "shooter.cpp"),
    )
    shutil.copy(
        os.path.join(
            ctre_tests_dir,
            "robot-java",
            "src/main/java/frc/robot",
            "subsystems",
            "Shooter.java",
        ),
        os.path.join(
            REPO_DIR,
            "tests",
            "robot-java",
            "src/main/java/frc/robot",
            "subsystems",
            "Shooter.java",
        ),
    )

    revlib_tests_dir = os.path.join(
        REPO_DIR, "..", "libraries", "bzlmodRio-revlib", "tests"
    )

    shutil.copy(
        os.path.join(revlib_tests_dir, "robot-cpp", "subsystems", "drivetrain.hpp"),
        os.path.join(REPO_DIR, "tests", "robot-cpp", "subsystems", "drivetrain.hpp"),
    )
    shutil.copy(
        os.path.join(revlib_tests_dir, "robot-cpp", "subsystems", "drivetrain.cpp"),
        os.path.join(REPO_DIR, "tests", "robot-cpp", "subsystems", "drivetrain.cpp"),
    )
    shutil.copy(
        os.path.join(
            revlib_tests_dir,
            "robot-java",
            "src/main/java/frc/robot",
            "subsystems",
            "DriveTrain.java",
        ),
        os.path.join(
            REPO_DIR,
            "tests",
            "robot-java",
            "src/main/java/frc/robot",
            "subsystems",
            "DriveTrain.java",
        ),
    )

    wpilib_tests_dir = os.path.join(
        REPO_DIR, "..", "libraries", "bzlmodRio-allwpilib", "tests"
    )

    # shutil.copy(
    #     os.path.join(wpilib_tests_dir, "robot-cpp", "subsystems", "elevator.hpp"),
    #     os.path.join(REPO_DIR, "tests", "robot-cpp", "subsystems", "elevator.hpp"),
    # )
    # shutil.copy(
    #     os.path.join(wpilib_tests_dir, "robot-cpp", "subsystems", "elevator.cpp"),
    #     os.path.join(REPO_DIR, "tests", "robot-cpp", "subsystems", "elevator.cpp"),
    # )
    shutil.copy(
        os.path.join(
            wpilib_tests_dir,
            "robot-java",
            "src/main/java/frc/robot",
            "subsystems",
            "Elevator.java",
        ),
        os.path.join(
            REPO_DIR,
            "tests",
            "robot-java",
            "src/main/java/frc/robot",
            "subsystems",
            "Elevator.java",
        ),
    )

    shutil.copytree(
        os.path.join(revlib_tests_dir, "robot-cpp", "commands"),
        os.path.join(REPO_DIR, "tests", "robot-cpp", "commands"),
        dirs_exist_ok=True,
    )


def main():
    parser = argparse.ArgumentParser()
    add_generic_cli(parser)
    args = parser.parse_args()

    clean_existing_version(
        os.path.join(REPO_DIR),
        extra_dir_blacklist=["robot"],
    )

    mandatory_dependencies = create_default_mandatory_settings(GenericCliArgs(args))

    write_repo_loads()
    write_module_templates(mandatory_dependencies)
    manual_fixes(REPO_DIR)
    copy_robot_files()


if __name__ == "__main__":
    main()

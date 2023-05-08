import os

import yaml
from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.utils import render_template, write_file
from bazelrio_gentool.utils import (
    TEMPLATE_BASE_DIR,
    write_file,
    render_template,
    render_templates,
)
from bazelrio_gentool.generate_shared_files import get_bazel_dependencies

SCRIPT_DIR = os.environ["BUILD_WORKSPACE_DIRECTORY"]
REPO_DIR = os.path.join(SCRIPT_DIR, "..")


def main():
    template_files = [
        "WORKSPACE2",
        "BUILD2.bazel",
        "get_mega_group2.py",
    ]

    libraries = []
    libraries.append("opencv")
    libraries.append("ni")
    libraries.append("allwpilib")
    libraries.append("phoenix")
    libraries.append("revlib")
    libraries.append("navx")
    libraries.append("imgui")
    libraries.append("libssh")

    render_templates(
        template_files,
        os.path.join(REPO_DIR, "generate"),
        os.path.join(SCRIPT_DIR, "templates", "mega_group"),
        bazel_dependencies=get_bazel_dependencies(),
        libraries=libraries,
    )

    print("Hello")


if __name__ == "__main__":
    main()

import os

from bazelrio_gentool.generate_shared_files import get_bazel_dependencies
from bazelrio_gentool.utils import render_templates

SCRIPT_DIR = os.environ["BUILD_WORKSPACE_DIRECTORY"]
REPO_DIR = os.path.join(SCRIPT_DIR, "..")


def main():
    template_files = [
        "WORKSPACE",
        "BUILD.bazel",
        "get_mega_group.py",
    ]

    libraries = []
    libraries.append("opencv")
    libraries.append("ni")
    libraries.append("allwpilib")
    libraries.append("phoenix")
    libraries.append("phoenix6")
    libraries.append("revlib")
    libraries.append("navx")
    libraries.append("imgui")
    libraries.append("libssh")
    libraries.append("apriltaglib")
    libraries.append("pathplannerlib")
    libraries.append("photonlib")

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

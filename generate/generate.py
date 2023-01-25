import os

import yaml

def load_cached_versions():
    with open('/home/pjreiniger/git/bzlmodRio/gentool/bazelrio_gentool/cached_versions.yml', 'r') as file:
        return yaml.load(file, Loader=yaml.SafeLoader)


def load_cached_version_info(repo_name, version):
    data = load_cached_versions()

    repo_info = data[repo_name]
    for versions in repo_info:
        if versions['version'] == version:
            return versions

    raise Exception(f"{repo_name}:{version} Not found!")

class Library:
    def __init__(self, repo, subfolder, alias, has_jni=False):
        self.repo = repo
        self.subfolder = subfolder
        self.alias = alias
        self.has_jni = has_jni


class Repo:
    def __init__(self, repo, version_infos):
        self.repo = repo
        self.version_infos = version_infos


def main():


    repos = []
    cached_versions = load_cached_versions()

    for r in cached_versions:
        print(r)
        version_infos = []
        for v in cached_versions[r]:
            print(v)
            version_infos.append(v)
        repos.append(Repo(r, version_infos))

    print(cached_versions)

    libraries = [
        Library("ctre", "cpp/ctre/phoenix", "//libraries/cpp/wpiapi-cpp"),
        Library("navx", "cpp/kauailabs/navx", "//libraries/cpp/navx"),
        Library("rev", "cpp/rev/revlib", "//libraries/cpp/revlib-cpp"),
        Library(
            "allwpilib", "cpp/wpilib/cameraserver", "//libraries/cpp/cameraserver"
        ),
        Library(
            "allwpilib", "cpp/wpilib/cscore", "//libraries/cpp/cscore", has_jni=True
        ),
        Library("allwpilib", "cpp/wpilib/hal", "//libraries/cpp/hal", has_jni=True),
        Library(
            "allwpilib",
            "cpp/wpilib/new_commands",
            "//libraries/cpp/wpilibNewCommands",
        ),
        Library(
            "allwpilib", "cpp/wpilib/ntcore", "//libraries/cpp/ntcore", has_jni=True
        ),
        Library("allwpilib", "cpp/wpilib/wpilibc", "//libraries/cpp/wpilibc"),
        Library(
            "allwpilib",
            "cpp/wpilib/wpimath",
            "//libraries/cpp/wpimath",
            has_jni=True,
        ),
        Library(
            "allwpilib", "cpp/wpilib/wpinet", "//libraries/cpp/wpinet", has_jni=True
        ),
        Library(
            "allwpilib",
            "cpp/wpilib/wpiutil",
            "//libraries/cpp/wpiutil",
            has_jni=True,
        ),
        Library(
            "allwpilib",
            "cpp/wpilib/simulation/halsim_ds_socket",
            "//libraries/cpp/halsim_ds_socket",
        ),
        Library(
            "allwpilib",
            "cpp/wpilib/simulation/halsim_gui",
            "//libraries/cpp/halsim_gui",
        ),
        Library(
            "allwpilib",
            "cpp/wpilib/simulation/halsim_ws_client",
            "//libraries/cpp/halsim_ws_client",
        ),
        Library(
            "allwpilib",
            "cpp/wpilib/simulation/halsim_ws_server",
            "//libraries/cpp/halsim_ws_server",
        ),
        Library("ctre", "java/ctre/phoenix", "//libraries/java/wpiapi-java"),
        Library("navx", "java/kauailabs/navx", "//libraries/java/navx"),
        Library("rev", "java/rev/revlib", "//libraries/java/revlib-java"),
        Library("wpi-opencv", "java/opencv", "//libraries/java/opencv"),
        Library(
            "allwpilib", "java/wpilib/cameraserver", "//libraries/java/cameraserver"
        ),
        Library("allwpilib", "java/wpilib/cscore", "//libraries/java/cscore"),
        Library("allwpilib", "java/wpilib/hal", "//libraries/java/hal"),
        Library(
            "allwpilib",
            "java/wpilib/new_commands",
            "//libraries/java/wpilibNewCommands",
        ),
        Library("allwpilib", "java/wpilib/ntcore", "//libraries/java/ntcore"),
        Library("allwpilib", "java/wpilib/wpilibj", "//libraries/java/wpilibj"),
        Library("allwpilib", "java/wpilib/wpimath", "//libraries/java/wpimath"),
        Library("allwpilib", "java/wpilib/wpinet", "//libraries/java/wpinet"),
        Library("allwpilib", "java/wpilib/wpiutil", "//libraries/java/wpiutil"),
        Library(
            "allwpilib",
            "java/wpilib/shuffleboard",
            "//libraries/java/shuffleboard-api",
        ),
        Library("allwpilib", "tools/glass", "//libraries/tools/glass"),
        Library("allwpilib", "tools/pathweaver", "//libraries/tools/PathWeaver"),
        Library("allwpilib", "tools/robotbuilder", "//libraries/tools/RobotBuilder"),
        Library("allwpilib", "tools/shuffleboard", "//libraries/tools/Shuffleboard"),
        Library(
            "allwpilib", "tools/smartdashboard", "//libraries/tools/SmartDashboard"
        ),
    ]

    for lib in libraries:
        dir = os.path.join(
            "/home/pjreiniger/git/bzlmodRio/bzlmodRio/libraries", lib.subfolder
        )
        if not os.path.exists(dir):
            os.makedirs(dir)
        with open(os.path.join(dir, "BUILD"), "w") as f:
            f.write(
                f"""alias(
    name = "{lib.subfolder.split('/')[-1]}",
    actual = "@{lib.repo}{lib.alias}",
    visibility = ["//visibility:public"],
)"""
            )
            if lib.has_jni:
                f.write(
                    f"""

alias(
    name = "jni",
    actual = "@{lib.repo}{lib.alias}:jni",
    visibility = ["//visibility:public"],
)"""
                )
            
            f.write("\n")

    for repo in repos:
        dir = os.path.join(
            "/home/pjreiniger/git/bzlmodRio/bzlmodRio/private/non_bzlmod/smart_dependencies",
            repo.repo,
        )
        if not os.path.exists(dir):
            os.makedirs(dir)
        with open(os.path.join(dir, "BUILD"), "w") as f:
            f.write("")

        with open(os.path.join(dir, f"load_{repo.repo}.bzl"), "w") as f:
            f.write(
                f"""load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_{repo.repo.replace('-', "_")}(version):
    if version == None:
        print("Not using {repo.repo}")
        return

    if version == "local":
        print("Using local {repo.repo}")
        native.local_repository(
            name = "{repo.repo}",
            path = "../../bzlmodRio-{repo.repo}",
        )
        return
"""
            )
            for version in repo.version_infos:
                f.write(
                    f"""    elif version == "{version['version']}":
        sha = "{version['sha']}"
        committish = "{version['commitish']}"
"""
                )
            f.write(
                f"""    else:
        fail("Unsupported version {{}}".format(version))

    http_archive(
        name = "{repo.repo}",
        sha256 = sha,
        strip_prefix = "bzlmodRio-{repo.repo}-{{}}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-{repo.repo}/archive/{{}}.tar.gz".format(committish),
    )
"""
            )


if __name__ == "__main__":
    """
    bazel run @bazelrio//generate
    """
    main()

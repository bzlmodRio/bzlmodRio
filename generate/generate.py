import os
from bazelrio_gentool.load_cached_versions import load_cached_versions


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

    # repos = [
    #     Repo(
    #         "ctre",
    #         [
    #             dict(
    #                 version="5.30.1",
    #                 sha="b9b02d45e52d7572fefb005209c38ceaa4fecf95bd53bd409db88a93f6bc96bd",
    #                 commitish="4f9fa5b8affaf41fc6573c3e00df24f5a2340153",
    #             )
    #         ],
    #     ),
    #     Repo(
    #         "allwpilib",
    #         [
    #             dict(
    #                 version="2023.2.1",
    #                 sha="d4d8bccb48408d367f3120ec1820fa5452d0eaf0dd053adb18c9e50ab44d2410",
    #                 commitish="458c77738bee96002ba6edda0117072bc32c4dd1",
    #             )
    #         ],
    #     ),
    #     Repo(
    #         "rev",
    #         [
    #             dict(
    #                 version="X",
    #                 sha="acfff5ad269f10eac0407d2761c80273088eb98d8fc9b3bc020e8db8c9d0f04f",
    #                 commitish="cd3dc9581a1d6dceac542c29dded0b362def394f",
    #             )
    #         ],
    #     ),
    #     Repo(
    #         "navx",
    #         [
    #             dict(
    #                 version="2023.0.0",
    #                 sha="7b344ad63ec981e585bf6a484ff42fbc8562d572178f88b21152434fcbf3926d",
    #                 commitish="acaf439c6abcafbc60fc3a38632f50493e67fecd",
    #             )
    #         ],
    #     ),
    #     Repo(
    #         "ni",
    #         [
    #             dict(
    #                 version="X",
    #                 sha="54ed8d2e0d2c5a76c16eb312b48cef60c2de451910def5e10b7c8e4a8e80f89a",
    #                 commitish="cc24faa330eb82f05fe30c7df030d59cfa3cfd06",
    #             )
    #         ],
    #     ),
    #     Repo(
    #         "opencv",
    #         [
    #             dict(
    #                 version="X",
    #                 sha="4b0b9d708cafb597fa1b7b1730a653c59e03c8f71d58d9474fcce329a112bd61",
    #                 commitish="4fc2007fbdb70ec71c40a94ca2b9eaf0cadb5bcb",
    #             )
    #         ],
    #     ),
    # ]

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

def load_{repo.repo}(version):
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

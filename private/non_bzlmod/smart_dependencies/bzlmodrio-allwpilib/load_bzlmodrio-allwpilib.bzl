load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_allwpilib(version):
    if version == None:
        print("Not using bzlmodrio-allwpilib")
        create_null_repository(
            name = "bzlmodrio-allwpilib",
            sanitized_repo_name = "bzlmodrio_allwpilib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-allwpilib")
        native.local_repository(
            name = "bzlmodrio-allwpilib",
            path = "../../libraries/bzlmodRio-allwpilib",
        )
        return
    elif version == "2023.3.2":
        sha = "4c944b1e9a3de134614565f8da49bd278ee1f086615a8dcdc5e0a75692b68f13"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/{}/bzlmodRio-allwpilib-{}.tar.gz".format(version, version),
    )

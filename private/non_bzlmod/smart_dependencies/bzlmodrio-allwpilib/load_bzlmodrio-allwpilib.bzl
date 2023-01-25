load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_allwpilib(version):
    if version == None:
        print("Not using bzlmodrio-allwpilib")
        return

    if version == "local":
        print("Using local bzlmodrio-allwpilib")
        native.local_repository(
            name = "bzlmodrio-allwpilib",
            path = "../../bzlmodRio-allwpilib",
        )
        return
    elif version == "2023.2.1":
        sha = "8f402290666f837c99ff985908b05223b4b2f5d32ab2f552308ca3b753856a41"
        committish = "38742ec2cc6e2d05da155b74772edfe2102f6693"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-bzlmodrio-allwpilib-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-bzlmodrio-allwpilib/archive/{}.tar.gz".format(committish),
    )

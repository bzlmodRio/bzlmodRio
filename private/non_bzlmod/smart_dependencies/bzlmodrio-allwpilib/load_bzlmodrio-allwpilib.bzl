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
        sha = "e35e8cb87480daa93db40620069aa50917df32d782b3545ce8a8e95b2078b371"
        committish = "864715ba7fbbfa8ffd820693d11aa93342b39f2e"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-allwpilib-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/archive/{}.tar.gz".format(committish),
    )

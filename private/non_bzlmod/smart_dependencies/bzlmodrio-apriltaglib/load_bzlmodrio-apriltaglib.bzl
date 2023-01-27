load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_apriltaglib(version):
    if version == None:
        print("Not using bzlmodrio-apriltaglib")
        return

    if version == "local":
        print("Using local bzlmodrio-apriltaglib")
        native.local_repository(
            name = "bzlmodrio-apriltaglib",
            path = "../../bzlmodRio-apriltaglib",
        )
        return
    elif version == "X":
        sha = "None"
        committish = "None"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-apriltaglib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-apriltaglib-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-apriltaglib/archive/{}.tar.gz".format(committish),
    )

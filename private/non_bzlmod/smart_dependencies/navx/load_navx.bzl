load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_navx(version):
    if version == None:
        print("Not using navx")
        return

    if version == "local":
        print("Using local navx")
        native.local_repository(
            name = "navx",
            path = "../../bzlmodRio-navx",
        )
        return
    elif version == "2023.0.0":
        sha = "7b344ad63ec981e585bf6a484ff42fbc8562d572178f88b21152434fcbf3926d"
        committish = "acaf439c6abcafbc60fc3a38632f50493e67fecd"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "navx",
        sha256 = sha,
        strip_prefix = "bzlmodRio-navx-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-navx/archive/{}.tar.gz".format(committish),
    )

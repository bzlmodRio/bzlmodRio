load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rev(version):
    if version == None:
        print("Not using rev")
        return

    if version == "local":
        print("Using local rev")
        native.local_repository(
            name = "rev",
            path = "../../bzlmodRio-rev",
        )
        return
    elif version == "2023.1.2":
        sha = "acfff5ad269f10eac0407d2761c80273088eb98d8fc9b3bc020e8db8c9d0f04f"
        committish = "cd3dc9581a1d6dceac542c29dded0b362def394f"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rev",
        sha256 = sha,
        strip_prefix = "bzlmodRio-rev-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-rev/archive/{}.tar.gz".format(committish),
    )

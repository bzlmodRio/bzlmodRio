load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio-ni(version):
    if version == None:
        print("Not using bzlmodrio-ni")
        return

    if version == "local":
        print("Using local bzlmodrio-ni")
        native.local_repository(
            name = "bzlmodrio-ni",
            path = "../../bzlmodRio-bzlmodrio-ni",
        )
        return
    elif version == "2023.3.0":
        sha = "53234e9338a215b9ea96e4e84bd1695ac2caefe18effcc9ece1ea5f48003b8b5"
        committish = "dd24e2d211cff83e9d21b88bbc0b80de98aac29f"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-ni",
        sha256 = sha,
        strip_prefix = "bzlmodRio-bzlmodrio-ni-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-bzlmodrio-ni/archive/{}.tar.gz".format(committish),
    )

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_ni(version):
    if version == None:
        print("Not using bzlmodrio-ni")
        return

    if version == "local":
        print("Using local bzlmodrio-ni")
        native.local_repository(
            name = "bzlmodrio-ni",
            path = "../../bzlmodRio-ni",
        )
        return
    elif version == "2023.3.0":
        sha = "0169bded6cc9e3fef1092bdafd3216e2f8bdcf247c9d7116f02a2a261c5350f6"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-ni",
        sha256 = sha,
        strip_prefix = "bzlmodRio-ni-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/archive/refs/tags/{}.tar.gz".format(version),
    )

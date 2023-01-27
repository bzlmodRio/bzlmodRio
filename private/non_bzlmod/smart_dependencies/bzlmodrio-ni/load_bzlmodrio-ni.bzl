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
    elif version == "2022.4.0":
        sha = "e41e562f148aef838f3153a29006d601551352a007e3d08443f616b7b67cc637"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-ni",
        sha256 = sha,
        strip_prefix = "bzlmodRio-ni-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/archive/refs/tags/{}.tar.gz".format(version),
    )

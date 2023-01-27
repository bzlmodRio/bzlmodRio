load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_libssh(version):
    if version == None:
        print("Not using bzlmodrio-libssh")
        return

    if version == "local":
        print("Using local bzlmodrio-libssh")
        native.local_repository(
            name = "bzlmodrio-libssh",
            path = "../../bzlmodRio-libssh",
        )
        return
    elif version == "X":
        sha = "None"
        committish = "None"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-libssh",
        sha256 = sha,
        strip_prefix = "bzlmodRio-libssh-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-libssh/archive/{}.tar.gz".format(committish),
    )

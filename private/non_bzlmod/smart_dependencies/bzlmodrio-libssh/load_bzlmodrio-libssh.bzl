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
    elif version == "0.95-1":
        sha = "1b8af8c67f5f171419987c014808b4428427f04d19914fb7d3e66a5a88a7f184"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-libssh",
        sha256 = sha,
        strip_prefix = "bzlmodRio-libssh-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-libssh/archive/refs/tags/{}.tar.gz".format(version),
    )

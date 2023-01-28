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
    elif version == "0.95-6":
        sha = "6048f0ae0c053becc5f7256f9e7b445c9d8c008fc34238f4bd19cd22d5e78ffa"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-libssh",
        sha256 = sha,
        strip_prefix = "bzlmodRio-libssh-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-libssh/archive/refs/tags/{}.tar.gz".format(version),
    )

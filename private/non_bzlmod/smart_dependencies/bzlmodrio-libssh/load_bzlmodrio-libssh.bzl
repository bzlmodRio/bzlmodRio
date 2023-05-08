load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_libssh(version):
    if version == None:
        print("Not using bzlmodrio-libssh")
        create_null_repository(
            name = "bzlmodrio-libssh",
            sanitized_repo_name = "bzlmodrio_libssh",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-libssh")
        native.local_repository(
            name = "bzlmodrio-libssh",
            path = "../../libraries/bzlmodRio-libssh",
        )
        return
    elif version == "0.95-6":
        sha = "9908279dfecd0acf4a644117f61f480b21cc1185a9ab772bf697f78f7b676277"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-libssh",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-libssh/releases/download/{}/bzlmodRio-libssh-{}.tar.gz".format(version, version),
    )

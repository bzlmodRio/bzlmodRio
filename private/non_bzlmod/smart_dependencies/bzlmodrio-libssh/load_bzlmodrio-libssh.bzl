load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_libssh(version, local_monorepo_base):
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
            path = local_monorepo_base + "/libraries/bzlmodRio-libssh",
        )
        return
    elif version == "0.95-6":
        sha = "ae78e44438c17516842d071deeeedeadf3aac3703f9accc19cf6e0e8c1067133"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-libssh",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-libssh/releases/download/{}/bzlmodRio-libssh-{}.tar.gz".format(version, version),
    )

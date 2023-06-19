load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_libssh(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-libssh"):
        print("Repo bzlmodrio-libssh has already been defined")
        return

    if version == None:
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
        sha = "e2d0ffdf4928bec8f4a4d73f971542196148892ea8ed5fe5e17702d72cde3ab0"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-libssh",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-libssh/releases/download/{}/bzlmodRio-libssh-{}.tar.gz".format(version, version),
    )

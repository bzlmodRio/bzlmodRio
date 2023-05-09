load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_libssh(version, local_monorepo_base):
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
        sha = "ae78e44438c17516842d071deeeedeadf3aac3703f9accc19cf6e0e8c1067133"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-libssh",
        strip_prefix = "bzlmodRio-libssh-refactor_dev",
        sha256 = "1fa10283d72314cf098776935c0b30bfab2e767d53fbc30609fafa10c2574225",
        url = "https://github.com/bzlmodRio/bzlmodRio-libssh/archive/refs/heads/refactor_dev.zip",
    )

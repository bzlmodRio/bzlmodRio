load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_revlib(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-revlib"):
        print("Repo bzlmodrio-revlib has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-revlib",
            sanitized_repo_name = "bzlmodrio_revlib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-revlib")
        native.local_repository(
            name = "bzlmodrio-revlib",
            path = local_monorepo_base + "/libraries/bzlmodRio-revlib",
        )
        return
    elif version == "2023.1.3":
        sha = "103052eb158fb8c544a250c7642090b674ecbc805cfb1325e63aec32fa9d5dbf"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-revlib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-revlib/releases/download/{}/bzlmodRio-revlib-{}.tar.gz".format(version, version),
    )

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_phoenix(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-phoenix"):
        print("Repo bzlmodrio-phoenix has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-phoenix",
            sanitized_repo_name = "bzlmodrio_phoenix",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-phoenix")
        native.local_repository(
            name = "bzlmodrio-phoenix",
            path = local_monorepo_base + "/libraries/bzlmodRio-phoenix",
        )
        return
    elif version == "5.30.4":
        sha = "305c7653b133813624d93d9ee68a854d669a1d9a2a0843c539062b4bcb96d63b"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-phoenix",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-phoenix/releases/download/{}/bzlmodRio-phoenix-{}.tar.gz".format(version, version),
    )

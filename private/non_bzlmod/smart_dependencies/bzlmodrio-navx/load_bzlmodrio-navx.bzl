load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_navx(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-navx"):
        print("Repo bzlmodrio-navx has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-navx",
            sanitized_repo_name = "bzlmodrio_navx",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-navx")
        native.local_repository(
            name = "bzlmodrio-navx",
            path = local_monorepo_base + "/libraries/bzlmodRio-navx",
        )
        return
    elif version == "2023.0.3":
        sha = "bdfebf177f64267ed68be277ca1b074fc8ca5f24907371667cd5dbb568e1aadc"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-navx",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-navx/releases/download/{}/bzlmodRio-navx-{}.tar.gz".format(version, version),
    )

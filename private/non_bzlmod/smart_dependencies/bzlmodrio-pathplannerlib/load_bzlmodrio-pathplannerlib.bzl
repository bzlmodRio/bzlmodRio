load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_pathplannerlib(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-pathplannerlib"):
        print("Repo bzlmodrio-pathplannerlib has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-pathplannerlib",
            sanitized_repo_name = "bzlmodrio_pathplannerlib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-pathplannerlib")
        native.local_repository(
            name = "bzlmodrio-pathplannerlib",
            path = local_monorepo_base + "/libraries/bzlmodRio-pathplannerlib",
        )
        return
    elif version == "2023.4.4":
        sha = "3792f6e7e7e94c3956176b08b11157a6618fa0c94fc86bef2a48a71b8d741316"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-pathplannerlib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-pathplannerlib/releases/download/{}/bzlmodRio-pathplannerlib-{}.tar.gz".format(version, version),
    )

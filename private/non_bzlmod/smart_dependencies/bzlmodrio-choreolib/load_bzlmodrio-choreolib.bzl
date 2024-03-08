load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_choreolib(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-choreolib"):
        print("Repo bzlmodrio-choreolib has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-choreolib",
            sanitized_repo_name = "bzlmodrio_choreolib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-choreolib")
        native.local_repository(
            name = "bzlmodrio-choreolib",
            path = local_monorepo_base + "/libraries/bzlmodRio-choreolib",
        )
        return
    elif version == "2024.1.2":
        sha = "9265783838a98a3938cc07ae057a5fcbfdbb442729df3341561e1e863fcfc518"
    elif version == "2024.1.3":
        sha = "c3311d738ebd7d8cb7f5951973a26b2f092af3b51f463d743871b9550b8c2acf"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-choreolib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-choreolib/releases/download/{}/bzlmodRio-choreolib-{}.tar.gz".format(version, version),
    )

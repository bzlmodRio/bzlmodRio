load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_ni(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-ni"):
        print("Repo bzlmodrio-ni has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-ni",
            sanitized_repo_name = "bzlmodrio_ni",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-ni")
        native.local_repository(
            name = "bzlmodrio-ni",
            path = local_monorepo_base + "/libraries/bzlmodRio-ni",
        )
        return
    elif version == "2023.3.0":
        sha = "cf1532c896bb95f4eb73c8cf5bac968f74f6986c12de141d8c4f5d8ff95cd520"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-ni",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/{}/bzlmodRio-ni-{}.tar.gz".format(version, version),
    )

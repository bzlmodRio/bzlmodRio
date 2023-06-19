load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_apriltaglib(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-apriltaglib"):
        print("Repo bzlmodrio-apriltaglib has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-apriltaglib",
            sanitized_repo_name = "bzlmodrio_apriltaglib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-apriltaglib")
        native.local_repository(
            name = "bzlmodrio-apriltaglib",
            path = local_monorepo_base + "/libraries/bzlmodRio-apriltaglib",
        )
        return
    elif version == "3.2.0-3":
        sha = "314812473f33c00e23b8af7865ddf0e43b38a37cafb97c504c9cb533ddac776f"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-apriltaglib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-apriltaglib/releases/download/{}/bzlmodRio-apriltaglib-{}.tar.gz".format(version, version),
    )

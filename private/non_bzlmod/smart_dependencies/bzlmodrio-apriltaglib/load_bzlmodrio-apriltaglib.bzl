load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_apriltaglib(version, local_monorepo_base):
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
        sha = "4ab8a9a3b74b96ceccc7a74b931aea034c6aee325a79f2a8d5e01885502fce5d"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-apriltaglib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-apriltaglib/releases/download/{}/bzlmodRio-apriltaglib-{}.tar.gz".format(version, version),
    )

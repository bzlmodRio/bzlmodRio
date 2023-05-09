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
        sha = "9b46ac1ea1257fc6bc38cef90d48498a1458ee6cbdce9ab320d98e1c7482c7de"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-apriltaglib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-apriltaglib/releases/download/{}/bzlmodRio-apriltaglib-{}.tar.gz".format(version, version),
    )

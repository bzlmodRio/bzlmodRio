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
        strip_prefix = "bzlmodRio-apriltaglib-refactor_dev",
        sha256 = "4e90b6011e2f1b69e50f2d6c19f2e1a70eb7cef41d0414d1df7a06ba6c4edf34",
        url = "https://github.com/bzlmodRio/bzlmodRio-apriltaglib/archive/refs/heads/refactor_dev.zip",
    )

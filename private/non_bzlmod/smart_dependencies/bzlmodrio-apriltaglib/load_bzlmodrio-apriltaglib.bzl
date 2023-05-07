load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_apriltaglib(version):
    if version == None:
        print("Not using bzlmodrio-apriltaglib")
        create_null_repository(
            name = "bzlmodrio-apriltaglib",
            sanitized_repo_name = "bzlmodrio_apriltaglib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-apriltaglib")
        native.local_repository(
            name = "bzlmodrio-apriltaglib",
            path = "../../libraries/bzlmodRio-apriltaglib",
        )
        return
    elif version == "3.2.0-3":
        sha = "ff73fa6782897049a9c707b66c2ac4d4942a7b4c9fcfda898d11193c6261df2f"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-apriltaglib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-apriltaglib-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-apriltaglib/archive/refs/tags/{}.tar.gz".format(version),
    )

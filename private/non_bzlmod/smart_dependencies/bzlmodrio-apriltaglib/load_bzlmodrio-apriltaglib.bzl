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
        sha = "285e85275133fdac20e8be7d93370d9ec140f0ec80139805a819db48e0795fb6"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-apriltaglib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-apriltaglib-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-apriltaglib/archive/refs/tags/{}.tar.gz".format(version),
    )

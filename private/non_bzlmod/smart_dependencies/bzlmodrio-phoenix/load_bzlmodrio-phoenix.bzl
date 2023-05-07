load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_phoenix(version):
    if version == None:
        print("Not using bzlmodrio-phoenix")
        create_null_repository(
            name = "bzlmodrio-phoenix",
            sanitized_repo_name = "bzlmodrio_phoenix",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-phoenix")
        native.local_repository(
            name = "bzlmodrio-phoenix",
            path = "../../libraries/bzlmodRio-phoenix",
        )
        return
    elif version == "5.30.2":
        sha = "bf4aaeb1837c5f1012efdcdf7b6857d35ebb05189e3f26e5f3685a8c72e579ec"
    elif version == "5.30.3+23.0.4":
        sha = "792c2cd4563a0db5b37b53a0508371ec72f3655fdd01346eee8bf52e2415ad6e"
    elif version == "5.30.4":
        sha = "XXX"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-phoenix",
        sha256 = sha,
        strip_prefix = "bzlmodRio-phoenix-{}".format(version.replace("+", "-")),
        url = "https://github.com/bzlmodRio/bzlmodRio-phoenix/archive/refs/tags/{}.tar.gz".format(version),
    )

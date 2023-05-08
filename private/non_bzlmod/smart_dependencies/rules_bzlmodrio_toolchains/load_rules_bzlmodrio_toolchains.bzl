load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_bzlmodrio_toolchains(version):
    if version == None:
        print("Not using rules_bzlmodrio_toolchains")
        create_null_repository(
            name = "rules_bzlmodrio_toolchains",
            sanitized_repo_name = "rules_bzlmodrio_toolchains",
        )
        return

    if version == "local":
        print("Using local rules_bzlmodrio_toolchains")
        native.local_repository(
            name = "rules_bzlmodrio_toolchains",
            path = "../../rules/rules_bzlmodRio_toolchains",
        )
        return
    elif version == "2023-7":
        sha = "1c566358f97b093916e150de10b65d6527ad268e5bd8bc0a0a8bfd04b390751a"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_bzlmodrio_toolchains",
        sha256 = sha,
        strip_prefix = "rules_bzlmodRio_toolchains-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_bzlmodRio_toolchains/archive/refs/tags/{}.tar.gz".format(version),
    )

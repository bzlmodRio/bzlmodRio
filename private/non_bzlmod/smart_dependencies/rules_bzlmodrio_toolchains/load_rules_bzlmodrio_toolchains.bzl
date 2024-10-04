load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_bzlmodrio_toolchains(version, local_monorepo_base):
    if native.existing_rule("rules_bzlmodrio_toolchains"):
        print("Repo rules_bzlmodrio_toolchains has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "rules_bzlmodrio_toolchains",
            sanitized_repo_name = "rules_bzlmodrio_toolchains",
        )
        return

    if version == "local":
        print("Using local rules_bzlmodrio_toolchains")
        native.local_repository(
            name = "rules_bzlmodrio_toolchains",
            path = local_monorepo_base + "/rules/rules_bzlmodRio_toolchains",
        )
        return
    elif version == "2023-7":
        sha = "1c566358f97b093916e150de10b65d6527ad268e5bd8bc0a0a8bfd04b390751a"
    elif version == "2024-1":
        sha = "cd3ff046427e9c6dbc0c86a458c8cf081b8045fc3fb4265d08c0ebfc17f9cb30"
    elif version == "2024-1.bcr1":
        sha = "2ef1cafce7f4fd4e909bb5de8b0dc771a934646afd55d5f100ff31f6b500df98"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "rules_bzlmodrio_toolchains",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_bzlmodRio_toolchains/releases/download/{}/rules_bzlmodRio_toolchains-{}.tar.gz".format(version, version),
    )

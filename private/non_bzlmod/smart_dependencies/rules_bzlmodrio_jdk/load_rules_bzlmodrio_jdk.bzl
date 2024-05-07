load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_bzlmodrio_jdk(version, local_monorepo_base):
    if native.existing_rule("rules_bzlmodrio_jdk"):
        print("Repo rules_bzlmodrio_jdk has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "rules_bzlmodrio_jdk",
            sanitized_repo_name = "rules_bzlmodrio_jdk",
        )
        return

    if version == "local":
        print("Using local rules_bzlmodrio_jdk")
        native.local_repository(
            name = "rules_bzlmodrio_jdk",
            path = local_monorepo_base + "/rules/rules_bzlmodRio_jdk",
        )
        return
    elif version == "17.0.8-7":
        sha = "36cd468c867817ec460d76c28ec0ccd2d9fac4a2cf966af3935243a8a4a08108"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "rules_bzlmodrio_jdk",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_bzlmodRio_jdk/releases/download/{}/rules_bzlmodRio_jdk-{}.tar.gz".format(version, version),
    )

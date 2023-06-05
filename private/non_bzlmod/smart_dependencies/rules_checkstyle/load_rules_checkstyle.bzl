load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_checkstyle(version, local_monorepo_base):
    if native.existing_rule("rules_checkstyle"):
        print("Repo rules_checkstyle has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "rules_checkstyle",
            sanitized_repo_name = "rules_checkstyle",
        )
        return

    if version == "local":
        print("Using local rules_checkstyle")
        native.local_repository(
            name = "rules_checkstyle",
            path = local_monorepo_base + "/rules/rules_checkstyle",
        )
        return
    elif version == "10.1":
        sha = "08c80009bf6e8af6d3e2e8b6493b86012ea4ab5bf0f62c527d53557552a03d77"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "rules_checkstyle",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_checkstyle/releases/download/{}/rules_checkstyle-{}.tar.gz".format(version, version),
    )

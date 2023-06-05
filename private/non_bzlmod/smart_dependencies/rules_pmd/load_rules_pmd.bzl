load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_pmd(version, local_monorepo_base):
    if native.existing_rule("rules_pmd"):
        print("Repo rules_pmd has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "rules_pmd",
            sanitized_repo_name = "rules_pmd",
        )
        return

    if version == "local":
        print("Using local rules_pmd")
        native.local_repository(
            name = "rules_pmd",
            path = local_monorepo_base + "/rules/rules_pmd",
        )
        return
    elif version == "6.43.0":
        sha = "920de7134c12a6f5fb465aec0a4684451fe5dd992c5f4aae86551e6307d4cbe2"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "rules_pmd",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_pmd/releases/download/{}/rules_pmd-{}.tar.gz".format(version, version),
    )

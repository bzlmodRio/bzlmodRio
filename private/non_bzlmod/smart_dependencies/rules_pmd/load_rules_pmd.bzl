load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_pmd(version, local_monorepo_base):
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
        sha = "4bec86ee0d5bfc94fcebafb21afdb3d2c7740bc4bd6d7657fb9f63e94affbfae"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_pmd",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_pmd/releases/download/{}/rules_pmd-{}.tar.gz".format(version, version),
    )

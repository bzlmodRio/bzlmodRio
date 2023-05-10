load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_wpiformat(version, local_monorepo_base):
    if version == None:
        create_null_repository(
            name = "rules_wpiformat",
            sanitized_repo_name = "rules_wpiformat",
        )
        return

    if version == "local":
        print("Using local rules_wpiformat")
        native.local_repository(
            name = "rules_wpiformat",
            path = local_monorepo_base + "/rules/rules_wpiformat",
        )
        return
    elif version == "2022.30":
        sha = "3e5edc1516a8e2edb0c89d7e9e5b90f66e7fb6ec1dccd8c9bb2c12589a746176"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_wpiformat",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_wpiformat/releases/download/{}/rules_wpiformat-{}.tar.gz".format(version, version),
    )

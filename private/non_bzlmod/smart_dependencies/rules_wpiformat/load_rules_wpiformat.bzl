load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_wpiformat(version):
    if version == None:
        print("Not using rules_wpiformat")
        create_null_repository(
            name = "rules_wpiformat",
            sanitized_repo_name = "rules_wpiformat",
        )
        return

    if version == "local":
        print("Using local rules_wpiformat")
        native.local_repository(
            name = "rules_wpiformat",
            path = "../../rules/rules_wpiformat",
        )
        return
    elif version == "2022.30":
        sha = "b5a2a5cdff940e4dcd9d0188d5579cd260d2d96571b74b087acb701617bd27ad"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_wpiformat",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_wpiformat/releases/download/{}/rules_wpiformat-{}.tar.gz".format(version, version),
    )

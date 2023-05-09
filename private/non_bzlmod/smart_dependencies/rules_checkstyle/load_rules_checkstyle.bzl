load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_checkstyle(version, local_monorepo_base):
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
        sha = "94c5696d9948cc6d77168262e66845e41d37843831447dc71755a686d546c346"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_checkstyle",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_checkstyle/releases/download/{}/rules_checkstyle-{}.tar.gz".format(version, version),
    )

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_checkstyle(version):
    if version == None:
        print("Not using rules_checkstyle")
        create_null_repository(
            name = "rules_checkstyle",
            sanitized_repo_name = "rules_checkstyle",
        )
        return

    if version == "local":
        print("Using local rules_checkstyle")
        native.local_repository(
            name = "rules_checkstyle",
            path = "../../rules/rules_checkstyle",
        )
        return
    elif version == "10.1":
        sha = "dc1282d77bed576c4a2720b30ea9664421a3b71ab49827d3ce6759917dfc8567"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_checkstyle",
        sha256 = sha,
        strip_prefix = "rules_checkstyle-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_checkstyle/archive/refs/tags/{}.tar.gz".format(version),
    )

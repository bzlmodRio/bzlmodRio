load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_bazelrio(version):
    if version == None:
        print("Not using rules_bazelrio")
        create_null_repository(
            name = "rules_bazelrio",
            sanitized_repo_name = "rules_bazelrio",
        )
        return

    if version == "local":
        print("Using local rules_bazelrio")
        native.local_repository(
            name = "rules_bazelrio",
            path = "../../rules/rules_bazelrio",
        )
        return
    elif version == "0.0.10":
        sha = "378c92e50e9f04a600b8963d4d3dab3bdb07c1ee360caacea3b4df0ede84b4c1"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_bazelrio",
        sha256 = sha,
        strip_prefix = "rules_bazelrio-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_bazelrio/archive/refs/tags/{}.tar.gz".format(version),
    )

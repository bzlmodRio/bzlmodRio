load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_spotless(version):
    if version == None:
        print("Not using rules_spotless")
        create_null_repository(
            name = "rules_spotless",
            sanitized_repo_name = "rules_spotless",
        )
        return

    if version == "local":
        print("Using local rules_spotless")
        native.local_repository(
            name = "rules_spotless",
            path = "../../rules/rules_spotless",
        )
        return
    elif version == "2.34.0":
        sha = "b77138dab419a72194fbaeadc09467f198268a99c45242792fa5291acf02be1d"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_spotless",
        sha256 = sha,
        strip_prefix = "rules_spotless-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_spotless/archive/refs/tags/{}.tar.gz".format(version),
    )

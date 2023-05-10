load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_spotless(version, local_monorepo_base):
    if version == None:
        create_null_repository(
            name = "rules_spotless",
            sanitized_repo_name = "rules_spotless",
        )
        return

    if version == "local":
        print("Using local rules_spotless")
        native.local_repository(
            name = "rules_spotless",
            path = local_monorepo_base + "/rules/rules_spotless",
        )
        return
    elif version == "2.34.0":
        sha = "d0a49b0dd1c3e7a4efb7debb1cc39584345e10bf35494cd051d0e4e8a4d54241"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_spotless",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_spotless/releases/download/{}/rules_spotless-{}.tar.gz".format(version, version),
    )

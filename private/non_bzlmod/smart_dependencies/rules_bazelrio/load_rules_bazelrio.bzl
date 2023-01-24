load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


def load_rules_bazelrio(version):

    if version == None:
        print("Not using rules_bazelrio")
        return

    if version == "local":
        print("Using local rules_bazelrio")
        native.local_repository(
            name = "rules_bazelrio",
            path = "../../bzlmodRio-rules_bazelrio"
        )
        return

    if version == "0":
        sha = "fcce28d28b4374b703bf40e5ad986f8e62ecbdf8b4584fe0c61da4c2867f4d4d"
        committish = "2e7744e19510fb7a124bc9634b4c793e6b3e55cb"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_bazelrio",
        sha256 = sha,
        strip_prefix = "bzlmodRio-rules_bazelrio-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-rules_bazelrio/archive/{}.zip".format(committish),
    )
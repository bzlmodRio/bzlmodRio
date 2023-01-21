load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


def load_rules_bazelrio(version):

    if version == None:
        print("Not using rules_bazelrio")
        return

    if version == "0":
        sha = "a8e997def42472dd2f31cd90b855c0aeab93aabe1b436cd48f4e1efdd760f01c"
        committish = "bd9c8375bf4f5a91d08cbf64e359c0b30aaf7433"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_bazelrio",
        sha256 = sha,
        strip_prefix = "bzlmodRio-rules_bazelrio-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-rules_bazelrio/archive/{}.zip".format(committish),
    )
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_spotless(version):
    if version == None:
        print("Not using rules_spotless")
        return

    if version == "local":
        print("Using local rules_spotless")
        native.local_repository(
            name = "rules_spotless",
            path = "../../rules_spotless",
        )
        return
    elif version == "2.34.0":
        sha = "0351ea8dda87d1d6697b27bce381c59a1717084b3d8c226dbc9ec3103b8fd285"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_spotless",
        sha256 = sha,
        strip_prefix = "rules_spotless-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_spotless/archive/refs/tags/{}.tar.gz".format(version),
    )

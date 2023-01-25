load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_bazelrio(version):
    if version == None:
        print("Not using rules_bazelrio")
        return

    if version == "local":
        print("Using local rules_bazelrio")
        native.local_repository(
            name = "rules_bazelrio",
            path = "../../bzlmodRio-rules_bazelrio",
        )
        return
    elif version == "0.0.7":
        sha = "a8e997def42472dd2f31cd90b855c0aeab93aabe1b436cd48f4e1efdd760f01c"
        committish = "bd9c8375bf4f5a91d08cbf64e359c0b30aaf7433"
    elif version == "0.0.8":
        sha = "5bcea84860f14b03767cbc4f3d16173502fe60173968da6715fa11b1aedb8fe3"
        committish = "4908451bfa5a04f6b79a6181ad95eeb0eb4e69d3"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_bazelrio",
        sha256 = sha,
        strip_prefix = "bzlmodRio-rules_bazelrio-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-rules_bazelrio/archive/{}.tar.gz".format(committish),
    )

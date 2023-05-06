load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_bazelrio(version):
    if version == None:
        print("Not using rules_bazelrio")
        return

    if version == "local":
        print("Using local rules_bazelrio")
        native.local_repository(
            name = "rules_bazelrio",
            path = "../../rules/rules_bazelrio",
        )
        return
    elif version == "0.0.9":
        sha = "8679cf2ef1b47c184d336bfef97ac0f98fed56546b69e1a5ed02c17833bbf025"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_bazelrio",
        sha256 = sha,
        strip_prefix = "rules_bazelrio-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_bazelrio/archive/refs/tags/{}.tar.gz".format(version),
    )

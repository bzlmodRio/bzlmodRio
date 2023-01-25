load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_roborio_toolchain(version):
    if version == None:
        print("Not using rules_roborio_toolchain")
        return

    if version == "local":
        print("Using local rules_roborio_toolchain")
        native.local_repository(
            name = "rules_roborio_toolchain",
            path = "../../bzlmodRio-rules_roborio_toolchain",
        )
        return
    elif version == "2023-7.6":
        sha = "c83f40ec9bafba45c726062e3c7982f0301fbede9aa46ac25a9900642c13ca66"
        committish = "8668e36043c7489a9669a9281f7024272b36d583"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_roborio_toolchain",
        sha256 = sha,
        strip_prefix = "bzlmodRio-rules_roborio_toolchain-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-rules_roborio_toolchain/archive/{}.tar.gz".format(committish),
    )

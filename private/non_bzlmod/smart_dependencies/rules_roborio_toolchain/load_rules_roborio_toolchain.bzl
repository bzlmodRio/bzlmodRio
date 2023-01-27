load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_roborio_toolchain(version):
    if version == None:
        print("Not using rules_roborio_toolchain")
        return

    if version == "local":
        print("Using local rules_roborio_toolchain")
        native.local_repository(
            name = "rules_roborio_toolchain",
            path = "../../rules_roborio_toolchain",
        )
        return
    elif version == "2022-1":
        sha = "2b63624390bb28dd0bddcff3b24decbb34a0cead961237cc6583bef64b2fe510"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_roborio_toolchain",
        sha256 = sha,
        strip_prefix = "rules_roborio_toolchain-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_roborio_toolchain/archive/refs/tags/{}.tar.gz".format(version),
    )

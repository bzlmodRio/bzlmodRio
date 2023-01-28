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
    elif version == "2023-7":
        sha = "2f37129a12941f918931d8a676156bc933f3d6437735d142fa7d8c9f0e57da48"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_roborio_toolchain",
        sha256 = sha,
        strip_prefix = "rules_roborio_toolchain-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_roborio_toolchain/archive/refs/tags/{}.tar.gz".format(version),
    )

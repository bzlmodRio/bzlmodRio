load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


def load_rules_roborio_toolchain(version):
    if version == None:
        print("Not using ctre")
        return

    if version == "X":
        sha = "c8a6fc0acac4a08aa884b59d13af9c3da010a4eed416ee10ccc05c73b9753deb"
        committish = "8668e36043c7489a9669a9281f7024272b36d583"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_roborio_toolchain",
        sha256 = sha,
        strip_prefix = "rules_roborio_toolchain-{}".format(committish),
        url = "https://github.com/bzlmodRio/rules_roborio_toolchain/archive/{}.zip".format(committish),
    )
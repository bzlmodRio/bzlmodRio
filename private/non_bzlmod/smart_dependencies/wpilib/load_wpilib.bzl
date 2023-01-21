load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


def load_wpilib(version):

    if version == None:
        print("Not using rules_bazelrio")
        return

    if version == "2023.2.1":
        sha = "d4d8bccb48408d367f3120ec1820fa5452d0eaf0dd053adb18c9e50ab44d2410"
        committish = "458c77738bee96002ba6edda0117072bc32c4dd1"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "allwpilib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-allwpilib-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/archive/{}.tar.gz".format(committish),
    )
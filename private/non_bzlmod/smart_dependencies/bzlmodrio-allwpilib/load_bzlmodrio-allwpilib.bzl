load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_allwpilib(version):
    if version == None:
        print("Not using bzlmodrio-allwpilib")
        return

    if version == "local":
        print("Using local bzlmodrio-allwpilib")
        native.local_repository(
            name = "bzlmodrio-allwpilib",
            path = "../../bzlmodRio-allwpilib",
        )
        return
    elif version == "2022.3.1":
        sha = "d54218d7c89f515967b2acfd311add024a1c16c4530188eb070806275a659692"
        committish = "ac7700992611de735fa8aa47c95aceef1024409d"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-allwpilib-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/archive/{}.tar.gz".format(committish),
    )

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
    elif version == "2023.1.1":
        sha = "6c0f78beb6b28685949ec52b5b91c37a7c516a974ce08186cb62734977473cdc"
    elif version == "2023.2.1":
        sha = "176225c5da53453f02c1ff232b847cef482adba265eb530371ef7acd71cc25f5"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-allwpilib-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/archive/refs/tags/{}.tar.gz".format(version),
    )

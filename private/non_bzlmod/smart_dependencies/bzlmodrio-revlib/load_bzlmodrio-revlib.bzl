load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_revlib(version):
    if version == None:
        print("Not using bzlmodrio-revlib")
        return

    if version == "local":
        print("Using local bzlmodrio-revlib")
        native.local_repository(
            name = "bzlmodrio-revlib",
            path = "../../bzlmodRio-revlib",
        )
        return
    elif version == "2023.1.1":
        sha = "884c5a96f466577bc42eaf25dda96ea29452784352c01c59710b44eb9521c8be"
    elif version == "2023.1.2":
        sha = "cf0776dcdac517ec7ae376fc32dcfb9bb89af6b2d64f0c2a59a854143ac5e8b9"
    elif version == "2023.1.3":
        sha = "YYY"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-revlib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-revlib-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-revlib/archive/refs/tags/{}.tar.gz".format(version),
    )

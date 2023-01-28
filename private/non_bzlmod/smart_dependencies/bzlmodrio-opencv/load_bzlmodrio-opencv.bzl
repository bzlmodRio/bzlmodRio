load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_opencv(version):
    if version == None:
        print("Not using bzlmodrio-opencv")
        return

    if version == "local":
        print("Using local bzlmodrio-opencv")
        native.local_repository(
            name = "bzlmodrio-opencv",
            path = "../../bzlmodRio-opencv",
        )
        return
    elif version == "4.6.0-4":
        sha = "641fb23aa8e22d8567f500fcc3c9d294412d8d55b759aee4fa67aaa6d3059b6a"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = sha,
        strip_prefix = "bzlmodRio-opencv-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/archive/refs/tags/{}.tar.gz".format(version),
    )

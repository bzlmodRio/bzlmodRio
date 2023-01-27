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
    elif version == "4.5.2-1":
        sha = "f506a482f5f09826d065af8492844904c514374ab1745c03e1b4e3a3bad3dffd"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = sha,
        strip_prefix = "bzlmodRio-opencv-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/archive/refs/tags/{}.tar.gz".format(version),
    )

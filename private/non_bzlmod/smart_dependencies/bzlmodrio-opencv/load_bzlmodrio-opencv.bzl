load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio-opencv(version):
    if version == None:
        print("Not using bzlmodrio-opencv")
        return

    if version == "local":
        print("Using local bzlmodrio-opencv")
        native.local_repository(
            name = "bzlmodrio-opencv",
            path = "../../bzlmodRio-bzlmodrio-opencv",
        )
        return
    elif version == "4.6.0-4":
        sha = "6f76e7a95a63d4859355d44934f6cd5663cc0f0bdc769c657c25e59e1ba5a22f"
        committish = "130376f5cb63d661990e3d22aa60a7369e34942f"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = sha,
        strip_prefix = "bzlmodRio-bzlmodrio-opencv-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-bzlmodrio-opencv/archive/{}.tar.gz".format(committish),
    )

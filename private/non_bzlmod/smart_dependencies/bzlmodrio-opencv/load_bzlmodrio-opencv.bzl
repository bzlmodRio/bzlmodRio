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
        sha = "6ae0267890361270e36f725523cbec9553bc6b4178bbfc8b7643e086b3aa88f7"
        committish = "c33a5574d0ee8360022487d8a2b7a71097531beb"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = sha,
        strip_prefix = "bzlmodRio-opencv-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/archive/{}.tar.gz".format(committish),
    )

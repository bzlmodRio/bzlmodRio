load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_opencv(version):
    if version == None:
        print("Not using bzlmodrio-opencv")
        return

    if version == "local":
        print("Using local bzlmodrio-opencv")
        native.local_repository(
            name = "bzlmodrio-opencv",
            path = "../../libraries/bzlmodRio-opencv",
        )
        return
    elif version == "4.6.0-4":
        sha = "7cf977af07ab17bcefc84daba4975b35f9d0696a46a7b2182ff79141fdce83a5"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-opencv",
        sha256 = sha,
        strip_prefix = "bzlmodRio-opencv-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/archive/refs/tags/{}.tar.gz".format(version),
    )

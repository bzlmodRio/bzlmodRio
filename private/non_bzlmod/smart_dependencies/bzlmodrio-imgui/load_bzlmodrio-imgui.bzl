load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_imgui(version):
    if version == None:
        print("Not using bzlmodrio-imgui")
        return

    if version == "local":
        print("Using local bzlmodrio-imgui")
        native.local_repository(
            name = "bzlmodrio-imgui",
            path = "../../bzlmodRio-imgui",
        )
        return
    elif version == "1.86-1":
        sha = "b4341e8deb93a6ce6363b92ef5e5870632e6ad7d8d310d7f8f8517f54590ae27"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-imgui",
        sha256 = sha,
        strip_prefix = "bzlmodRio-imgui-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-imgui/archive/refs/tags/{}.tar.gz".format(version),
    )

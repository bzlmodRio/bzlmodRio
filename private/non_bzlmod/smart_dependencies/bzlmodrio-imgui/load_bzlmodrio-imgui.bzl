load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_imgui(version):
    if version == None:
        print("Not using bzlmodrio-imgui")
        return

    if version == "local":
        print("Using local bzlmodrio-imgui")
        native.local_repository(
            name = "bzlmodrio-imgui",
            path = "../../libraries/bzlmodRio-imgui",
        )
        return
    elif version == "1.89.1-1":
        sha = "1844237b840c8764f04dbdce47e7ea3b2799efe8471e6e99f6b5bbca307338a1"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-imgui",
        sha256 = sha,
        strip_prefix = "bzlmodRio-imgui-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-imgui/archive/refs/tags/{}.tar.gz".format(version),
    )

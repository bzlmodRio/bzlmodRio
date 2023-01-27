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
    elif version == "X":
        sha = "None"
        committish = "None"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-imgui",
        sha256 = sha,
        strip_prefix = "bzlmodRio-imgui-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-imgui/archive/{}.tar.gz".format(committish),
    )

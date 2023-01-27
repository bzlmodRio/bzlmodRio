load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_phoenix(version):
    if version == None:
        print("Not using bzlmodrio-phoenix")
        return

    if version == "local":
        print("Using local bzlmodrio-phoenix")
        native.local_repository(
            name = "bzlmodrio-phoenix",
            path = "../../bzlmodRio-phoenix",
        )
        return
    elif version == "5.20.2":
        sha = "2f63f71efe292f3a8e1aca643f5084fabfb4477780ed76c8cadca918b7bcfd33"
    elif version == "5.21.1":
        sha = "d240aa77f37f8c8630de15709697104543ad3cb1e4e7e7eaf5a6d2681165ec0d"
    elif version == "5.21.2":
        sha = "d3dd7ee7d86cc5bdf164b0913612205f8c80ee3f482c5f616d19ae0cd731b245"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-phoenix",
        sha256 = sha,
        strip_prefix = "bzlmodRio-phoenix-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-phoenix/archive/refs/tags/{}.tar.gz".format(version),
    )

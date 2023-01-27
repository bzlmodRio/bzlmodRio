load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_navx(version):
    if version == None:
        print("Not using bzlmodrio-navx")
        return

    if version == "local":
        print("Using local bzlmodrio-navx")
        native.local_repository(
            name = "bzlmodrio-navx",
            path = "../../bzlmodRio-navx",
        )
        return
    elif version == "4.0.435":
        sha = "a9c6efcecc70a095ec5109ba785f2267464beda699d74bfb93722a5d729806e4"
    elif version == "4.0.442":
        sha = "6a0db6a1013cd3f7374c65d84aa6dc2e0468881a610bba04cdd62101970b8f43"
    elif version == "4.0.447":
        sha = "2422242637560c89b20f12200d91f379f027392327554fb576b8d73caab6180d"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-navx",
        sha256 = sha,
        strip_prefix = "bzlmodRio-navx-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-navx/archive/refs/tags/{}.tar.gz".format(version),
    )

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
        committish = "8f1761295507b8ce4bfa2ba262519eedf899a0d9"
    elif version == "4.0.442":
        sha = "6a0db6a1013cd3f7374c65d84aa6dc2e0468881a610bba04cdd62101970b8f43"
        committish = "b076c1cf092554d48d8dcbebb9f54954b84da833"
    elif version == "4.0.447":
        sha = "2422242637560c89b20f12200d91f379f027392327554fb576b8d73caab6180d"
        committish = "eb3a2cbefc298fac58024ae4274ab54e310eb1aa"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-navx",
        sha256 = sha,
        strip_prefix = "bzlmodRio-navx-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-navx/archive/{}.tar.gz".format(committish),
    )

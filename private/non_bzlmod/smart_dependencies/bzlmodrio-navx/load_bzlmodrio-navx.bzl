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
    elif version == "2023.0.1":
        sha = "90e3a57de7608432763f98acf7655608037a0c51186556020389694153b11a00"
        committish = "2efa988262c3bfd8401e532417668bd6ca765d2e"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-navx",
        sha256 = sha,
        strip_prefix = "bzlmodRio-navx-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-navx/archive/{}.tar.gz".format(committish),
    )

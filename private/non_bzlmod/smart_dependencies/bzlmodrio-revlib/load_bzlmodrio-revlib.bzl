load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_revlib(version):
    if version == None:
        print("Not using bzlmodrio-revlib")
        return

    if version == "local":
        print("Using local bzlmodrio-revlib")
        native.local_repository(
            name = "bzlmodrio-revlib",
            path = "../../bzlmodRio-revlib",
        )
        return
    elif version == "2022.0.0":
        sha = "9114af6757f1686137250df004e80356def46e1ee1df9f9f2112c0a766843340"
        committish = "c68978a9f9241cd3113369d31d02d039bf3f454f"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-revlib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-revlib-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-revlib/archive/{}.tar.gz".format(committish),
    )

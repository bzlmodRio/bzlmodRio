load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_ni(version):
    if version == None:
        print("Not using bzlmodrio-ni")
        return

    if version == "local":
        print("Using local bzlmodrio-ni")
        native.local_repository(
            name = "bzlmodrio-ni",
            path = "../../bzlmodRio-ni",
        )
        return
    elif version == "2023.3.0":
        sha = "725397ef1d71fabb0b6e54ce13b81dc2072b428a526650a5f8872b3b7e17509e"
        committish = "ed054590909fb98adca10645f37b7a665f1a78f2"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-ni",
        sha256 = sha,
        strip_prefix = "bzlmodRio-ni-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/archive/{}.tar.gz".format(committish),
    )

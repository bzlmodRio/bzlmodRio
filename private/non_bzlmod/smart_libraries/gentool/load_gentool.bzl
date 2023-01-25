load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_gentool(version):
    if version == None:
        print("Not using gentool")
        return

    if version == "local":
        print("Using local gentool")
        native.local_repository(
            name = "gentool",
            path = "../../bzlmodRio-gentool",
        )
        return
    elif version == "0.0.3":
        sha = "91dbeb541a6151eab3f4dfa37318b81e3f4fa964e45ebea48665cb2b3e471353"
        committish = "dummy_version"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "gentool",
        sha256 = sha,
        strip_prefix = "bzlmodRio-gentool-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-gentool/archive/{}.tar.gz".format(committish),
    )

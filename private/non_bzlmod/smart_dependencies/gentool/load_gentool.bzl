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
    elif version == "1.0.0":
        sha = "0625d004f78f3509fb5175ede4f40f9153b75546bbe85a121e321db902fe94e5"
        committish = "95ccdbc245c9a5ee72f980681dc537a38a463a67"
    elif version == "1.0.1":
        sha = "aef265af16cd74086cd560a932ba9e21734572635047308a98577663eebf48a0"
        committish = "8b1ace0c2a93a9e08f0a213e8f5e7d98646c1c61"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "gentool",
        sha256 = sha,
        strip_prefix = "bzlmodRio-gentool-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-gentool/archive/{}.tar.gz".format(committish),
    )

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
    elif version == "2023.1.1":
        sha = "5a7aac77a4c3e39e962b26b78c73f0d5c62186f503965690975739d2322630d0"
        committish = "992c6f67f2297a65facc5ff45ab020bae61f382f"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-revlib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-revlib-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-revlib/archive/{}.tar.gz".format(committish),
    )

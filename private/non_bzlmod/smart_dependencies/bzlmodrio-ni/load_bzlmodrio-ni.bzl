load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio-ni(version):
    if version == None:
        print("Not using bzlmodrio-ni")
        return

    if version == "local":
        print("Using local bzlmodrio-ni")
        native.local_repository(
            name = "bzlmodrio-ni",
            path = "../../bzlmodRio-bzlmodrio-ni",
        )
        return
    elif version == "2023.3.0":
        sha = "54ed8d2e0d2c5a76c16eb312b48cef60c2de451910def5e10b7c8e4a8e80f89a"
        committish = "cc24faa330eb82f05fe30c7df030d59cfa3cfd06"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-ni",
        sha256 = sha,
        strip_prefix = "bzlmodRio-bzlmodrio-ni-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-bzlmodrio-ni/archive/{}.tar.gz".format(committish),
    )

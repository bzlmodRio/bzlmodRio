load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_ni(version):
    if version == None:
        print("Not using ni")
        return

    if version == "local":
        print("Using local ni")
        native.local_repository(
            name = "ni",
            path = "../../bzlmodRio-ni"
        )
        return
    elif version == "uuuu":
        sha = "54ed8d2e0d2c5a76c16eb312b48cef60c2de451910def5e10b7c8e4a8e80f89a"
        committish = "cc24faa330eb82f05fe30c7df030d59cfa3cfd06"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-ni",
        sha256 = sha,
        strip_prefix = "bzlmodRio-ni-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/archive/{}.tar.gz".format(committish),
    )

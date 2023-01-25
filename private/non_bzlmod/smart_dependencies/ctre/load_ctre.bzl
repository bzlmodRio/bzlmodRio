load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_ctre(version):
    if version == None:
        print("Not using ctre")
        return

    if version == "local":
        print("Using local ctre")
        native.local_repository(
            name = "bzlmodrio-ctre",
            path = "../../bzlmodRio-ctre",
        )
        return
    elif version == "5.30.1":
        sha = "b9b02d45e52d7572fefb005209c38ceaa4fecf95bd53bd409db88a93f6bc96bd"
        committish = "4f9fa5b8affaf41fc6573c3e00df24f5a2340153"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "ctre",
        sha256 = sha,
        strip_prefix = "bzlmodRio-ctre-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-ctre/archive/{}.tar.gz".format(committish),
    )

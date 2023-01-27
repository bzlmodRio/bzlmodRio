load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_ctre(version):
    if version == None:
        print("Not using bzlmodrio-ctre")
        return

    if version == "local":
        print("Using local bzlmodrio-ctre")
        native.local_repository(
            name = "bzlmodrio-ctre",
            path = "../../bzlmodRio-ctre",
        )
        return
    elif version == "5.20.2":
        sha = "bb98c031a96625e79a475788ebb8f1c9f6f891180fd433ef898589572d262948"
        committish = "3818c226d550d2e31139597c95ab21893ae47e81"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-ctre",
        sha256 = sha,
        strip_prefix = "bzlmodRio-ctre-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-ctre/archive/{}.tar.gz".format(committish),
    )

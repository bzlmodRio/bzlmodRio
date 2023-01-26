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
    elif version == "5.30.2":
        sha = "c06dcdec9b9271c32ac19da498612e0096fffcbeafb04cd8e20b4a2354c829c2"
        committish = "143530d1aee95fabab86aaa798ad4ac1d45164be"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-ctre",
        sha256 = sha,
        strip_prefix = "bzlmodRio-ctre-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-ctre/archive/{}.tar.gz".format(committish),
    )

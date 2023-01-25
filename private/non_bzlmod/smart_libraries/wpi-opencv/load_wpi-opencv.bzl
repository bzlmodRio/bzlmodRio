load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_wpi-opencv(version):
    if version == None:
        print("Not using wpi-opencv")
        return

    if version == "local":
        print("Using local wpi-opencv")
        native.local_repository(
            name = "wpi-opencv",
            path = "../../bzlmodRio-wpi-opencv"
        )
        return
    elif version == "4.6.0-4":
        sha = "4b0b9d708cafb597fa1b7b1730a653c59e03c8f71d58d9474fcce329a112bd61"
        committish = "4fc2007fbdb70ec71c40a94ca2b9eaf0cadb5bcb"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "wpi-opencv",
        sha256 = sha,
        strip_prefix = "bzlmodRio-wpi-opencv-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-wpi-opencv/archive/{}.tar.gz".format(committish),
    )

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
    elif version == "2022.0.0":
        sha = "9114af6757f1686137250df004e80356def46e1ee1df9f9f2112c0a766843340"
        committish = "c68978a9f9241cd3113369d31d02d039bf3f454f"
    elif version == "2022.1.0":
        sha = "3234e38dc9d3ed5a554e573c9837e984d48cae3d008e299e82092ff2701273ec"
        committish = "950b7cacccd2c6e5708e9219cf22b60452981158"
    elif version == "2022.1.1":
        sha = "e3ddcc127b8886dd40493620e97a6d7afcc950ca3439100b8c2a2f1c5b60f47c"
        committish = "0f3b3b3509c0adcb5ec311d596ca3c93b3b33c05"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-revlib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-revlib-{}".format(committish),
        url = "https://github.com/bzlmodRio/bzlmodRio-revlib/archive/{}.tar.gz".format(committish),
    )

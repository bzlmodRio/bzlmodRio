load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_bzlmodrio_allwpilib(version):
    if version == None:
        print("Not using bzlmodrio-allwpilib")
        return

    if version == "local":
        print("Using local bzlmodrio-allwpilib")
        native.local_repository(
            name = "bzlmodrio-allwpilib",
            path = "../../bzlmodRio-allwpilib",
        )
        return
    elif version == "2023.1.1":
        sha = "6c0f78beb6b28685949ec52b5b91c37a7c516a974ce08186cb62734977473cdc"
    elif version == "2023.2.1":
        sha = "4421ec2ef4e4904af632e7f38c6e0fe1b7fe5fd6d10955759b26e76d76551d55"
    elif version == "2023.3.2":
        sha = "2faa5dedf3ded5191d08638a62840ad59e938c25fc0905c9f7072d1865020479"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-allwpilib",
        sha256 = sha,
        strip_prefix = "bzlmodRio-allwpilib-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/archive/refs/tags/{}.tar.gz".format(version),
    )

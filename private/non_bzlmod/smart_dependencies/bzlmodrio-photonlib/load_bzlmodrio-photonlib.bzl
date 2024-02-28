load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_photonlib(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-photonlib"):
        print("Repo bzlmodrio-photonlib has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-photonlib",
            sanitized_repo_name = "bzlmodrio_photonlib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-photonlib")
        native.local_repository(
            name = "bzlmodrio-photonlib",
            path = local_monorepo_base + "/libraries/bzlmodRio-photonlib",
        )
        return
    elif version == "v2023.4.2":
        sha = "8b0ba57902f9922fef21916737fae55904ea44bb3f87a4297792863aa5119a55"
    elif version == "v2024.1.1-beta-1":
        sha = "e38df6d4a8601583cf956f3a4aaeb6a0dd44c321a980ae183208fbe4889cea1a"
    elif version == "v2024.1.1-beta-3":
        sha = "ff45e5ffa8672899c5a38c9ec1be9ffe652f1dc78c347a2a50e1a6c321deb446"
    elif version == "v2024.1.1-beta-3.1":
        sha = "de1f4b8cdf4bd88b7974c594a5ffa555b26d963ae3eac0585b57795bf044e999"
    elif version == "v2024.1.1-beta-3.2":
        sha = "f3358e089d192fa1fa1e98a09c15b52fb8b52fd43c0f6771e866359b21211a14"
    elif version == "v2024.1.4":
        sha = "53458fcf7fa6df0e7343779e310909181b25096975d3614fc3ec73f53482310f"
    elif version == "v2024.2.0":
        sha = "11ad2c2440c5554dd2d320284b8d4fd820a1a474af69beaafc35de53ac593d2d"
    elif version == "v2024.2.1":
        sha = "8aee4dd60abf2d6f9544d09112e17d8f18e954fa32be2f8f232c5499c0b01a03"
    elif version == "v2024.2.2":
        sha = "57885dc10e4b8ffaaa0611af1c8c53a4eb0d125e2cd46c156c3bba7079c62c9e"
    elif version == "v2024.2.3":
        sha = "460b24d218a61f573acaf7adad506b05db99b7cbd6d5f6e94192a70637b4a4da"
    elif version == "v2024.2.4":
        sha = "5ed237181d16aa8582dc34136a700043d7e0dda1997635dce32f2060b7503298"
    elif version == "v2024.2.5":
        sha = "9c94ed050c8e073cb41bb8264bc59bc15e79c72028f82fa3d1410f1498aedd95"
    elif version == "v2024.2.6":
        sha = "06586f00e19d1d3e8108f59a37305f7874dd49f67f0dc3f34cc5024bc78680f5"
    elif version == "v2024.2.7":
        sha = "b2c3f78fa0d5cad21151bbff4db1c794794455c4d85660c42a7aba0ad1811e77"
    elif version == "v2024.2.8":
        sha = "7a5a0191846928a8f61e79e7fae1409e8329b66372f8bc953e5be88fa2a11382"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-photonlib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-photonlib/releases/download/{}/bzlmodRio-photonlib-{}.tar.gz".format(version, version),
    )

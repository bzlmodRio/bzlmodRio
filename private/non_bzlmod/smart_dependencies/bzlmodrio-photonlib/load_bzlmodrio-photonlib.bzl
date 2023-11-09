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
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-photonlib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-photonlib/releases/download/{}/bzlmodRio-photonlib-{}.tar.gz".format(version, version),
    )

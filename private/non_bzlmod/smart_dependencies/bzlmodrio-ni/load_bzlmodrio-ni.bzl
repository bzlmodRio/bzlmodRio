load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_ni(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-ni"):
        print("Repo bzlmodrio-ni has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-ni",
            sanitized_repo_name = "bzlmodrio_ni",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-ni")
        native.local_repository(
            name = "bzlmodrio-ni",
            path = local_monorepo_base + "/libraries/bzlmodRio-ni",
        )
        return
    elif version == "2023.3.0":
        sha = "cf1532c896bb95f4eb73c8cf5bac968f74f6986c12de141d8c4f5d8ff95cd520"
    elif version == "2024.1.0":
        sha = "1a0d7551182940e1b59f6a369c7f5fe217ad2fa2986ab7f0fdc564a83cfdacd9"
    elif version == "2024.1.1":
        sha = "cc15dcf0e83a46aa27aede4f4627bdf67170c413b15568787ac73ab371c0c10a"
    elif version == "2024.2.0":
        sha = "f4101925d260c385f6a5c0a79451692db35f433cab8b8cc4092dd3ab93424559"
    elif version == "2024.2.1":
        sha = "02a9b1d9722ad3cc7d55ee31a709938884d981f69634dfe93f92e3986bb7a43f"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-ni",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/{}/bzlmodRio-ni-{}.tar.gz".format(version, version),
    )

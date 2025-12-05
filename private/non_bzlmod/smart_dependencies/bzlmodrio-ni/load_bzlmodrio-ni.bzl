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
    elif version == "2024.2.1.bcr1":
        sha = "28abfa366389514669dabf9e71cc723749f650e98a689bf428ec1fc998ca5de9"
    elif version == "2025.0.0":
        sha = "197fceac88bf44fb8427d5e000b0083118d3346172dd2ad31eccf83a5e61b3ce"
    elif version == "2025.2.0":
        sha = "fff62c3cb3e83f9a0d0a01f1739477c9ca5e9a6fac05be1ad59dafcd385801f7"
    elif version == "2025.2.0.bcr1":
        sha = "5ee1e2d6c1a670eba178eaa5c933f31dccf550b7ab613d4b22c37ead45497c45"
    elif version == "2026.1.0":
        sha = "e8232c386bacfad08c45aaa7e625f587ec040cfb71f25a3b8f17b6abd909f38e"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-ni",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/{}/bzlmodRio-ni-{}.tar.gz".format(version, version),
    )

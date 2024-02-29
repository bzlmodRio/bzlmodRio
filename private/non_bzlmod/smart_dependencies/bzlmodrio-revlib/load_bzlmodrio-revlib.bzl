load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_revlib(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-revlib"):
        print("Repo bzlmodrio-revlib has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-revlib",
            sanitized_repo_name = "bzlmodrio_revlib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-revlib")
        native.local_repository(
            name = "bzlmodrio-revlib",
            path = local_monorepo_base + "/libraries/bzlmodRio-revlib",
        )
        return
    elif version == "2023.1.3":
        sha = "94f3a09162ebe120863e5b755b9597b8aae0224447eb1c1e109c227057c2e42c"
    elif version == "2024.0.0":
        sha = "f0204ebb707201a080f973f7bdd816cf78cad622792bfe4c5a75c6996eefb055"
    elif version == "2024.1.1":
        sha = "1a4c6b4c0877a661610c30fc2c18333eed42329eb42b1b12984bc1dc2c284523"
    elif version == "2024.2.0":
        sha = "8a67b5c1016a6f0ca3ab6c59818a02a696cd4a0e798c5d3d67277f792eb2d916"
    elif version == "2024.2.1":
        sha = "1fe81bec1c914938f94a5d5c893b0054b8e481f88a5ab98bd4fe2da8e85c79c7"
    elif version == "2024.2.2":
        sha = "f1a3a90ed648702378ff6cc629ac775ba20acb3c954c126cd9a46fae57087a29"
    elif version == "2024.2.3":
        sha = "3928f88e07da4d0182a83fa72af98921892444d727c5a23a65552a0b8523f661"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-revlib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-revlib/releases/download/{}/bzlmodRio-revlib-{}.tar.gz".format(version, version),
    )

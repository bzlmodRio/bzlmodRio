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
    elif version == "2024.2.4":
        sha = "ed5379f86cd7bed5db04f338a77caac4989d769061515edf4034a015a888d17c"
    elif version == "2025.0.0-beta-1":
        sha = "7d90831406ebc7b50998d1abfbf3c71e1e8ef317e9fb797d81e3522e1b0a044e"
    elif version == "2025.0.0-beta-2":
        sha = "42157e1745e675963a4653989e7954ad751a37a84ce4189dfdad64683357a33a"
    elif version == "2025.0.0-beta-3":
        sha = "41ccc7191c0c6eec051cc8bbf34408ac265b446823075c21f161a771efe78ae6"
    elif version == "2025.0.0-beta-4":
        sha = "d89d22f1a4086b09cfc77a4ea3ba2fb74cd7934441b784c899f2a4a0d76369f4"
    elif version == "2025.0.0":
        sha = "efde7c7b404c120728d7e513357996cc5dc1e734d3bfd8a2a46f31bdcc553179"
    elif version == "2025.0.1":
        sha = "45f52018a040d003cc89537b2c89d95fe6156b97b4a21fe36a1269881b36e31e"
    elif version == "2025.0.2":
        sha = "0b29b6f97f70ea1275f66d5f932f75e05ec79bb0c2a5ddfe181ddca7913a9a91"
    elif version == "2025.0.3":
        sha = "5a13aca8555e15ca973f878a129e49a9b17d870e0da542b8615ef25416fa2356"
    elif version == "2026.0.0-beta-1":
        sha = "e22a832908b7f214a3988169416a670dbabb8972c808d01af51904a394836cdb"
    elif version == "2026.0.0":
        sha = "7ff50eea6cd6563b28b9d99bc5e7eb020c9bc5e5a4984da369d24a76a3dd9be3"
    elif version == "2026.0.1":
        sha = "f5f03234b35d34f7d1f3053dd253f883f780347f386a19a2e8a5453c01c96c84"
    elif version == "2026.0.2":
        sha = "86858c687b777d51ed3363a8d79d9d40347728187ea42af2daa4be770e2bb880"
    elif version == "2026.0.3":
        sha = "fa276ef947ae720329a4f7daaf642cc0ae0b239d31b1e4d860f7a18b6126a872"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-revlib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-revlib/releases/download/{}/bzlmodRio-revlib-{}.tar.gz".format(version, version),
    )

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_allwpilib(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-allwpilib"):
        print("Repo bzlmodrio-allwpilib has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-allwpilib",
            sanitized_repo_name = "bzlmodrio_allwpilib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-allwpilib")
        native.local_repository(
            name = "bzlmodrio-allwpilib",
            path = local_monorepo_base + "/libraries/bzlmodRio-allwpilib",
        )
        return
    elif version == "2023.3.2":
        sha = "100843ca4a248c1031cf19edb8d5aa7507d71c2e18bdd4e88f0dfa31b6bff91b"
    elif version == "2023.4.1":
        sha = "0d32829f65b5b1d68c6b1ff536c2274755531fe15a363fb75ef3e65d09b811e3"
    elif version == "2023.4.2":
        sha = "d1d293a345d3eb369c2f6c7d46f13971c4e5207f3c4bf0f70760577c071ef2fd"
    elif version == "2023.4.3":
        sha = "502064668cfb3268d482e2c3f1d74ea61069a540d172a464898177a2dceed741"
    elif version == "2024.1.1-beta-1":
        sha = "23e77cfedef9b04874161c0f53e486061251c4182be1b623c1281036bcafb72a"
    elif version == "2024.1.1-beta-2":
        sha = "3952a874f188935e70d20136e08dd273def89d124ee26e5c420285b903ca8461"
    elif version == "2024.1.1-beta-3":
        sha = "593761b66363b8ddcc234fb527e567966ca7ee8cd56c53b4c73168b2f61c8529"
    elif version == "2024.1.1-beta-4":
        sha = "d47b574e3cbaf75b0719d1467f0b32135d1edee7adf0c3210a410665084834b6"
    elif version == "2024.1.1":
        sha = "c549e941f174d47c7b01c13e4fcdf91c9dac9c57d2af7ed06d92f5d3ea1fe819"
    elif version == "2024.2.1":
        sha = "4e5791542bd2b366d14526f3234d97f552d759af5a85b3c09e591e6c5fd57e0d"
    elif version == "2024.3.1":
        sha = "124d12e8c9ecb0f1eba8b0434d3b363e88966e6851e63313ec0b177a2acc2fa7"
    elif version == "2024.3.2":
        sha = "f0d477e7236df5d46980566943a64045f6ed69b498fd7a959c58425a6afcf6db"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-allwpilib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/{}/bzlmodRio-allwpilib-{}.tar.gz".format(version, version),
    )

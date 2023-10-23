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
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-allwpilib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-allwpilib/releases/download/{}/bzlmodRio-allwpilib-{}.tar.gz".format(version, version),
    )

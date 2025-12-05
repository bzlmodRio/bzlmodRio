load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_phoenix(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-phoenix"):
        print("Repo bzlmodrio-phoenix has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-phoenix",
            sanitized_repo_name = "bzlmodrio_phoenix",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-phoenix")
        native.local_repository(
            name = "bzlmodrio-phoenix",
            path = local_monorepo_base + "/libraries/bzlmodRio-phoenix",
        )
        return
    elif version == "5.30.4":
        sha = "305c7653b133813624d93d9ee68a854d669a1d9a2a0843c539062b4bcb96d63b"
    elif version == "5.31.0+23.2.1":
        sha = "a353be80f834db48c7ba86d7fc9bd6ed40766aac407803d0c24da50587105c9b"
    elif version == "5.31.0+23.2.2":
        sha = "21b3b954ea8b9ebd28f347e6de7110a3746609522bd1242429c7658970022d97"
    elif version == "5.32.0-beta-1":
        sha = "32bda43ad9c12690ffe14aa9651edb08e4931ea820ffbf4e8fe369d5215191d8"
    elif version == "5.32.0-beta-2":
        sha = "6058cee13a97f10363c5f589761a67fc99139672ab8a01639dc4b59fe026ef4a"
    elif version == "5.32.0-beta-3":
        sha = "71df38b2f68c8a45781bca09426ec36730d0f26e05c730c9b3883d20afd0c4c3"
    elif version == "5.32.0-beta-4":
        sha = "c313897949d19b7dc1f7b3af931c6efb095c52f094e177ab8110b4ddfe11f236"
    elif version == "5.32.0-beta-4.bcr1":
        sha = "5b62d7c62ebe455bee80352b6d5998052a387c89b6d9a9415aa733bc80e29e9b"
    elif version == "5.32.0-beta-5":
        sha = "bddb44de93e20eaddddf9992d77a47d5c7e484a415879c10e7fe1588f3042a4a"
    elif version == "5.33.0":
        sha = "a989d865e020a270ad8ac0226d9fd2136dbf325dcf48cba5cb6894ec66c65290"
    elif version == "5.33.1":
        sha = "fe0fd3042f5b6793ac89d76a537ae96d754afcb3b2f4cf8df61d647ccf7b9774"
    elif version == "5.34.0-beta-2":
        sha = "a1d4d2e258f00ee1845e2df4a7ff3c7483f5b109870a89df001047a19584c023"
    elif version == "5.34.0-beta-3":
        sha = "e18e76489e13e33fa58616c77a17edb84140b5e59d54abc5ebe2720eebf5366c"
    elif version == "5.34.0-beta-4":
        sha = "3ebc134f4b0383b2aac77e2d89ed8fdc266c97add9b2df15b491f5a29dcc7075"
    elif version == "5.35.0":
        sha = "1c3d152e0276a02aa33ce95fc97780595ac5eb12d146619ad0c1e34808d39cce"
    elif version == "5.35.1":
        sha = "d90d6473423d763f57b7f47776800508eb0889fa1064c419c859978eea571b2a"
    elif version == "5.36.0-beta-1":
        sha = "c32ab5459f83171293d07b60f7a8dca58ca8ac665ba94ff611570b781e681440"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-phoenix",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-phoenix/releases/download/{}/bzlmodRio-phoenix-{}.tar.gz".format(version, version),
    )

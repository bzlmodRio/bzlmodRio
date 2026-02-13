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
    elif version == "v2024.2.9":
        sha = "85a3e93f31d069494140a86f21c838f76cb7e5e9fa0b08de531f899c29f72f58"
    elif version == "v2024.2.10":
        sha = "f9fedc5cb127c7de67cb8a8659ca859d25e365a33eccb148a6eb5bbea8870071"
    elif version == "v2024.3.1":
        sha = "4467c2e4b5a94b136be82afcb64704ec2219d273052ba0bd0d36f0158e7d4355"
    elif version == "v2025.0.0-beta-1":
        sha = "ece813f5f63f309985f825945df6caa0c3d714d97e10d9e83d6a41077e67677c"
    elif version == "v2025.0.0-beta-2":
        sha = "857667eb598d621d4d73ee5971b9a2bc3a8f5ee99b23d4e08962651b64264085"
    elif version == "v2025.0.0-beta-4":
        sha = "39994f0885d7c5aa8718db457acc76bd495fcf0df21d9d03000a6b2fbeebd032"
    elif version == "v2025.0.0-beta-5":
        sha = "96eea402a161d3d02acc959a207cde3d9909cda08140a98f7e64a24f7b9db80f"
    elif version == "v2025.0.0-beta-6":
        sha = "cdb11d3be715357b72769292b04008b1b5445808828401d171a3bc43dd710943"
    elif version == "v2025.0.0-beta-8":
        sha = "fc2025b04faafa08902b60b4f2cc7b562232426c652f7395b837f47c86161ede"
    elif version == "v2025.1.1":
        sha = "a5c6ff465ac48fa0d1b9f5db95f3ace5fbde2941729846af1d0ca16d1bb8b66c"
    elif version == "v2025.2.1":
        sha = "42c5535ba424ea2a89d5c8566675b2b367319761ce9a5c15508deb032cb0efdf"
    elif version == "v2025.3.1":
        sha = "29641949921cfc178f6e8d7f6075ee16a947db7f77e04bba51f06fae977d4020"
    elif version == "v2025.3.2":
        sha = "93c26b806447497721069bea264779c9498de6c14c3dd537633540668ba3c7e8"
    elif version == "v2026.0.1-beta":
        sha = "110a7c300a543924786165d999eecd6b71064974f4c9f2afc3a6ae09ccce15d0"
    elif version == "v2026.1.1-rc-2":
        sha = "9ebe9bb2f525d8e19ad0e6a5639087fb611fa0a3f69d03083a5d5df8cc868a34"
    elif version == "v2026.1.1-rc-3":
        sha = "ab23a52edede5abb572da3235d325a4a3c12e7d7a9e4c4c884c353b8ddfea0f8"
    elif version == "v2026.1.1":
        sha = "a70e18f8389c0e8838619026cc4116ccf6d13ae44dda53597559b64916fc4917"
    elif version == "v2026.2.1":
        sha = "c95863141a4cf214fa2b9b077bdae4515794bc89a354272e1a43ec2dfe5f1fe6"
    elif version == "v2026.2.2":
        sha = "b8647bf8c7447e536f99fff137bff9ae7c426a2e6f36433b49ef26bb8f5f52dc"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-photonlib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-photonlib/releases/download/{}/bzlmodRio-photonlib-{}.tar.gz".format(version, version),
    )

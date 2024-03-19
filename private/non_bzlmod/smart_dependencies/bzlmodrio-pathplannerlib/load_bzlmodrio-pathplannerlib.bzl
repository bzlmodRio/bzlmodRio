load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_pathplannerlib(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-pathplannerlib"):
        print("Repo bzlmodrio-pathplannerlib has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-pathplannerlib",
            sanitized_repo_name = "bzlmodrio_pathplannerlib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-pathplannerlib")
        native.local_repository(
            name = "bzlmodrio-pathplannerlib",
            path = local_monorepo_base + "/libraries/bzlmodRio-pathplannerlib",
        )
        return
    elif version == "2023.4.4":
        sha = "3792f6e7e7e94c3956176b08b11157a6618fa0c94fc86bef2a48a71b8d741316"
    elif version == "2024.0.0-beta-3":
        sha = "46c0789a2dbfd1f5cf909a4906194234b8d1b90ee5a81d22f9ae3c732745b057"
    elif version == "2024.0.0-beta-4":
        sha = "04f1cf2a381f98af4cde2d4b44374aa4bb5dfbbc4938debb0d9fd9352d5c104e"
    elif version == "2024.0.0-beta-5":
        sha = "b00f7eb991a6e8999585decdf5e0145829b97dac067f4f64e7e8477325f08d9c"
    elif version == "2024.0.0-beta-5.1":
        sha = "42067d2166b7e846229568c80bb20c1ccf360a027ac44f86e39341d3e1f83d09"
    elif version == "2024.0.0-beta-6":
        sha = "a159034a72d668c2921b68e5ef492911f3024845acae263b093a97965d5cded3"
    elif version == "2024.0.0-beta-6.1":
        sha = "2a493f6ca5619c4c10e440da28dc7de48b6dc4ff1598fd021afc1f520e4ff6a3"
    elif version == "2024.0.0-beta-6.2":
        sha = "9e7e780b402b00732d4eceb2ea37d1b20df18598ee34b0c91b884a750bec3a71"
    elif version == "2024.1.1":
        sha = "45ea1e68ad7a77fced0cfda7a03c1e318ebb1e6bbe1ba83f28f69bc01fee1256"
    elif version == "2024.1.2":
        sha = "838109d166a316234a6f1f935e338d152f85d016ae60a8fa081de35859d148cc"
    elif version == "2024.1.3":
        sha = "c8ce8d84870dae412be562c31e78e69de5d59fb2814653f114809e6f24c2b6c9"
    elif version == "2024.1.4":
        sha = "0e24e6d92ba1d869de5bc09d2a32d1976a469f93311ce725b0b8f76eb3847672"
    elif version == "2024.1.5":
        sha = "590b78dfc38f81000568b3c1bc015dfc29b624319b23b73aef995530d73c01b5"
    elif version == "2024.1.6":
        sha = "a404448643042e9008f95297f9038dd1c0b3d51be87b1c6751cb21c7761647e3"
    elif version == "2024.2.1":
        sha = "f1f3d6bc7e4b515a81c3fe2cf2b71bc1c457f130ca045ab6db3e57b6a0e65a95"
    elif version == "2024.2.2":
        sha = "0aa07367929dffa00e94657b2fa4f608f11d12361b005e97b41714e5558d1aec"
    elif version == "2024.2.3":
        sha = "edf0509fdacd4c17047c5406733ae51ca8cdcaa4694b70984015d0c963305d3a"
    elif version == "2024.2.4":
        sha = "a4fd3716ff00b21876e90242fb503fc894ac22daa419c8ee1ea9f0e81f82de40"
    elif version == "2024.2.5":
        sha = "23093a1afaf17c7750aaf0981a85e37c7d94baf66a9b5db5f568bc8f225bb328"
    elif version == "2024.2.6":
        sha = "77f3cdc11a11efb99afc5dfd7ff1025c40df4428cf72a707fafa3d8359782296"
    elif version == "2024.2.7":
        sha = "85a06b5904e795a3872aaa5c580ec965bbc06c33c0c61658d8e9db5722c71f55"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-pathplannerlib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-pathplannerlib/releases/download/{}/bzlmodRio-pathplannerlib-{}.tar.gz".format(version, version),
    )

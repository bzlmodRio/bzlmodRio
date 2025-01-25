load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_choreolib(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-choreolib"):
        print("Repo bzlmodrio-choreolib has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-choreolib",
            sanitized_repo_name = "bzlmodrio_choreolib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-choreolib")
        native.local_repository(
            name = "bzlmodrio-choreolib",
            path = local_monorepo_base + "/libraries/bzlmodRio-choreolib",
        )
        return
    elif version == "2024.1.2":
        sha = "9265783838a98a3938cc07ae057a5fcbfdbb442729df3341561e1e863fcfc518"
    elif version == "2024.1.3":
        sha = "c3311d738ebd7d8cb7f5951973a26b2f092af3b51f463d743871b9550b8c2acf"
    elif version == "2024.2.2":
        sha = "88479c77917161d49c8db4346ae40c025c1551a6f9d004e5a52c6e7b6b883959"
    elif version == "2024.2.3":
        sha = "986a8b04d395301b278c34c3431700617c361482854ee71a224846b783a56cf6"
    elif version == "2025.0.0-beta-2":
        sha = "aa5faf37a2ddb2e0c7372eaddf8ce6e762868ec90422f90aa4bb99c7fcdabef8"
    elif version == "2025.0.0-beta-3":
        sha = "e489c8f48466ed8268a78d83899ba1f3976397f161c3e9cf534697cc7743ecfe"
    elif version == "2025.0.0-beta-5":
        sha = "53abeb7f3a5dfcf31d217f94f78a64092c2d2abb900fec18917bb1fe5bb54ae4"
    elif version == "2025.0.0-beta-6":
        sha = "bde6e81d5d03742bb0bb5fbc290f0c6e009a2450b7835c8ff8041a8a771f1c81"
    elif version == "2025.0.0-beta-8":
        sha = "6bcb5addc2ca364cb3eae75dd5de15548774d8a8b7c4ab13089292b2c3f1e6f2"
    elif version == "2025.0.0-beta-9":
        sha = "723f25de680b83dfa9cb962d6a78df7cc52bfcd97544aa5f242dc2ae41782130"
    elif version == "2025.0.0":
        sha = "fc8762fbb661cd948d43d031bfba5795b83689bd936c6fe93cf9d741a2bee0b7"
    elif version == "2025.0.1":
        sha = "b80b49038dbebb46a43bcec25718a703d3e91a9e3e19318416e83cce12d13b0a"
    elif version == "2025.0.2":
        sha = "87f40f8ea417440ef2bc7642102ee3829bcbd310296feb1445de5fae3253d684"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-choreolib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-choreolib/releases/download/{}/bzlmodRio-choreolib-{}.tar.gz".format(version, version),
    )

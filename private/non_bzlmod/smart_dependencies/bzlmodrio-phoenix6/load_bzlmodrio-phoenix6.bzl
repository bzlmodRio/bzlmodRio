load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_phoenix6(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-phoenix6"):
        print("Repo bzlmodrio-phoenix6 has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-phoenix6",
            sanitized_repo_name = "bzlmodrio_phoenix6",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-phoenix6")
        native.local_repository(
            name = "bzlmodrio-phoenix6",
            path = local_monorepo_base + "/libraries/bzlmodRio-phoenix6",
        )
        return
    elif version == "24.0.0-beta-1":
        sha = "4b67c794f7e89ed3fc4ecebbd7c4c0382f5b0c2d25c688d4b61df15175c71c95"
    elif version == "24.0.0-beta-2":
        sha = "521207d510f193bd6072cb29570a166c76c97de93715ceb90976c4ce0b4ad347"
    elif version == "24.0.0-beta-3":
        sha = "60a1c0637058ffd477091748283903a3073b534c4322dc66f8ff304753f222b1"
    elif version == "24.0.0-beta-4":
        sha = "0b4e5800b557b1318a8694dfd4217a9dbcf2da55728b417b68cb222b6d4741fb"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-phoenix6",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-phoenix6/releases/download/{}/bzlmodRio-phoenix6-{}.tar.gz".format(version, version),
    )

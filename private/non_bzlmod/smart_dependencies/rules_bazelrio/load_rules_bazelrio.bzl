load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_bazelrio(version, local_monorepo_base):
    if native.existing_rule("rules_bazelrio"):
        print("Repo rules_bazelrio has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "rules_bazelrio",
            sanitized_repo_name = "rules_bazelrio",
        )
        return

    if version == "local":
        print("Using local rules_bazelrio")
        native.local_repository(
            name = "rules_bazelrio",
            path = local_monorepo_base + "/rules/rules_bazelrio",
        )
        return
    elif version == "0.0.10":
        sha = "378c92e50e9f04a600b8963d4d3dab3bdb07c1ee360caacea3b4df0ede84b4c1"
    elif version == "0.0.11":
        sha = "c7a7fac8a976caa78233dad09c68decf892ad197ba6a1fc7a4a4dffdfef1b3d9"
    elif version == "0.0.12":
        sha = "0caf6c4da67b08abbb8cc619729928fa0516a0d5ce01adf4141d1dd378466bc6"
    elif version == "0.0.13":
        sha = "b439b1fa3ead015d8fb20f804e65fc877d28d39d337b963db011119c6c7a23a5"
    elif version == "0.0.14":
        sha = "0c5a98476ac5b606689863b7b9ef3f7d685c47ce2681e448ca977e8e95de31c1"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "rules_bazelrio",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_bazelrio/releases/download/{}/rules_bazelrio-{}.tar.gz".format(version, version),
    )

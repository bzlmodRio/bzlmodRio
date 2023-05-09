load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_phoenix(version, local_monorepo_base):
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
        sha = "f2ff8dbf753f30c8759aa393e31585d0812c7a3f496d6c53f256f3c913016177"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-phoenix",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-phoenix/releases/download/{}/bzlmodRio-phoenix-{}.tar.gz".format(version, version),
    )

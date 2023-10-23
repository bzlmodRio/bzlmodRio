load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_navx(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-navx"):
        print("Repo bzlmodrio-navx has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-navx",
            sanitized_repo_name = "bzlmodrio_navx",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-navx")
        native.local_repository(
            name = "bzlmodrio-navx",
            path = local_monorepo_base + "/libraries/bzlmodRio-navx",
        )
        return
    elif version == "2023.0.3":
        sha = "67220d837b313781087f8e401a8c068a250bb2707383acce4bc409879e2c1cd4"
    elif version == "2024.0.1-beta-2":
        sha = "03d4695b2d55566bc8c0be68b916d997c13db606a8caa591ae4ea28a999cfc00"
    elif version == "2024.0.1-beta-3":
        sha = "65ab35f2225affea259d8fdc851c98d8aee995941a2f19b68814c6f75e7da298"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-navx",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-navx/releases/download/{}/bzlmodRio-navx-{}.tar.gz".format(version, version),
    )

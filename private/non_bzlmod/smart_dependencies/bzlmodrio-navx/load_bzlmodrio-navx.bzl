load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_navx(version):
    if version == None:
        print("Not using bzlmodrio-navx")
        create_null_repository(
            name = "bzlmodrio-navx",
            sanitized_repo_name = "bzlmodrio_navx",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-navx")
        native.local_repository(
            name = "bzlmodrio-navx",
            path = "../../libraries/bzlmodRio-navx",
        )
        return
    elif version == "2023.0.3":
        sha = "bdfebf177f64267ed68be277ca1b074fc8ca5f24907371667cd5dbb568e1aadc"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-navx",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-navx/releases/download/{}/bzlmodRio-navx-{}.tar.gz".format(version, version),
    )

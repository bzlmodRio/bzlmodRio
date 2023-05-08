load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_ni(version, local_monorepo_base):
    if version == None:
        print("Not using bzlmodrio-ni")
        create_null_repository(
            name = "bzlmodrio-ni",
            sanitized_repo_name = "bzlmodrio_ni",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-ni")
        native.local_repository(
            name = "bzlmodrio-ni",
            path = local_monorepo_base + "/libraries/bzlmodRio-ni",
        )
        return
    elif version == "2023.3.0":
        sha = "46de316b2209cb3a854928810413850ff77306ae858cbffe16428df7cc816686"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-ni",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-ni/releases/download/{}/bzlmodRio-ni-{}.tar.gz".format(version, version),
    )

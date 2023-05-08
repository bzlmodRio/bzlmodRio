load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_imgui(version, local_monorepo_base):
    if version == None:
        print("Not using bzlmodrio-imgui")
        create_null_repository(
            name = "bzlmodrio-imgui",
            sanitized_repo_name = "bzlmodrio_imgui",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-imgui")
        native.local_repository(
            name = "bzlmodrio-imgui",
            path = local_monorepo_base + "/libraries/bzlmodRio-imgui",
        )
        return
    elif version == "1.89.1-1":
        sha = "a99218be374079e69455d69fbd113e9b3969fdb21ae5e47783ec1310b442e9f9"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-imgui",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-imgui/releases/download/{}/bzlmodRio-imgui-{}.tar.gz".format(version, version),
    )

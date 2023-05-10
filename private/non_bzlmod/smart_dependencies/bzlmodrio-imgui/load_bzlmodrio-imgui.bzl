load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_imgui(version, local_monorepo_base):
    if version == None:
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
        sha = "c194346f6c15f252fc5e7a60069e114fc54108a5b0661a80b4b8e8e44ca91df9"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-imgui",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-imgui/releases/download/{}/bzlmodRio-imgui-{}.tar.gz".format(version, version),
    )

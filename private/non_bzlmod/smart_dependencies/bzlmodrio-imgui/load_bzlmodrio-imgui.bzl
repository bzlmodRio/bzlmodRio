load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_imgui(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-imgui"):
        print("Repo bzlmodrio-imgui has already been defined")
        return

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
        sha = "338a9911cd8ae339281e6a0fceb741445f76bf0163066ea6ceea3219abb06512"
    elif version == "1.89.1-2":
        sha = "4c7848f642210c31a9c8a82932b93507e8970cb0a0d5e0cf325fd8b52d46f095"
    elif version == "1.89.9-1":
        sha = "9d3841b267e3c33cf52d2f8734ec59e703305097c2c0bbb383c8b903fc960ea3"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-imgui",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-imgui/releases/download/{}/bzlmodRio-imgui-{}.tar.gz".format(version, version),
    )

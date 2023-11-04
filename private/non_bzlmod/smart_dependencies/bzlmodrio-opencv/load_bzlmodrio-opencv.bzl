load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_opencv(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-opencv"):
        print("Repo bzlmodrio-opencv has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-opencv",
            sanitized_repo_name = "bzlmodrio_opencv",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-opencv")
        native.local_repository(
            name = "bzlmodrio-opencv",
            path = local_monorepo_base + "/libraries/bzlmodRio-opencv",
        )
        return
    elif version == "4.6.0-4":
        sha = "b237805c8429382723aaa50885e3a5b088ef44dba29b5eee22cdadf94b50dc9f"
    elif version == "4.6.0-5":
        sha = "63b94c8919c1ce82999095fdc7e4cbc716bb4671775f5e55d7991c4cf98be1b6"
    elif version == "4.8.0-1":
        sha = "352020dfdfbfd8e748ca158edd0dd11c0b00dc3b348dac35b4a058a7c73f448e"
    elif version == "2024.4.8.0-1":
        sha = "761b152ef922e6bb386b79b06830fdf085b905d132d967c31d3ab4f33b8a8366"
    elif version == "2024.4.8.0-2":
        sha = "52c1faf679c9460a31eff158f2a11e8833323ef95af45e26d3f316db95c58e8f"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-opencv",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/{}/bzlmodRio-opencv-{}.tar.gz".format(version, version),
    )

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
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-opencv",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/releases/download/{}/bzlmodRio-opencv-{}.tar.gz".format(version, version),
    )

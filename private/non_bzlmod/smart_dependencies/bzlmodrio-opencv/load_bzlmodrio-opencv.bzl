load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_opencv(version, local_monorepo_base):
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
        sha = "a92e0d7851590601e0c8eb839d0751dfae4d8a11bde23a6d877660bd565b07a5"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-opencv",
        strip_prefix = "bzlmodRio-opencv-refactor_dev",
        sha256 = "075f8fc73792fc910abd8acbcb206b100dbd65c834faa877c52388b01e7477f9",
        url = "https://github.com/bzlmodRio/bzlmodRio-opencv/archive/refs/heads/refactor_dev.zip",
    )

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_apriltaglib(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-apriltaglib"):
        print("Repo bzlmodrio-apriltaglib has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-apriltaglib",
            sanitized_repo_name = "bzlmodrio_apriltaglib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-apriltaglib")
        native.local_repository(
            name = "bzlmodrio-apriltaglib",
            path = local_monorepo_base + "/libraries/bzlmodRio-apriltaglib",
        )
        return
    elif version == "3.2.0-3":
        sha = "314812473f33c00e23b8af7865ddf0e43b38a37cafb97c504c9cb533ddac776f"
    elif version == "3.2.0-4":
        sha = "4e0178b53e462f3c88d051867f8a9f1441c96b60dec60680d30565d7c3d5b61a"
    elif version == "3.2.0-5":
        sha = "16d6b5d16b76faf0da6a59ae07179bc4a7e4d9c919216dd6beebca343f6feac2"
    elif version == "3.2.0-8":
        sha = "58ef7eba4bd88b3eb68b41af0c8ccfb60ae431f0cffb7bf1827d736d2391516a"
    elif version == "3.3.0-1":
        sha = "b804e10cd1440645554de7838ec4c984fd27b22427e62ef41ef962b439bafa5d"
    elif version == "2024.3.3.0-1":
        sha = "99debf50e054d93babf2392b19e66648b2368ddf73687683dc19893adf5e16b2"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-apriltaglib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-apriltaglib/releases/download/{}/bzlmodRio-apriltaglib-{}.tar.gz".format(version, version),
    )

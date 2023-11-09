load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_pathplannerlib(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-pathplannerlib"):
        print("Repo bzlmodrio-pathplannerlib has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-pathplannerlib",
            sanitized_repo_name = "bzlmodrio_pathplannerlib",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-pathplannerlib")
        native.local_repository(
            name = "bzlmodrio-pathplannerlib",
            path = local_monorepo_base + "/libraries/bzlmodRio-pathplannerlib",
        )
        return
    elif version == "2023.4.4":
        sha = "3792f6e7e7e94c3956176b08b11157a6618fa0c94fc86bef2a48a71b8d741316"
    elif version == "2024.0.0-beta-3":
        sha = "46c0789a2dbfd1f5cf909a4906194234b8d1b90ee5a81d22f9ae3c732745b057"
    elif version == "2024.0.0-beta-4":
        sha = "04f1cf2a381f98af4cde2d4b44374aa4bb5dfbbc4938debb0d9fd9352d5c104e"
    elif version == "2024.0.0-beta-5":
        sha = "b00f7eb991a6e8999585decdf5e0145829b97dac067f4f64e7e8477325f08d9c"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-pathplannerlib",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-pathplannerlib/releases/download/{}/bzlmodRio-pathplannerlib-{}.tar.gz".format(version, version),
    )

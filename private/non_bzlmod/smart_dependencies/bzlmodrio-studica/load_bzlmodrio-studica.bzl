load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_studica(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-studica"):
        print("Repo bzlmodrio-studica has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-studica",
            sanitized_repo_name = "bzlmodrio_studica",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-studica")
        native.local_repository(
            name = "bzlmodrio-studica",
            path = local_monorepo_base + "/libraries/bzlmodRio-studica",
        )
        return
    elif version == "2025.1.1-beta-4":
        sha = "92861b89ccb4fc33ab695f89d02ceb4f725f85ba56a143b5974de56125d9ee7c"
    elif version == "2025.0.0":
        sha = "1e651ed7bc41d457204e533d6b53e177d19809f9605cf9e17ce27e663ef8ddd4"
    elif version == "2026.0.0-beta":
        sha = "244e3ad129c69524a507269a8772560aee591b6f8cea44820a99b39074618f25"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-studica",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-studica/releases/download/{}/bzlmodRio-studica-{}.tar.gz".format(version, version),
    )

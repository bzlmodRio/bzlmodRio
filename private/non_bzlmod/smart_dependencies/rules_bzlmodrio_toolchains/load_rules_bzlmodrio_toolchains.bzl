load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_bzlmodrio_toolchains(version):
    if version == None:
        print("Not using rules_bzlmodrio_toolchains")
        return

    if version == "local":
        print("Using local rules_bzlmodrio_toolchains")
        native.local_repository(
            name = "rules_bzlmodrio_toolchains",
            path = "../../rules/rules_bzlmodrio_toolchains",
        )
        return
    elif version == "2023-7":
        sha = "b24d5813300ebe9a252c5e1c69a421c0d112f50da0d7b22c8de5efd7bca6babf"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_bzlmodrio_toolchains",
        sha256 = sha,
        strip_prefix = "rules_bzlmodRio_toolchains-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_bzlmodRio_toolchains/archive/refs/tags/{}.tar.gz".format(version),
    )

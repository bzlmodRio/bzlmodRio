load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_pmd(version):
    if version == None:
        print("Not using rules_pmd")
        return

    if version == "local":
        print("Using local rules_pmd")
        native.local_repository(
            name = "rules_pmd",
            path = "../../rules_pmd",
        )
        return
    elif version == "6.39.0":
        sha = "6007cf19e55cb06ef4ff4933e857a833f079a57ef89b7603b0c168f46ca400d4"
    elif version == "6.43.0":
        sha = "f15d3ea527d7a5ae10eed808789f0a61cc1b39c0bef64decaeb03c2f0f22cd51"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_pmd",
        sha256 = sha,
        strip_prefix = "rules_pmd-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_pmd/archive/refs/tags/{}.tar.gz".format(version),
    )

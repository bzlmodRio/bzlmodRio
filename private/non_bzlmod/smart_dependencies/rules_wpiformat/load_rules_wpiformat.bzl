load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_wpiformat(version):
    if version == None:
        print("Not using rules_wpiformat")
        return

    if version == "local":
        print("Using local rules_wpiformat")
        native.local_repository(
            name = "rules_wpiformat",
            path = "../../rules/rules_wpiformat",
        )
        return
    elif version == "2022.30":
        sha = "871885dc981cbb892894589ef3965b38c7a438880da434693669cba4ad2d5369"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_wpiformat",
        sha256 = sha,
        strip_prefix = "rules_wpiformat-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_wpiformat/archive/refs/tags/{}.tar.gz".format(version),
    )

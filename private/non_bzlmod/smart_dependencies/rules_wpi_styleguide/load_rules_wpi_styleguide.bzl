load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_rules_wpi_styleguide(version):
    if version == None:
        print("Not using rules_wpi_styleguide")
        return

    if version == "local":
        print("Using local rules_wpi_styleguide")
        native.local_repository(
            name = "rules_wpi_styleguide",
            path = "../../rules_wpi_styleguide",
        )
        return
    elif version == "0.0.0":
        sha = "5bdf5bf15b8854a3e36be410d114f7bea561acd6b998d89de8f4d70539f7c577"
    elif version == "1":
        sha = "8bef5845cb4fbc4637910522630767c2cf83d8a2370ecdf990dc4daebdb8bc50"
    elif version == "1.0.0":
        sha = "767ae068dcbbfce024afcc42d0a39c3e8241d2325146eec141509c8ec72398c2"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_wpi_styleguide",
        sha256 = sha,
        strip_prefix = "rules_wpi_styleguide-{}".format(version),
        url = "https://github.com/bzlmodRio/rules_wpi_styleguide/archive/refs/tags/{}.tar.gz".format(version),
    )

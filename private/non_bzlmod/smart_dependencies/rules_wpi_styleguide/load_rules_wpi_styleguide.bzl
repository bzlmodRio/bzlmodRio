load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_wpi_styleguide(version, local_monorepo_base):
    if native.existing_rule("rules_wpi_styleguide"):
        print("Repo rules_wpi_styleguide has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "rules_wpi_styleguide",
            sanitized_repo_name = "rules_wpi_styleguide",
        )
        return

    if version == "local":
        print("Using local rules_wpi_styleguide")
        native.local_repository(
            name = "rules_wpi_styleguide",
            path = local_monorepo_base + "/rules/rules_wpi_styleguide",
        )
        return
    elif version == "1.0.0":
        sha = "c5c032e8e8b04cdd74d2a637c39e787156cd289d128cd9747b5c8c6d87d4f252"
    elif version == "2024.06.22":
        sha = "0359cc1772a715d958a2f5648f8254ad8c34af1e84d1a852f3bfa79040334b76"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "rules_wpi_styleguide",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_wpi_styleguide/releases/download/{}/rules_wpi_styleguide-{}.tar.gz".format(version, version),
    )

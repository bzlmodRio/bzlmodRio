load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_rules_wpi_styleguide(version, local_monorepo_base):
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
        sha = "d0f717a73d18b40f5e7f921e434692cffa1dea5b3138c2cc64c5355530f4eb47"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "rules_wpi_styleguide",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/rules_wpi_styleguide/releases/download/{}/rules_wpi_styleguide-{}.tar.gz".format(version, version),
    )

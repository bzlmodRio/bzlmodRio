workspace(name = "bazelrio")

load("@bazelrio//private/non_bzlmod:download_dependencies.bzl", "download_dependencies")

download_dependencies()

load("@bazelrio//private/non_bzlmod:setup_dependencies.bzl", "get_java_dependenicies", "setup_dependencies")

setup_dependencies()

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_artifacts, maven_repositories = get_java_dependenicies()

maven_install(
    name = "maven",
    artifacts = maven_artifacts,
    repositories = maven_repositories,
    # maven_install_json = "//build_scripts/bazel/deps:maven_install.json",
)

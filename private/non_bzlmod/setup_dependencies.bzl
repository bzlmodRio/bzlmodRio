load("@bzlmodrio-allwpilib//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_allwpilib_cpp_dependencies")
load("@bzlmodrio-allwpilib//:maven_java_deps.bzl", "get_bzlmodrio_allwpilib_java_dependencies", "setup_legacy_bzlmodrio_allwpilib_java_dependencies")
load("@bzlmodrio-apriltaglib//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_apriltaglib_cpp_dependencies")
load("@bzlmodrio-imgui//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_imgui_cpp_dependencies")
load("@bzlmodrio-libssh//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_libssh_cpp_dependencies")
load("@bzlmodrio-navx//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_navx_cpp_dependencies")
load("@bzlmodrio-navx//:maven_java_deps.bzl", "setup_legacy_bzlmodrio_navx_java_dependencies")
load("@bzlmodrio-ni//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_ni_cpp_dependencies")
load("@bzlmodrio-opencv//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_opencv_cpp_dependencies")
load("@bzlmodrio-opencv//:maven_java_deps.bzl", "setup_legacy_bzlmodrio_opencv_java_dependencies")
load("@bzlmodrio-phoenix//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_phoenix_cpp_dependencies")
load("@bzlmodrio-phoenix//:maven_java_deps.bzl", "setup_legacy_bzlmodrio_phoenix_java_dependencies")
load("@bzlmodrio-revlib//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_revlib_cpp_dependencies")
load("@bzlmodrio-revlib//:maven_java_deps.bzl", "setup_legacy_bzlmodrio_revlib_java_dependencies")
load("@rules_bazelrio//:nonbzlmod_setup.bzl", "setup_rules_bazelrio")
load("@rules_bzlmodrio_toolchains//:maven_deps.bzl", "setup_legacy_setup_toolchains_dependencies")
load("@rules_bzlmodrio_toolchains//toolchains:load_toolchains.bzl", "load_toolchains")

def _setup_toolchains():
    setup_legacy_setup_toolchains_dependencies()

    load_toolchains()

    native.register_toolchains(
        "@local_roborio//:macos",
        "@local_roborio//:linux",
        "@local_roborio//:windows",
        "@local_raspi_32//:macos",
        "@local_raspi_32//:linux",
        "@local_raspi_32//:windows",
        "@local_bullseye_32//:macos",
        "@local_bullseye_32//:linux",
        "@local_bullseye_32//:windows",
        "@local_bullseye_64//:macos",
        "@local_bullseye_64//:linux",
        "@local_bullseye_64//:windows",
    )

def _setup_cpp_dependencies():
    setup_legacy_bzlmodrio_opencv_cpp_dependencies()
    setup_legacy_bzlmodrio_ni_cpp_dependencies()
    setup_legacy_bzlmodrio_allwpilib_cpp_dependencies()
    setup_legacy_bzlmodrio_phoenix_cpp_dependencies()
    setup_legacy_bzlmodrio_revlib_cpp_dependencies()
    setup_legacy_bzlmodrio_navx_cpp_dependencies()
    setup_legacy_bzlmodrio_imgui_cpp_dependencies()
    setup_legacy_bzlmodrio_libssh_cpp_dependencies()
    setup_legacy_bzlmodrio_apriltaglib_cpp_dependencies()

def _setup_java_dependencies():
    setup_legacy_bzlmodrio_opencv_java_dependencies()
    setup_legacy_bzlmodrio_allwpilib_java_dependencies()
    setup_legacy_bzlmodrio_phoenix_java_dependencies()
    setup_legacy_bzlmodrio_revlib_java_dependencies()
    setup_legacy_bzlmodrio_navx_java_dependencies()

def _combine_maven_info(maven_artifacts, maven_repositories, setup_functor):
    dep_maven_artifacts, dep_maven_repositories = setup_functor()

    maven_artifacts += dep_maven_artifacts
    maven_repositories += dep_maven_repositories

    return maven_artifacts, maven_repositories

def get_java_dependencies():
    maven_artifacts, maven_repositories = [], []
    maven_artifacts, maven_repositories = _combine_maven_info(maven_artifacts, maven_repositories, get_bzlmodrio_allwpilib_java_dependencies)

    return maven_artifacts, maven_repositories

def setup_dependencies():
    _setup_toolchains()
    _setup_cpp_dependencies()
    _setup_java_dependencies()

    setup_rules_bazelrio()

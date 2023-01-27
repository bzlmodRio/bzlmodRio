load("//private/non_bzlmod/smart_dependencies/bzlmodrio-ctre:load_bzlmodrio-ctre.bzl", "load_bzlmodrio_ctre")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-navx:load_bzlmodrio-navx.bzl", "load_bzlmodrio_navx")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-revlib:load_bzlmodrio-revlib.bzl", "load_bzlmodrio_revlib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-allwpilib:load_bzlmodrio-allwpilib.bzl", "load_bzlmodrio_allwpilib")
load("//private/non_bzlmod/smart_dependencies/rules_bazelrio:load_rules_bazelrio.bzl", "load_rules_bazelrio")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-opencv:load_bzlmodrio-opencv.bzl", "load_bzlmodrio_opencv")
load("//private/non_bzlmod/smart_dependencies/rules_roborio_toolchain:load_rules_roborio_toolchain.bzl", "load_rules_roborio_toolchain")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-ni:load_bzlmodrio-ni.bzl", "load_bzlmodrio_ni")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies(
        rules_bazelrio_version = "0.0.8",
        rules_roborio_toolchain_version = "2023-7.7",
        ni_version = "2023.3.0",
        opencv_version = "4.6.0-4",
        wpilib_version = "2023.2.1",
        navx_version = "2023.0.1",
        phoenix_version = "5.30.2",
        revlib_version = "2023.1.1"):
    RULES_JVM_EXTERNAL_TAG = "4.2"
    RULES_JVM_EXTERNAL_SHA = "cd1a77b7b02e8e008439ca76fd34f5b07aecb8c752961f9640dea15e9e5ba1ca"
    http_archive(
        name = "rules_jvm_external",
        sha256 = RULES_JVM_EXTERNAL_SHA,
        strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
    )

    # Python, for gentool
    http_archive(
        name = "rules_python",
        sha256 = "497ca47374f48c8b067d786b512ac10a276211810f4a580178ee9b9ad139323a",
        strip_prefix = "rules_python-0.16.1",
        url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.16.1.tar.gz",
    )

    load_rules_bazelrio(rules_bazelrio_version)

    load_bzlmodrio_ctre(phoenix_version)
    load_bzlmodrio_navx(navx_version)
    load_bzlmodrio_revlib(revlib_version)
    load_bzlmodrio_allwpilib(wpilib_version)
    load_rules_roborio_toolchain(rules_roborio_toolchain_version)

    load_bzlmodrio_opencv(opencv_version)
    load_bzlmodrio_ni(ni_version)

    native.local_repository(
        name = "bzlmodrio-gentool",
        path = "../../gentool",
    )

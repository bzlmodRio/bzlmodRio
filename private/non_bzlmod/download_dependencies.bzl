load("//private/non_bzlmod/smart_dependencies/ctre:load_ctre.bzl", "load_ctre")
load("//private/non_bzlmod/smart_dependencies/navx:load_navx.bzl", "load_navx")
load("//private/non_bzlmod/smart_dependencies/rev:load_rev.bzl", "load_rev")
load("//private/non_bzlmod/smart_dependencies/allwpilib:load_allwpilib.bzl", "load_allwpilib")
load("//private/non_bzlmod/smart_dependencies/rules_bazelrio:load_rules_bazelrio.bzl", "load_rules_bazelrio")
load("//private/non_bzlmod/smart_dependencies/opencv:load_opencv.bzl", "load_opencv")
load("//private/non_bzlmod/smart_dependencies/rules_roborio_toolchain:load_rules_roborio_toolchain.bzl", "load_rules_roborio_toolchain")
load("//private/non_bzlmod/smart_dependencies/ni:load_ni.bzl", "load_ni")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies(
        rules_bazelrio_version = "local",
        navx_version = "2023.0.0",
        phoenix_version = "5.30.1",
        revlib_version = "2023.1.2",
        wpilib_version = "2023.2.1"):
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

    load_ctre(phoenix_version)
    load_navx(navx_version)
    load_rev(revlib_version)
    load_allwpilib(wpilib_version)
    load_rules_roborio_toolchain("X")

    load_opencv("XXXX")
    load_ni("uuuu")

    native.local_repository(
        name = "bzlmodrio-gentool",
        path = "../../gentool",
    )

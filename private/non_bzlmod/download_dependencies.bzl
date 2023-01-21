
load("//private/non_bzlmod/smart_dependencies/ctre:load_ctre.bzl", "load_ctre")
load("//private/non_bzlmod/smart_dependencies/navx:load_navx.bzl", "load_navx")
load("//private/non_bzlmod/smart_dependencies/rev:load_rev.bzl", "load_rev")
load("//private/non_bzlmod/smart_dependencies/wpilib:load_wpilib.bzl", "load_wpilib")
load("//private/non_bzlmod/smart_dependencies/rules_bazelrio:load_rules_bazelrio.bzl", "load_rules_bazelrio")
load("//private/non_bzlmod/smart_dependencies/opencv:load_opencv.bzl", "load_opencv")
load("//private/non_bzlmod/smart_dependencies/rules_roborio_toolchain:load_rules_roborio_toolchain.bzl", "load_rules_roborio_toolchain")
load("//private/non_bzlmod/smart_dependencies/ni:load_ni.bzl", "load_ni")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


def download_dependencies(
        rules_bazelrio_version = "0",

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

    load_rules_bazelrio(rules_bazelrio_version)

    load_ctre(phoenix_version)
    load_navx(navx_version)
    load_rev(revlib_version)
    load_wpilib(wpilib_version)
    load_rules_roborio_toolchain("X")

    load_opencv("XXXX")
    load_ni("uuuu")
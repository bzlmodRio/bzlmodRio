load("//private/non_bzlmod/smart_dependencies/bzlmodrio-allwpilib:load_bzlmodrio-allwpilib.bzl", "load_bzlmodrio_allwpilib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-apriltaglib:load_bzlmodrio-apriltaglib.bzl", "load_bzlmodrio_apriltaglib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-imgui:load_bzlmodrio-imgui.bzl", "load_bzlmodrio_imgui")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-libssh:load_bzlmodrio-libssh.bzl", "load_bzlmodrio_libssh")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-navx:load_bzlmodrio-navx.bzl", "load_bzlmodrio_navx")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-ni:load_bzlmodrio-ni.bzl", "load_bzlmodrio_ni")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-opencv:load_bzlmodrio-opencv.bzl", "load_bzlmodrio_opencv")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-phoenix:load_bzlmodrio-phoenix.bzl", "load_bzlmodrio_phoenix")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-revlib:load_bzlmodrio-revlib.bzl", "load_bzlmodrio_revlib")
load("//private/non_bzlmod/smart_dependencies/rules_bazelrio:load_rules_bazelrio.bzl", "load_rules_bazelrio")
load("//private/non_bzlmod/smart_dependencies/rules_roborio_toolchain:load_rules_roborio_toolchain.bzl", "load_rules_roborio_toolchain")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies(
        allwpilib_version = "2023.2.1",
        apriltaglib_version = "3.2.0-3",
        imgui_version = "1.89.1-1",
        libssh_version = "0.95-6",
        navx_version = "2023.0.3",
        ni_version = "2023.3.0",
        opencv_version = "4.6.0-4",
        phoenix_version = "5.30.3+23.0.4",
        revlib_version = "2023.1.2",
        rules_bazelrio_version = "0.0.9",
        rules_roborio_toolchain_version = "2023-7"):
    RULES_JVM_EXTERNAL_TAG = "4.2"
    RULES_JVM_EXTERNAL_SHA = "cd1a77b7b02e8e008439ca76fd34f5b07aecb8c752961f9640dea15e9e5ba1ca"
    http_archive(
        name = "rules_jvm_external",
        sha256 = RULES_JVM_EXTERNAL_SHA,
        strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
    )
    load_bzlmodrio_allwpilib(allwpilib_version)
    load_bzlmodrio_apriltaglib(apriltaglib_version)
    load_bzlmodrio_imgui(imgui_version)
    load_bzlmodrio_libssh(libssh_version)
    load_bzlmodrio_navx(navx_version)
    load_bzlmodrio_ni(ni_version)
    load_bzlmodrio_opencv(opencv_version)
    load_bzlmodrio_phoenix(phoenix_version)
    load_bzlmodrio_revlib(revlib_version)
    load_rules_bazelrio(rules_bazelrio_version)
    load_rules_roborio_toolchain(rules_roborio_toolchain_version)

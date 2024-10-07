load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-allwpilib:load_bzlmodrio-allwpilib.bzl", "load_bzlmodrio_allwpilib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-apriltaglib:load_bzlmodrio-apriltaglib.bzl", "load_bzlmodrio_apriltaglib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-choreolib:load_bzlmodrio-choreolib.bzl", "load_bzlmodrio_choreolib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-imgui:load_bzlmodrio-imgui.bzl", "load_bzlmodrio_imgui")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-libssh:load_bzlmodrio-libssh.bzl", "load_bzlmodrio_libssh")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-navx:load_bzlmodrio-navx.bzl", "load_bzlmodrio_navx")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-ni:load_bzlmodrio-ni.bzl", "load_bzlmodrio_ni")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-opencv:load_bzlmodrio-opencv.bzl", "load_bzlmodrio_opencv")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-pathplannerlib:load_bzlmodrio-pathplannerlib.bzl", "load_bzlmodrio_pathplannerlib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-phoenix:load_bzlmodrio-phoenix.bzl", "load_bzlmodrio_phoenix")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-phoenix6:load_bzlmodrio-phoenix6.bzl", "load_bzlmodrio_phoenix6")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-photonlib:load_bzlmodrio-photonlib.bzl", "load_bzlmodrio_photonlib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-revlib:load_bzlmodrio-revlib.bzl", "load_bzlmodrio_revlib")
load("//private/non_bzlmod/smart_dependencies/rules_bazelrio:load_rules_bazelrio.bzl", "load_rules_bazelrio")
load("//private/non_bzlmod/smart_dependencies/rules_bzlmodrio_jdk:load_rules_bzlmodrio_jdk.bzl", "load_rules_bzlmodrio_jdk")
load("//private/non_bzlmod/smart_dependencies/rules_bzlmodrio_toolchains:load_rules_bzlmodrio_toolchains.bzl", "load_rules_bzlmodrio_toolchains")
load("//private/non_bzlmod/smart_dependencies/rules_checkstyle:load_rules_checkstyle.bzl", "load_rules_checkstyle")
load("//private/non_bzlmod/smart_dependencies/rules_pmd:load_rules_pmd.bzl", "load_rules_pmd")
load("//private/non_bzlmod/smart_dependencies/rules_spotless:load_rules_spotless.bzl", "load_rules_spotless")
load("//private/non_bzlmod/smart_dependencies/rules_wpi_styleguide:load_rules_wpi_styleguide.bzl", "load_rules_wpi_styleguide")
load("//private/non_bzlmod/smart_dependencies/rules_wpiformat:load_rules_wpiformat.bzl", "load_rules_wpiformat")

def download_dependencies(
        local_monorepo_base = "../..",
        allwpilib_version = "2024.3.2",
        apriltaglib_version = "2024.3.3.0-2",
        imgui_version = "2024.1.89.9-1",
        libssh_version = "2024.0.105-1",
        navx_version = "2024.1.0",
        ni_version = "2024.2.1.bcr1",
        opencv_version = "2024.4.8.0-4.bcr1",
        phoenix_version = "5.33.1",
        revlib_version = "2024.2.4",
        rules_bazelrio_version = "0.0.14",
        rules_toolchains_version = "2024-1.bcr1",
        rules_checkstyle_version = "10.12.2",
        rules_pmd_version = "7.2.0",
        rules_spotless_version = "2.40.0",
        rules_wpi_styleguide_version = "2024.06.22",
        rules_wpiformat_version = "2024.34",
        photonlib_version = "v2024.3.1",
        pathplannerlib_version = "2024.2.8",
        phoenix6_version = "24.3.0",
        choreolib_version = "2024.2.3",
        rules_jdk_version = "17.0.8.1-1"):
    http_archive(
        name = "rules_java",
        sha256 = "8afd053dd2a7b85a4f033584f30a7f1666c5492c56c76e04eec4428bdb2a86cf",
        url = "https://github.com/bazelbuild/rules_java/releases/download/7.6.5/rules_java-7.6.5.tar.gz",
    )
    http_archive(
        name = "rules_jvm_external",
        sha256 = "08ea921df02ffe9924123b0686dc04fd0ff875710bfadb7ad42badb931b0fd50",
        strip_prefix = "rules_jvm_external-6.1",
        url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/6.1/rules_jvm_external-6.1.tar.gz",
    )
    load_bzlmodrio_allwpilib(allwpilib_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_apriltaglib(apriltaglib_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_imgui(imgui_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_libssh(libssh_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_navx(navx_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_ni(ni_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_opencv(opencv_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_phoenix(phoenix_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_revlib(revlib_version, local_monorepo_base = local_monorepo_base)
    load_rules_bazelrio(rules_bazelrio_version, local_monorepo_base = local_monorepo_base)
    load_rules_bzlmodrio_toolchains(rules_toolchains_version, local_monorepo_base = local_monorepo_base)
    load_rules_checkstyle(rules_checkstyle_version, local_monorepo_base = local_monorepo_base)
    load_rules_pmd(rules_pmd_version, local_monorepo_base = local_monorepo_base)
    load_rules_spotless(rules_spotless_version, local_monorepo_base = local_monorepo_base)
    load_rules_wpi_styleguide(rules_wpi_styleguide_version, local_monorepo_base = local_monorepo_base)
    load_rules_wpiformat(rules_wpiformat_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_photonlib(photonlib_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_pathplannerlib(pathplannerlib_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_phoenix6(phoenix6_version, local_monorepo_base = local_monorepo_base)
    load_bzlmodrio_choreolib(choreolib_version, local_monorepo_base = local_monorepo_base)
    load_rules_bzlmodrio_jdk(rules_jdk_version, local_monorepo_base = local_monorepo_base)

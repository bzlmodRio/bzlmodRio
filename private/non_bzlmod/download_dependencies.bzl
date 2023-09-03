load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
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
load("//private/non_bzlmod/smart_dependencies/rules_bzlmodrio_toolchains:load_rules_bzlmodrio_toolchains.bzl", "load_rules_bzlmodrio_toolchains")
load("//private/non_bzlmod/smart_dependencies/rules_checkstyle:load_rules_checkstyle.bzl", "load_rules_checkstyle")
load("//private/non_bzlmod/smart_dependencies/rules_pmd:load_rules_pmd.bzl", "load_rules_pmd")
load("//private/non_bzlmod/smart_dependencies/rules_spotless:load_rules_spotless.bzl", "load_rules_spotless")
load("//private/non_bzlmod/smart_dependencies/rules_wpi_styleguide:load_rules_wpi_styleguide.bzl", "load_rules_wpi_styleguide")
load("//private/non_bzlmod/smart_dependencies/rules_wpiformat:load_rules_wpiformat.bzl", "load_rules_wpiformat")

def download_dependencies(
        local_monorepo_base = "../..",
        allwpilib_version = "2023.4.3",
        apriltaglib_version = "3.2.0-8",
        imgui_version = "1.89.1-2",
        libssh_version = "0.95-8",
        navx_version = "2023.0.3",
        ni_version = "2023.3.0",
        opencv_version = "4.6.0-5",
        phoenix_version = "5.31.0+23.2.2",
        revlib_version = "2023.1.3",
        rules_bazelrio_version = "0.0.13",
        rules_toolchains_version = "2023-7",
        rules_checkstyle_version = "10.1",
        rules_pmd_version = "6.43.0",
        rules_spotless_version = "2.34.0",
        rules_wpi_styleguide_version = "1.0.0",
        rules_wpiformat_version = "2022.30"):
    http_archive(
        name = "rules_jvm_external",
        sha256 = "d31e369b854322ca5098ea12c69d7175ded971435e55c18dd9dd5f29cc5249ac",
        strip_prefix = "rules_jvm_external-5.3",
        url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/5.3/rules_jvm_external-5.3.tar.gz",
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

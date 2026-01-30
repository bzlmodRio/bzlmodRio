load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-allwpilib:load_bzlmodrio-allwpilib.bzl", "load_bzlmodrio_allwpilib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-choreolib:load_bzlmodrio-choreolib.bzl", "load_bzlmodrio_choreolib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-ni:load_bzlmodrio-ni.bzl", "load_bzlmodrio_ni")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-opencv:load_bzlmodrio-opencv.bzl", "load_bzlmodrio_opencv")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-pathplannerlib:load_bzlmodrio-pathplannerlib.bzl", "load_bzlmodrio_pathplannerlib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-phoenix:load_bzlmodrio-phoenix.bzl", "load_bzlmodrio_phoenix")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-phoenix6:load_bzlmodrio-phoenix6.bzl", "load_bzlmodrio_phoenix6")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-photonlib:load_bzlmodrio-photonlib.bzl", "load_bzlmodrio_photonlib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-revlib:load_bzlmodrio-revlib.bzl", "load_bzlmodrio_revlib")
load("//private/non_bzlmod/smart_dependencies/bzlmodrio-studica:load_bzlmodrio-studica.bzl", "load_bzlmodrio_studica")
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
        allwpilib_version = "2026.2.1",
        ni_version = "2026.1.0",
        opencv_version = "2025.4.10.0-3.bcr3",
        phoenix_version = "5.36.0",
        revlib_version = "2026.0.1",
        rules_bazelrio_version = "0.0.14",
        rules_toolchains_version = "2025-1.bcr5",
        rules_checkstyle_version = "10.12.2.bcr1",
        rules_pmd_version = "7.2.0.bcr1",
        rules_spotless_version = "2.40.0.bcr1",
        rules_wpi_styleguide_version = "2025.06.22",
        rules_wpiformat_version = "2025.68",
        photonlib_version = "v2026.1.1",
        pathplannerlib_version = "2026.1.2",
        phoenix6_version = "26.1.1",
        choreolib_version = "2026.0.1",
        rules_jdk_version = "17.0.12-7.bcr1",
        studica_version = "2026.0.0"):
    http_archive(
        name = "rules_cc",
        sha256 = "0d3b4f984c4c2e1acfd1378e0148d35caf2ef1d9eb95b688f8e19ce0c41bdf5b",
        strip_prefix = "rules_cc-0.1.4",
        url = "https://github.com/bazelbuild/rules_cc/releases/download/0.1.4/rules_cc-0.1.4.tar.gz",
    )
    http_archive(
        name = "rules_java",
        sha256 = "1558508fc6c348d7f99477bd21681e5746936f15f0436b5f4233e30832a590f9",
        url = "https://github.com/bazelbuild/rules_java/releases/download/8.12.0/rules_java-8.12.0.tar.gz",
    )
    http_archive(
        name = "rules_jvm_external",
        sha256 = "c18a69d784bcd851be95897ca0eca0b57dc86bb02e62402f15736df44160eb02",
        strip_prefix = "rules_jvm_external-6.3",
        url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/6.3/rules_jvm_external-6.3.tar.gz",
    )
    http_archive(
        name = "rules_python",
        sha256 = "f609f341d6e9090b981b3f45324d05a819fd7a5a56434f849c761971ce2c47da",
        strip_prefix = "rules_python-1.7.0",
        url = "https://github.com/bazelbuild/rules_python/releases/download/1.7.0/rules_python-1.7.0.tar.gz",
    )
    http_archive(
        name = "rules_shell",
        sha256 = "3e114424a5c7e4fd43e0133cc6ecdfe54e45ae8affa14fadd839f29901424043",
        strip_prefix = "rules_shell-0.4.0",
        url = "https://github.com/bazelbuild/rules_shell/releases/download/v0.4.0/rules_shell-v0.4.0.tar.gz",
    )
    http_archive(
        name = "bazel_features",
        sha256 = "a015f3f2ebf4f1ac3f4ca8ea371610acb63e1903514fa8725272d381948d2747",
        strip_prefix = "bazel_features-1.31.0",
        url = "https://github.com/bazel-contrib/bazel_features/releases/download/v1.31.0/bazel_features-v1.31.0.tar.gz",
    )
    http_archive(
        name = "bazel_skylib",
        sha256 = "51b5105a760b353773f904d2bbc5e664d0987fbaf22265164de65d43e910d8ac",
        url = "https://github.com/bazelbuild/bazel-skylib/releases/download/1.8.1/bazel-skylib-1.8.1.tar.gz",
    )
    http_archive(
        name = "rules_proto",
        sha256 = "0e5c64a2599a6e26c6a03d6162242d231ecc0de219534c38cb4402171def21e8",
        strip_prefix = "rules_proto-7.0.2",
        url = "https://github.com/bazelbuild/rules_proto/archive/refs/tags/7.0.2.tar.gz",
    )
    http_archive(
        name = "com_google_protobuf",
        sha256 = "10a0d58f39a1a909e95e00e8ba0b5b1dc64d02997f741151953a2b3659f6e78c",
        strip_prefix = "protobuf-29.0",
        urls = ["https://github.com/protocolbuffers/protobuf/archive/v29.0.tar.gz"],
    )
    load_bzlmodrio_allwpilib(allwpilib_version, local_monorepo_base = local_monorepo_base)
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
    load_bzlmodrio_studica(studica_version, local_monorepo_base = local_monorepo_base)

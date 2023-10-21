load("//private/non_bzlmod:download_dependencies.bzl", "download_dependencies")

def setup_bazelrio_dependencies(
        toolchain_versions = "2023-7",
        wpilib_version = "2023.2.1",
        ni_version = "2023.3.0",
        opencv_version = "4.6.0-4",
        revlib_version = "2023.1.2",
        phoenix_version = "5.30.3+23.0.4",
        navx_version = "2023.0.3",
        imgui_version = "1.89.1-1",
        libssh_version = "0.95-6",
        apriltaglib_version = "3.2.0-3",
        **kwargs):
    download_dependencies(
        allwpilib_version = wpilib_version,
        apriltaglib_version = apriltaglib_version,
        imgui_version = imgui_version,
        libssh_version = libssh_version,
        navx_version = navx_version,
        ni_version = ni_version,
        opencv_version = opencv_version,
        phoenix_version = phoenix_version,
        revlib_version = revlib_version,
        rules_toolchains_version = toolchain_versions,
        **kwargs
    )

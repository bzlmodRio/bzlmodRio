load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@allwpilib//:maven_cpp_deps.bzl", "setup_legacy_allwpilib_cpp_dependencies")
load("@wpi-opencv//:maven_cpp_deps.bzl", "setup_legacy_wpi_opencv_cpp_dependencies")
load("@bzlmodrio-ni//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_ni_cpp_dependencies")
load("@ctre//:maven_cpp_deps.bzl", "setup_legacy_ctre_cpp_dependencies")
load("@rev//:maven_cpp_deps.bzl", "setup_legacy_rev_cpp_dependencies")
load("@navx//:maven_cpp_deps.bzl", "setup_legacy_navx_cpp_dependencies")
load("@rules_roborio_toolchain//:maven_deps.bzl", "setup_legacy_setup_toolchains_dependencies")
load("@rules_roborio_toolchain//toolchains:load_toolchains.bzl", "load_toolchains")
load("@rules_python//python:pip.bzl", "pip_parse")

def _setup_toolchains():
    setup_legacy_setup_toolchains_dependencies()

    load_toolchains()

    native.register_toolchains(
        "@local_roborio//:macos",
        "@local_roborio//:linux",
        "@local_roborio//:windows",
    )

def _setup_cpp_dependencies():
    setup_legacy_wpi_opencv_cpp_dependencies()
    setup_legacy_bzlmodrio_ni_cpp_dependencies()
    setup_legacy_allwpilib_cpp_dependencies()
    setup_legacy_ctre_cpp_dependencies()
    setup_legacy_rev_cpp_dependencies()
    setup_legacy_navx_cpp_dependencies()

def setup_dependencies():
    _setup_toolchains()
    _setup_cpp_dependencies()

    maven_install(
        name = "rules_bazelrio_maven",
        artifacts = [
            "com.hierynomus:sshj:0.32.0",
            "me.tongfei:progressbar:0.9.2",
            "net.sourceforge.argparse4j:argparse4j:0.9.0",
            "org.slf4j:slf4j-nop:1.7.32",
        ],
        repositories = [
            "https://repo1.maven.org/maven2",
        ],
    )

    print("hello")

    pip_parse(
        name = "bzlmodrio-gentool-pip",
        requirements_lock = "@bzlmodrio-gentool//:requirements_lock.txt",
    )

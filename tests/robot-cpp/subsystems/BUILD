load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "subsystems",
    srcs = glob(["*.cpp"]),
    hdrs = glob(["*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "@bzlmodrio-allwpilib//libraries/cpp/wpilibNewCommands",
        "@bzlmodrio-allwpilib//libraries/cpp/wpilibc",
        "@bzlmodrio-navx//libraries/cpp/navx",
        "@bzlmodrio-phoenix6//libraries/cpp/phoenix6-cpp",
        "@bzlmodrio-revlib//libraries/cpp/revlib-cpp",
    ],
)

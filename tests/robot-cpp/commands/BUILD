load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "commands",
    srcs = glob(["*.cpp"]),
    hdrs = glob(["*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//robot-cpp/subsystems",
        "@bzlmodrio-allwpilib//libraries/cpp/wpilibNewCommands",
        "@bzlmodrio-allwpilib//libraries/cpp/wpilibc",
    ],
)

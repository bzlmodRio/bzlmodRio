load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "commands",
    srcs = glob(["*.cpp"]),
    hdrs = glob(["*.hpp"]),
    visibility = ["//visibility:public"],
    deps = [
        "//robot-cpp/subsystems",
        "@bazelrio//libraries/cpp/wpilib/new_commands",
        "@bazelrio//libraries/cpp/wpilib/wpilibc",
    ],
)

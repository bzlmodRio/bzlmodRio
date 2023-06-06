load("@rules_bazelrio//:robot_rules.bzl", "robot_java_binary")
load("@rules_java//java:defs.bzl", "java_library")
load("@rules_wpi_styleguide//styleguide:java_styleguide.bzl", "java_styleguide")

java_library(
    name = "robot-lib",
    srcs = glob(["*.java"]),
    visibility = ["//visibility:public"],
    deps = [
        "//robot-java/src/main/java/frc/robot/commands",
        "//robot-java/src/main/java/frc/robot/subsystems",
        "@bzlmodrio-allwpilib//libraries/java/wpilibNewCommands",
        "@bzlmodrio-allwpilib//libraries/java/wpilibj",
        "@bzlmodrio-allwpilib//libraries/java/wpimath",
    ],
)

robot_java_binary(
    name = "robot",
    halsim_deps = ["@bzlmodrio-allwpilib//libraries/cpp/halsim_gui:halsim_gui"],
    jvm_flags = [
        "-Djava.library.path=.",
    ],
    main_class = "frc.robot.Main",
    tags = ["no-sandbox"],
    team_number = 9999,
    visibility = ["//visibility:public"],
    runtime_deps = [
        ":robot-lib",
    ],
)

java_styleguide(name = "commands")

load("@rules_bazelrio//:robot_rules.bzl", __robot_cc_binary = "robot_cc_binary", __robot_java_binary = "robot_java_binary")

robot_java_binary = __robot_java_binary

def robot_cc_binary(name, team_number, srcs = [], hdrs = [], deps = [], halsim_configs = None, **kwargs):
    native.cc_library(
        name = name + ".lib",
        deps = deps,
        srcs = srcs,
        hdrs = hdrs,
        **kwargs
    )

    halsim_deps = []
    if halsim_configs:
        if len(halsim_configs) != 1:
            fail("bazelrio->bzlmodrio bridge does not support more than one simulation type")
        halsim_deps = halsim_configs[halsim_configs.keys()[0]]

    __robot_cc_binary(
        name = name,
        team_number = team_number,
        lib_name = name + ".lib",
        halsim_deps = halsim_deps,
        **kwargs
    )

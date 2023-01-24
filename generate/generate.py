import os


class Library:
    def __init__(self, repo, subfolder, alias, has_jni=False):
        self.repo = repo
        self.subfolder = subfolder
        self.alias = alias
        self.has_jni = has_jni


def main():

    libraries = [
        Library("ctre", "cpp/ctre/phoenix", "//dependencies/cpp/wpiapi"),
        Library("navx", "cpp/kauailabs/navx", "//dependencies/cpp/navx"),
        Library("rev", "cpp/rev/revlib", "//dependencies/cpp/revlib"),
        Library("allwpilib", "cpp/wpilib/cameraserver", "//dependencies/cpp/cameraserver"),
        Library("allwpilib", "cpp/wpilib/cscore", "//dependencies/cpp/cscore", has_jni=True),
        Library("allwpilib", "cpp/wpilib/hal", "//dependencies/cpp/hal", has_jni=True),
        Library("allwpilib", "cpp/wpilib/new_commands", "//dependencies/cpp/wpilibNewCommands"),
        Library("allwpilib", "cpp/wpilib/ntcore", "//dependencies/cpp/ntcore", has_jni=True),
        Library("allwpilib", "cpp/wpilib/wpilibc", "//dependencies/cpp/wpilibc"),
        Library("allwpilib", "cpp/wpilib/wpimath", "//dependencies/cpp/wpimath", has_jni=True),
        Library("allwpilib", "cpp/wpilib/wpinet", "//dependencies/cpp/wpinet", has_jni=True),
        Library("allwpilib", "cpp/wpilib/wpiutil", "//dependencies/cpp/wpiutil", has_jni=True),
        Library("allwpilib", "cpp/wpilib/simulation/halsim_ds_socket", "//dependencies/cpp/halsim_ds_socket"),
        Library("allwpilib", "cpp/wpilib/simulation/halsim_gui", "//dependencies/cpp/halsim_gui"),
        Library("allwpilib", "cpp/wpilib/simulation/halsim_ws_client", "//dependencies/cpp/halsim_ws_client"),
        Library("allwpilib", "cpp/wpilib/simulation/halsim_ws_server", "//dependencies/cpp/halsim_ws_server"),
        
        Library("ctre", "java/ctre/phoenix", "//dependencies/java/wpiapi"),
        Library("navx", "java/kauailabs/navx", "//dependencies/java/navx"),
        Library("rev", "java/rev/revlib", "//dependencies/java/revlib"),
        Library("wpi-opencv", "java/opencv", "//dependencies/java/opencv"),
        Library("allwpilib", "java/wpilib/cameraserver", "//dependencies/java/cameraserver"),
        Library("allwpilib", "java/wpilib/cscore", "//dependencies/java/cscore"),
        Library("allwpilib", "java/wpilib/hal", "//dependencies/java/hal"),
        Library("allwpilib", "java/wpilib/new_commands", "//dependencies/java/wpilibNewCommands"),
        Library("allwpilib", "java/wpilib/ntcore", "//dependencies/java/ntcore"),
        Library("allwpilib", "java/wpilib/wpilibj", "//dependencies/java/wpilibj"),
        Library("allwpilib", "java/wpilib/wpimath", "//dependencies/java/wpimath"),
        Library("allwpilib", "java/wpilib/wpinet", "//dependencies/java/wpinet"),
        Library("allwpilib", "java/wpilib/wpiutil", "//dependencies/java/wpiutil"),
        
        Library("allwpilib", "java/wpilib/shuffleboard", "//dependencies/java/shuffleboard-api"),
        
        Library("allwpilib", "tools/glass", "//dependencies/tools/glass"),
        Library("allwpilib", "tools/pathweaver", "//dependencies/tools/PathWeaver"),
        Library("allwpilib", "tools/robotbuilder", "//dependencies/tools/RobotBuilder"),
        Library("allwpilib", "tools/shuffleboard", "//dependencies/tools/Shuffleboard"),
        Library("allwpilib", "tools/smartdashboard", "//dependencies/tools/SmartDashboard"),
    ]


    for lib in libraries:
        dir = os.path.join('/home/pjreiniger/git/bzlmodRio/bzlmodRio/libraries', lib.subfolder)
        if not os.path.exists(dir):
            os.makedirs(dir)
        with open(os.path.join(dir, "BUILD"), 'w') as f:
            f.write(f"""alias(
    name = "{lib.subfolder.split('/')[-1]}",
    actual = "@{lib.repo}{lib.alias}",
    visibility = ["//visibility:public"],
)
""")
            if lib.has_jni:
                f.write(f"""
alias(
    name = "jni",
    actual = "@{lib.repo}{lib.alias}:jni",
    visibility = ["//visibility:public"],
)""")


    pass


if __name__ == "__main__":
    main()
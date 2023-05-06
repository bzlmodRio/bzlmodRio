class Library:
    def __init__(self, repo, subfolder, alias, has_jni=False):
        self.repo = repo
        self.subfolder = subfolder
        self.alias = alias
        self.has_jni = has_jni


def get_libraries():
    return [
        Library("bzlmodrio-phoenix", "cpp/ctre/phoenix", "//libraries/cpp/wpiapi-cpp"),
        Library("bzlmodrio-navx", "cpp/kauailabs/navx", "//libraries/cpp/navx"),
        Library("bzlmodrio-revlib", "cpp/rev/revlib", "//libraries/cpp/revlib-cpp"),
        Library(
            "bzlmodrio-allwpilib",
            "cpp/wpilib/cameraserver",
            "//libraries/cpp/cameraserver",
        ),
        Library(
            "bzlmodrio-allwpilib",
            "cpp/wpilib/cscore",
            "//libraries/cpp/cscore",
            has_jni=True,
        ),
        Library(
            "bzlmodrio-allwpilib", "cpp/wpilib/hal", "//libraries/cpp/hal", has_jni=True
        ),
        Library(
            "bzlmodrio-allwpilib",
            "cpp/wpilib/new_commands",
            "//libraries/cpp/wpilibNewCommands",
        ),
        Library(
            "bzlmodrio-allwpilib",
            "cpp/wpilib/ntcore",
            "//libraries/cpp/ntcore",
            has_jni=True,
        ),
        Library("bzlmodrio-allwpilib", "cpp/wpilib/wpilibc", "//libraries/cpp/wpilibc"),
        Library(
            "bzlmodrio-allwpilib",
            "cpp/wpilib/wpimath",
            "//libraries/cpp/wpimath",
            has_jni=True,
        ),
        Library(
            "bzlmodrio-allwpilib",
            "cpp/wpilib/wpinet",
            "//libraries/cpp/wpinet",
            has_jni=True,
        ),
        Library(
            "bzlmodrio-allwpilib",
            "cpp/wpilib/wpiutil",
            "//libraries/cpp/wpiutil",
            has_jni=True,
        ),
        Library(
            "bzlmodrio-allwpilib",
            "cpp/wpilib/simulation/halsim_ds_socket",
            "//libraries/cpp/halsim_ds_socket",
        ),
        Library(
            "bzlmodrio-allwpilib",
            "cpp/wpilib/simulation/halsim_gui",
            "//libraries/cpp/halsim_gui",
        ),
        Library(
            "bzlmodrio-allwpilib",
            "cpp/wpilib/simulation/halsim_ws_client",
            "//libraries/cpp/halsim_ws_client",
        ),
        Library(
            "bzlmodrio-allwpilib",
            "cpp/wpilib/simulation/halsim_ws_server",
            "//libraries/cpp/halsim_ws_server",
        ),
        Library("bzlmodrio-opencv", "cpp/opencv", "//libraries/cpp/opencv"),
        Library("bzlmodrio-libssh", "cpp/libssh", "//libraries/cpp/libssh"),
        Library(
            "bzlmodrio-apriltaglib", "cpp/apriltaglib", "//libraries/cpp/apriltaglib"
        ),
        Library("bzlmodrio-imgui", "cpp/imgui", "//libraries/cpp/imgui"),
        Library(
            "bzlmodrio-phoenix", "java/ctre/phoenix", "//libraries/java/wpiapi-java"
        ),
        Library("bzlmodrio-navx", "java/kauailabs/navx", "//libraries/java/navx"),
        Library("bzlmodrio-revlib", "java/rev/revlib", "//libraries/java/revlib-java"),
        Library("bzlmodrio-opencv", "java/opencv", "//libraries/java/opencv"),
        Library(
            "bzlmodrio-allwpilib",
            "java/wpilib/cameraserver",
            "//libraries/java/cameraserver",
        ),
        Library("bzlmodrio-allwpilib", "java/wpilib/cscore", "//libraries/java/cscore"),
        Library("bzlmodrio-allwpilib", "java/wpilib/hal", "//libraries/java/hal"),
        Library(
            "bzlmodrio-allwpilib",
            "java/wpilib/new_commands",
            "//libraries/java/wpilibNewCommands",
        ),
        Library("bzlmodrio-allwpilib", "java/wpilib/ntcore", "//libraries/java/ntcore"),
        Library(
            "bzlmodrio-allwpilib", "java/wpilib/wpilibj", "//libraries/java/wpilibj"
        ),
        Library(
            "bzlmodrio-allwpilib", "java/wpilib/wpimath", "//libraries/java/wpimath"
        ),
        Library("bzlmodrio-allwpilib", "java/wpilib/wpinet", "//libraries/java/wpinet"),
        Library(
            "bzlmodrio-allwpilib", "java/wpilib/wpiutil", "//libraries/java/wpiutil"
        ),
        Library(
            "bzlmodrio-allwpilib",
            "java/wpilib/shuffleboard",
            "//libraries/java/shuffleboard-api",
        ),
        Library("bzlmodrio-allwpilib", "tools/glass", "//libraries/tools/glass"),
        Library(
            "bzlmodrio-allwpilib", "tools/pathweaver", "//libraries/tools/PathWeaver"
        ),
        Library(
            "bzlmodrio-allwpilib",
            "tools/robotbuilder",
            "//libraries/tools/RobotBuilder",
        ),
        Library(
            "bzlmodrio-allwpilib",
            "tools/shuffleboard",
            "//libraries/tools/shuffleboard",
        ),
        Library(
            "bzlmodrio-allwpilib",
            "tools/smartdashboard",
            "//libraries/tools/SmartDashboard",
        ),
    ]

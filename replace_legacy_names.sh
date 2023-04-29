
# Replace dependencies

buildozer 'replace deps @photonvision//photon-lib-java @photonvision//photon-lib:java' //...:*



buildozer 'replace standard_deps @bazelrio//libraries/cpp/opencv @bzlmodrio-opencv//libraries/cpp/opencv' //...:*
buildozer 'replace standard_deps @bazelrio//libraries/java/opencv @bzlmodrio-opencv//libraries/java/opencv' //...:*

buildozer 'replace deps @bazelrio//libraries/cpp/ctre/phoenix @bzlmodrio-phoenix//libraries/cpp/wpiapi-cpp' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/kauailabs/navx @bzlmodrio-navx//libraries/cpp/navx' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/rev/revlib @bzlmodrio-revlib//libraries/cpp/revlib-cpp' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/cameraserver @bzlmodrio-allwpilib//libraries/cpp/cameraserver' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/cscore @bzlmodrio-allwpilib//libraries/cpp/cscore' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/cscore:jni @bzlmodrio-allwpilib//libraries/cpp/cscore:jni' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/hal @bzlmodrio-allwpilib//libraries/cpp/hal' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/hal:jni @bzlmodrio-allwpilib//libraries/cpp/hal:jni' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/new_commands @bzlmodrio-allwpilib//libraries/cpp/wpilibNewCommands' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/ntcore @bzlmodrio-allwpilib//libraries/cpp/ntcore' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/ntcore:jni @bzlmodrio-allwpilib//libraries/cpp/ntcore:jni' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/wpilibc @bzlmodrio-allwpilib//libraries/cpp/wpilibc' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/wpimath @bzlmodrio-allwpilib//libraries/cpp/wpimath' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/wpimath:jni @bzlmodrio-allwpilib//libraries/cpp/wpimath:jni' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/wpinet @bzlmodrio-allwpilib//libraries/cpp/wpinet' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/wpinet:jni @bzlmodrio-allwpilib//libraries/cpp/wpinet:jni' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/wpiutil @bzlmodrio-allwpilib//libraries/cpp/wpiutil' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/wpiutil:jni @bzlmodrio-allwpilib//libraries/cpp/wpiutil:jni' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/simulation/halsim_ds_socket @bzlmodrio-allwpilib//libraries/cpp/halsim_ds_socket' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/simulation/halsim_gui @bzlmodrio-allwpilib//libraries/cpp/halsim_gui' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/simulation/halsim_ws_client @bzlmodrio-allwpilib//libraries/cpp/halsim_ws_client' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/wpilib/simulation/halsim_ws_server @bzlmodrio-allwpilib//libraries/cpp/halsim_ws_server' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/opencv @bzlmodrio-opencv//libraries/cpp/opencv' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/libssh @bzlmodrio-libssh//libraries/cpp/libssh' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/apriltaglib @bzlmodrio-apriltaglib//libraries/cpp/apriltaglib' //...:*
buildozer 'replace deps @bazelrio//libraries/cpp/imgui @bzlmodrio-imgui//libraries/cpp/imgui' //...:*
buildozer 'replace deps @bazelrio//libraries/java/ctre/phoenix @bzlmodrio-phoenix//libraries/java/wpiapi-java' //...:*
buildozer 'replace deps @bazelrio//libraries/java/kauailabs/navx @bzlmodrio-navx//libraries/java/navx' //...:*
buildozer 'replace deps @bazelrio//libraries/java/rev/revlib @bzlmodrio-revlib//libraries/java/revlib-java' //...:*
buildozer 'replace deps @bazelrio//libraries/java/opencv @bzlmodrio-opencv//libraries/java/opencv' //...:*
buildozer 'replace deps @bazelrio//libraries/java/wpilib/cameraserver @bzlmodrio-allwpilib//libraries/java/cameraserver' //...:*
buildozer 'replace deps @bazelrio//libraries/java/wpilib/cscore @bzlmodrio-allwpilib//libraries/java/cscore' //...:*
buildozer 'replace deps @bazelrio//libraries/java/wpilib/hal @bzlmodrio-allwpilib//libraries/java/hal' //...:*
buildozer 'replace deps @bazelrio//libraries/java/wpilib/new_commands @bzlmodrio-allwpilib//libraries/java/wpilibNewCommands' //...:*
buildozer 'replace deps @bazelrio//libraries/java/wpilib/ntcore @bzlmodrio-allwpilib//libraries/java/ntcore' //...:*
buildozer 'replace deps @bazelrio//libraries/java/wpilib/wpilibj @bzlmodrio-allwpilib//libraries/java/wpilibj' //...:*
buildozer 'replace deps @bazelrio//libraries/java/wpilib/wpimath @bzlmodrio-allwpilib//libraries/java/wpimath' //...:*
buildozer 'replace deps @bazelrio//libraries/java/wpilib/wpinet @bzlmodrio-allwpilib//libraries/java/wpinet' //...:*
buildozer 'replace deps @bazelrio//libraries/java/wpilib/wpiutil @bzlmodrio-allwpilib//libraries/java/wpiutil' //...:*
buildozer 'replace deps @bazelrio//libraries/java/wpilib/shuffleboard @bzlmodrio-allwpilib//libraries/java/shuffleboard-api' //...:*
buildozer 'replace deps @bazelrio//libraries/tools/glass @bzlmodrio-allwpilib//libraries/tools/glass' //...:*
buildozer 'replace deps @bazelrio//libraries/tools/pathweaver @bzlmodrio-allwpilib//libraries/tools/PathWeaver' //...:*
buildozer 'replace deps @bazelrio//libraries/tools/robotbuilder @bzlmodrio-allwpilib//libraries/tools/RobotBuilder' //...:*
buildozer 'replace deps @bazelrio//libraries/tools/shuffleboard @bzlmodrio-allwpilib//libraries/tools/shuffleboard' //...:*
buildozer 'replace deps @bazelrio//libraries/tools/smartdashboard @bzlmodrio-allwpilib//libraries/tools/SmartDashboard' //...:*

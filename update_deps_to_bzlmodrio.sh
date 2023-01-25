# buildozer 'replace deps @wpi-opencv//dependencies/cpp/opencv //pkg_v2' //...:*

buildozer 'substitute deps @wpi-opencv//dependencies/(.*) @wpi-opencv//libraries/${1}' //...:*
buildozer 'substitute deps @bzlmodrio-ni//dependencies/(.*) @bzlmodrio-ni//libraries/${1}' //...:*
buildozer 'substitute deps @ctre//dependencies/(.*) @ctre//libraries/${1}' //...:*
buildozer 'substitute deps @allwpilib//dependencies/(.*) @allwpilib//libraries/${1}' //...:*
buildozer 'substitute halsim_deps @allwpilib//dependencies/(.*) @allwpilib//libraries/${1}' //...:*
buildozer 'substitute deps @rev//dependencies/(.*) @rev//libraries/${1}' //...:*
buildozer 'substitute deps @navx//dependencies/(.*) @navx//libraries/${1}' //...:*

buildozer 'substitute actual @wpi-opencv//dependencies/(.*) @wpi-opencv//libraries/${1}' //...:*
buildozer 'substitute actual @bzlmodrio-ni//dependencies/(.*) @bzlmodrio-ni//libraries/${1}' //...:*
buildozer 'substitute actual @ctre//dependencies/(.*) @ctre//libraries/${1}' //...:*
buildozer 'substitute actual @allwpilib//dependencies/(.*) @allwpilib//libraries/${1}' //...:*
buildozer 'substitute actual @rev//dependencies/(.*) @rev//libraries/${1}' //...:*
buildozer 'substitute actual @navx//dependencies/(.*) @navx//libraries/${1}' //...:*

buildozer 'substitute_load @wpi-opencv//(.*) @bzlmodrio-opencv//${1}' //...:*
buildozer 'substitute_load @bzlmodrio-ni//(.*) @bzlmodrio-ni//${1}' //...:*
buildozer 'substitute_load @ctre//(.*) @bzlmodrio-ctre//${1}' //...:*
buildozer 'substitute_load @allwpilib//:(.*) @bzlmodrio-allwpilib//:${1}' //...:*
buildozer 'substitute_load @rev//(.*) @bzlmodrio-rev//${1}' //...:*
buildozer 'substitute_load @navx//(.*) @bzlmodrio-navx//${1}' //...:*
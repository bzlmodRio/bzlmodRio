from bazelrio_gentool.deps.dependency_container import (
    DependencyContainer,
    ModuleDependency,
)
from get_opencv_dependencies import get_opencv_dependencies
from get_ni_dependencies import get_ni_dependencies
from get_allwpilib_dependencies import get_allwpilib_dependencies
from get_phoenix_dependencies import get_phoenix_dependencies
from get_revlib_dependencies import get_revlib_dependencies
from get_navx_dependencies import get_navx_dependencies
from get_imgui_dependencies import get_imgui_dependencies
from get_libssh_dependencies import get_libssh_dependencies
from get_apriltaglib_dependencies import get_apriltaglib_dependencies


def create_mega_group():
    group = DependencyContainer("bzlmodrio", "2023.2", None, None)

    opencv_dependency = ModuleDependency(
        get_opencv_dependencies(),
        use_local_version=True,
        local_rel_folder="../../libraries/bzlmodRio-opencv",
        remote_repo="bzlmodRio-opencv",
    )
    group.add_module_dependency(opencv_dependency)

    ni_dependency = ModuleDependency(
        get_ni_dependencies(),
        use_local_version=True,
        local_rel_folder="../../libraries/bzlmodRio-ni",
        remote_repo="bzlmodRio-ni",
    )
    group.add_module_dependency(ni_dependency)

    allwpilib_dependency = ModuleDependency(
        get_allwpilib_dependencies(),
        use_local_version=True,
        local_rel_folder="../../libraries/bzlmodRio-allwpilib",
        remote_repo="bzlmodRio-allwpilib",
    )
    group.add_module_dependency(allwpilib_dependency)

    phoenix_dependency = ModuleDependency(
        get_phoenix_dependencies(),
        use_local_version=True,
        local_rel_folder="../../libraries/bzlmodRio-phoenix",
        remote_repo="bzlmodRio-phoenix",
    )
    group.add_module_dependency(phoenix_dependency)

    revlib_dependency = ModuleDependency(
        get_revlib_dependencies(),
        use_local_version=True,
        local_rel_folder="../../libraries/bzlmodRio-revlib",
        remote_repo="bzlmodRio-revlib",
    )
    group.add_module_dependency(revlib_dependency)

    navx_dependency = ModuleDependency(
        get_navx_dependencies(),
        use_local_version=True,
        local_rel_folder="../../libraries/bzlmodRio-navx",
        remote_repo="bzlmodRio-navx",
    )
    group.add_module_dependency(navx_dependency)

    imgui_dependency = ModuleDependency(
        get_imgui_dependencies(),
        use_local_version=True,
        local_rel_folder="../../libraries/bzlmodRio-imgui",
        remote_repo="bzlmodRio-imgui",
    )
    group.add_module_dependency(imgui_dependency)

    libssh_dependency = ModuleDependency(
        get_libssh_dependencies(),
        use_local_version=True,
        local_rel_folder="../../libraries/bzlmodRio-libssh",
        remote_repo="bzlmodRio-libssh",
    )
    group.add_module_dependency(libssh_dependency)

    apriltaglib_dependency = ModuleDependency(
        get_apriltaglib_dependencies(),
        use_local_version=True,
        local_rel_folder="../../libraries/bzlmodRio-apriltaglib",
        remote_repo="bzlmodRio-apriltaglib",
    )
    group.add_module_dependency(apriltaglib_dependency)

    return group

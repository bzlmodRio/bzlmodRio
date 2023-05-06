from bazelrio_gentool.deps.dependency_container import (
    DependencyContainer,
    ModuleDependency,
)

from get_allwpilib_dependencies import get_allwpilib_dependencies
from get_ctre_dependencies import get_ctre_dependencies
from get_rev_dependencies import get_rev_dependencies
from get_navx_dependencies import get_navx_dependencies
from get_imgui_dependencies import get_imgui_dependencies
from get_libssh_dependencies import get_libssh_dependencies


def create_mega_group():

    group = DependencyContainer("bzlmodrio", "2023.2", None, None)

    use_local_opencv = True
    use_local_ni = True
    use_local_allwpilib = True

    allwpilib_dependency = ModuleDependency(
        get_allwpilib_dependencies(
            use_local_opencv=use_local_opencv, use_local_ni=use_local_ni
        ),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-allwpilib",
        remote_repo="bzlmodRio-allwpilib",
    )
    group.add_module_dependency(allwpilib_dependency)

    phoenix_dependency = ModuleDependency(
        get_ctre_dependencies(
            use_local_opencv=use_local_opencv, use_local_ni=use_local_ni
        ),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-ctre",
        remote_repo="bzlmodRio-phoenix",
    )
    group.add_module_dependency(phoenix_dependency)

    navx_dependency = ModuleDependency(
        get_navx_dependencies(
            use_local_opencv=use_local_opencv, use_local_ni=use_local_ni
        ),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-navx",
        remote_repo="bzlmodRio-navx",
    )
    group.add_module_dependency(navx_dependency)

    revlib_dependency = ModuleDependency(
        get_rev_dependencies(
            use_local_opencv=use_local_opencv, use_local_ni=use_local_ni
        ),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-revlib",
        remote_repo="bzlmodRio-revlib",
    )
    group.add_module_dependency(revlib_dependency)

    libssh_dependency = ModuleDependency(
        get_libssh_dependencies(),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-revlib",
        remote_repo="bzlmodRio-revlib",
    )
    group.add_module_dependency(libssh_dependency)

    imgui_dependency = ModuleDependency(
        get_imgui_dependencies(),
        use_local_version=use_local_allwpilib,
        local_rel_folder="../../libraries/bzlmodRio-revlib",
        remote_repo="bzlmodRio-revlib",
    )
    group.add_module_dependency(imgui_dependency)

    return group

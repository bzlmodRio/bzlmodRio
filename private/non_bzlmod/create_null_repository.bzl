def create_null_repository_impl(repository_ctx):
    print("LOading repository")
    print(repository_ctx.name)
    print(repository_ctx.attr.sanitized_repo_name)
    repository_ctx.file("BUILD", "")
    repository_ctx.file("nonbzlmod_setup.bzl", "def setup_" + repository_ctx.attr.sanitized_repo_name + "():\n    pass")
    repository_ctx.file("maven_cpp_deps.bzl", "def setup_legacy_" + repository_ctx.attr.sanitized_repo_name + "_cpp_dependencies():\n    pass")
    repository_ctx.file("maven_java_deps.bzl", """
def get_{}_java_dependencies():\n   
    return [], []
def setup_legacy_{}_java_dependencies():\n   
    pass
""".format(repository_ctx.attr.sanitized_repo_name, repository_ctx.attr.sanitized_repo_name))
    repository_ctx.file("maven_deps.bzl", "def setup_legacy_setup_toolchains_dependencies():\n    pass")
    repository_ctx.file("toolchains/BUILD", "")
    repository_ctx.file("toolchains/load_toolchains.bzl", "def load_toolchains():\n    pass")

create_null_repository = repository_rule(
    implementation = create_null_repository_impl,
    configure = True,
    attrs = {
        "sanitized_repo_name": attr.string(mandatory = True),
    },
)

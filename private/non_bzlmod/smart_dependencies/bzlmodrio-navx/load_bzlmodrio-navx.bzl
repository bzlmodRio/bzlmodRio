load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_navx(version):
    if version == None:
        print("Not using bzlmodrio-navx")
        create_null_repository(
            name = "bzlmodrio-navx",
            sanitized_repo_name = "bzlmodrio_navx",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-navx")
        native.local_repository(
            name = "bzlmodrio-navx",
            path = "../../libraries/bzlmodRio-navx",
        )
        return
    elif version == "2023.0.0":
        sha = "758acac8ab1fdf9b610360d4196e91f0f6ff41e11e753593e551582595ac4b5c"
    elif version == "2023.0.1":
        sha = "d6378138a3b6e44d1a3760e62699ad50eedea585e83928b53cfaa19ca34dfba8"
    elif version == "2023.0.2":
        sha = "23692cb7c1328753e9c344fe060fd2291fb321e691713c0f248de46c76d55e24"
    elif version == "2023.0.3":
        sha = "b613031755021dec5a40eb693c65de2e607e608efd578c8184f29151c8209b37"
    else:
        fail("Unsupported version {}".format(version))

    http_archive(
        name = "bzlmodrio-navx",
        sha256 = sha,
        strip_prefix = "bzlmodRio-navx-{}".format(version),
        url = "https://github.com/bzlmodRio/bzlmodRio-navx/archive/refs/tags/{}.tar.gz".format(version),
    )

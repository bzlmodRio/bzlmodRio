load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//private/non_bzlmod:create_null_repository.bzl", "create_null_repository")

def load_bzlmodrio_phoenix6(version, local_monorepo_base):
    if native.existing_rule("bzlmodrio-phoenix6"):
        print("Repo bzlmodrio-phoenix6 has already been defined")
        return

    if version == None:
        create_null_repository(
            name = "bzlmodrio-phoenix6",
            sanitized_repo_name = "bzlmodrio_phoenix6",
        )
        return

    if version == "local":
        print("Using local bzlmodrio-phoenix6")
        native.local_repository(
            name = "bzlmodrio-phoenix6",
            path = local_monorepo_base + "/libraries/bzlmodRio-phoenix6",
        )
        return
    elif version == "24.0.0-beta-1":
        sha = "4b67c794f7e89ed3fc4ecebbd7c4c0382f5b0c2d25c688d4b61df15175c71c95"
    elif version == "24.0.0-beta-2":
        sha = "521207d510f193bd6072cb29570a166c76c97de93715ceb90976c4ce0b4ad347"
    elif version == "24.0.0-beta-3":
        sha = "60a1c0637058ffd477091748283903a3073b534c4322dc66f8ff304753f222b1"
    elif version == "24.0.0-beta-4":
        sha = "0b4e5800b557b1318a8694dfd4217a9dbcf2da55728b417b68cb222b6d4741fb"
    elif version == "24.0.0-beta-5":
        sha = "98324084978f6ca6bde98f48302e46a2c457a7e89caee8417d3b07cabc665c2a"
    elif version == "24.0.0-beta-7":
        sha = "b12fa56b6bc7c9ddad14f89b60959df7b9db77f3f8905cead3bff56fe17e09e3"
    elif version == "24.0.0-beta-8":
        sha = "26a924d0cffd694b4fc1d849f7da9de7bf24808173c013ae69e8252202cac96e"
    elif version == "24.1.0":
        sha = "13793b4d5dff4a15e63e65a7be417ea3212fff609373deb994533c0ed2341082"
    elif version == "24.2.0":
        sha = "6bd6fb6055fbedc39830ff256d54c8ef41ee4bd97e64c1835bf9ee7595903170"
    elif version == "24.3.0":
        sha = "932ff6f942cd429cc9493828eb7beb5180b70da19a29f27ec755c59bbea8fd73"
    elif version == "25.0.0-beta-2":
        sha = "086d2ada6b8d55dea048944d4e2ebd38afe3b0a231afc9f4d1df3d9ec3fa8301"
    elif version == "25.0.0-beta-3":
        sha = "35d8d8c77cd7b24301f507001352cc5c5636bfd2885301bcd4fb017b2ebe752b"
    elif version == "25.0.0-beta-4":
        sha = "074a98e8fdce18dbf968161750bbfd55c7362a43ade78597a6355da2e3781974"
    elif version == "25.1.0":
        sha = "480f258196c1d8d9bb1b77d4d240e0ff13d102c128db217375c2869b0d52c645"
    elif version == "25.2.0":
        sha = "233cfab6cbc3facf85ea8490d00ae2438d1763f95de864376606e8d903b6d576"
    elif version == "25.2.1":
        sha = "ee04ad8933c3e9340f490692217ffe963f9f5b99e51152189d1ab01b0ae4b2e2"
    elif version == "25.2.2":
        sha = "d515d881b6a3473a4d1101036fa8ebe17d4611370a09c75b9bdc532c999aadd9"
    elif version == "25.3.1":
        sha = "8716689afd248e16a0f820b0a59ef0f33bb2edc80aaa353872e4661c3a85e4ff"
    elif version == "25.3.2":
        sha = "c982c6cb49968a4cfcbad8f34e4220cc0d498542deaf0bded75c5aecd31b62a1"
    elif version == "25.4.0":
        sha = "30afcb65803ba71192993537b762fa8a04741ee0328c42a0cb3eccbe2324af9e"
    elif version == "26.0.0-beta-1":
        sha = "910c3fdbc019a5611a11acd08fca47ed803b743771c9bb2c5d88d2633eae207f"
    elif version == "26.1.0":
        sha = "dd275004dc2225d2dd0087467d34a00d24beb7cf014d863fa3fb852c47aa6203"
    else:
        fail("Unsupported version {}".format(version))

    maybe(
        http_archive,
        name = "bzlmodrio-phoenix6",
        sha256 = sha,
        url = "https://github.com/bzlmodRio/bzlmodRio-phoenix6/releases/download/{}/bzlmodRio-phoenix6-{}.tar.gz".format(version, version),
    )

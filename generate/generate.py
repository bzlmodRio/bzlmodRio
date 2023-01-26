import os

import yaml
from bazelrio_gentool.utils import render_template
from bazelrio_gentool.load_cached_versions import load_cached_versions
from get_libraries import get_libraries

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

class Repo:
    def __init__(self, repo, version_infos):
        self.repo = repo
        self.version_infos = version_infos


def write_library_alias(libraries):
    template_file = os.path.join(SCRIPT_DIR, "templates", "library_alias.jinja2")
    library_dir = os.path.join(SCRIPT_DIR, "..", "libraries")
    
    for lib in libraries:
        output_file = os.path.join(library_dir, lib.subfolder, "BUILD")
        render_template(template_file, output_file, lib=lib)


    # render_template(template_file, json_file, group=group, module_bazel_file=module_bazel_file, hash=hash)



def write_repo_loads():
    repos = []
    cached_versions = load_cached_versions()

    for r in cached_versions:
        version_infos = []
        for v in cached_versions[r]:
            version_infos.append(v)
        repos.append(Repo(r, version_infos))

    # for repo in repos:
    #     dir = os.path.join(
    #         "/home/pjreiniger/git/bzlmodRio/bzlmodRio/private/non_bzlmod/smart_dependencies",
    #         repo.repo,
    #     )
    #     if not os.path.exists(dir):
    #         os.makedirs(dir)
    #     with open(os.path.join(dir, "BUILD"), "w") as f:
    #         f.write("")


def main():
    write_library_alias(get_libraries())
    write_repo_loads()



if __name__ == "__main__":
    """
    bazel run @bazelrio//generate
    """
    main()


from bazelrio_gentool.load_cached_versions import load_cached_versions

def load_repos():
    repos = []
    
    cached_versions = load_cached_versions()

    for repo, repo_info in cached_versions.items():
        if repo != "bzlmodrio":
            repos.append((repo, repo_info))

    return repos
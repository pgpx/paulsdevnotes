# Git Remotes

Update git remote refs: `git remote update`

Get the ref of a remote branch ([SO](https://stackoverflow.com/a/3278427/125246)): `git rev-parse origin/mybranch`

* Can compare that with `git rev-parse HEAD`

Get the remote for the current branch (error if there is no remote) ([SO](https://stackoverflow.com/a/12538667/125246)):

```bash
% git rev-parse --abbrev-ref --symbolic-full-name @{u}
origin/main

# or (empty and still exit=0 if no remote)
% git for-each-ref --format='%(upstream:short)' "$(git symbolic-ref -q HEAD)"
```

## Change a remote

```bash
git remote set-url origin https://new-repo-url.git
git push --all
git push --tags
```
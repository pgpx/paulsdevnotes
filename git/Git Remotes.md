# Git Remotes

Update git remote refs: `git remote update`

Get the ref of a remote branch ([SO](https://stackoverflow.com/a/3278427/125246)): `git rev-parse origin/mybranch`

* Can compare that with `git rev-parse HEAD`

## Change a remote

```bash
git remote set-url origin https://new-repo-url.git
git push --all
git push --tags
```
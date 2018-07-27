# Git Branches

Show the current branch ([SO](https://stackoverflow.com/a/12142066/125246), [SO](https://stackoverflow.com/a/1418022/125246))

```bash
git rev-parse --abbrev-ref HEAD
```


* Move a branch to a new commit ([SO](https://stackoverflow.com/a/5471197/125246)):

```sh
git branch -f branch-name new-tip-commit
```
# Git Branches

Show the current branch ([SO](https://stackoverflow.com/a/12142066/125246), [SO](https://stackoverflow.com/a/1418022/125246))

```bash
git rev-parse --abbrev-ref HEAD
```


* Move a branch to a new commit ([SO](https://stackoverflow.com/a/5471197/125246)):

```sh
git branch -f branch-name new-tip-commit
```

* Delete branches that have been removed on the remote ([SO](https://stackoverflow.com/a/38404202/125246))

    ```bash
    git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d
    ```
    
    But maybe the following in case you are on a branch that has been deleted (in which case the leading `*` on git branch might be treated as a branch wildcard, though probably not):
    
    ```bash
    git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -d
    ```
    
    Might also need a trailing `-D` to force the deletes.
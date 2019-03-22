# Git Rerere

* [Man page](https://git-scm.com/docs/git-rerere)
* [Git rebase](https://git-scm.com/docs/git-rebase)
* [Git Tools - Rerere](https://git-scm.com/book/en/v2/Git-Tools-Rerere), [Git Tools - Rewriting History](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History)

## Articles

* [Do you even rerere?](https://blog.theodo.fr/2015/01/do-you-even-rerere/)
* <https://blog.theodo.fr/2015/01/do-you-even-rerere/> - Good article, shows the use of [rerere-train](https://github.com/git/git/blob/master/contrib/rerere-train.sh)
* [Fix conflicts only once with git rerere](https://medium.com/@porteneuve/fix-conflicts-only-once-with-git-rerere-7d116b2cec67)
* [How do I swap the order of two parents of a Git commit?](https://stackoverflow.com/questions/25265528/how-do-i-swap-the-order-of-two-parents-of-a-git-commit)
* [Change direction of git merge (after the merge is done)](https://stackoverflow.com/questions/43256438/change-direction-of-git-merge-after-the-merge-is-done)
* [Fun with Git rerere](https://gitster.livejournal.com/41795.html)
* [Are there any downsides to enabling git rerere?](Are there any downsides to enabling git rerere?)
* [Git Pitchfork Branch Structure](https://gist.github.com/dkaminski/c8e59221bea74ab1fea615a468e3f4cf)

## Commands

* Enable

    ```bash
    git config rerere.enabled true --global
    ```

* Learn all existing merge conflicts using [rerere-train.sh](https://github.com/git/git/blob/master/contrib/rerere-train.sh:

    ```bash
    /usr/local/Cellar/git/2.21.0/share/git-core/contrib/rerere-train.sh --all
    ``` 

* Delete all `git rerere` resolutions: ([SO](https://stackoverflow.com/a/21635422/125246))

    ```bash
    rm -rf .git/rr-cache
    ```
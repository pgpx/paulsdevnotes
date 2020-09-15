# Git - Copying submodle into main

* <https://saintgimp.org/2013/01/22/merging-two-git-repositories-into-one-repository-without-losing-file-history/>
* <https://stackoverflow.com/questions/1425892/how-do-you-merge-two-git-repositories>
* <https://stackoverflow.com/questions/37937984/git-refusing-to-merge-unrelated-histories>

From [SO](https://stackoverflow.com/a/10548919/125246)

1. Move files in one of the projects to a subdirectory so that they don't clash (simplifies the merge a lot):

    * Install `git-filter-repo` (e.g. `brew install git-filter-repo`)
    * Must make a fresh clone of your repo and `cd` into it.
    * `git filter-repo --to-subdirectory-filter my-project-a`

2. Clone the `source` and `target` repos and then perform the merge

    ```bash
    cd target
    git remote add source path/to/source
    git fetch source --tags
    git merge --allow-unrelated-histories source/main # or whichever branch you want to merge
    git remote remove source
    ```

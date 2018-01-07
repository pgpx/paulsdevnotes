# Git - Copying submodle into main

* <https://saintgimp.org/2013/01/22/merging-two-git-repositories-into-one-repository-without-losing-file-history/>
* <https://stackoverflow.com/questions/1425892/how-do-you-merge-two-git-repositories>
* <https://stackoverflow.com/questions/37937984/git-refusing-to-merge-unrelated-histories>

1. Clone the module to merge into a new directory, and checkout the branch to merge.

    * Optionally prune the directory tree, e.g.
    
        ```bash
        git filter-branch --tree-filter \
          "find src/ -mindepth 1 -maxdepth 1 \! \( -name 'main' -o -name 'test' \) -exec rm -rf '{}' \;" \
          --prune-empty HEAD
        ```
    
2. `git mv` all of the files in the root to a new subdirectory (e.g. `libs/mymodule`) so that they won't conflict with any files in the target (including `.gitignore`)

    ```bash
    find . -depth 1 ! -name '.git' ! -name 'libs' -print0 | xargs -0 -I {} git mv "{}" libs/smart-ebdc-shared/
    ```
3. Commit the moved files: `git commit -m 'Moved to libs'`
4. Rename tags (so that they don't conflict with those in the target):
    ```bash
    # Need to use gsed on a Mac (brew install gnu-sed)
    git filter-branch --tag-name-filter 'gsed -E "s/(.*)$/mymodule-\1/"' \
        --prune-empty -- --all
     
    # And delete the old tags
    git tag | grep -v 'mymodule' | xargs git tag --delete
    ```
5. `git clone` the target repository, and `git checkout develop` into the correct branch.
6. Add the modules repository as a remote: `git remote add mymodule ../mymodule`
7. Pull and merge with unrelated histories (to allow the subsequent merge to work): `git pull mymodule develop --allow-unrelated-histories --tags`

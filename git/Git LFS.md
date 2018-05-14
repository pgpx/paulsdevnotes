# Git LFS

Manage large files outside of the main Git repo

* [Tutorial](https://github.com/git-lfs/git-lfs/wiki/Tutorial)
* [git lfs config](https://github.com/git-lfs/git-lfs/blob/master/docs/man/git-lfs-config.5.ronn)

## Installation

* https://help.github.com/articles/installing-git-large-file-storage/

```bash
brew install git-lfs
```

## Commands

```bash
git lfs clone <repo>
git lfs pull
```

## FileLocking

* https://github.com/git-lfs/git-lfs/wiki/File-Locking

## Migrate an existing repository to use LFS

* https://github.com/bozaro/git-lfs-migrate

```bash
java -jar git-lfs-migrate.jar \
     -s git-lfs-migrate.git \
     -d git-lfs-migrate-converted.git \
     -g git@github.com:bozaro/git-lfs-migrate-converted.git \
     "*.md" \
     "*.jar"
 ```
 
 Note that the version 0.2.5 of this tool has a bug whereby spaces in patterns are not correctly handled, so use wildcards (*) instead of each space. 

## Identifying large files ()that need to be added to Git LFS)

* https://stackoverflow.com/a/42544963/125246

```bash
git rev-list --objects --all \
| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
| awk '/^blob/ {print substr($0,6)}' \
| sort --numeric-sort --key=2 \
| cut --complement --characters=13-40 \
| numfmt --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
```

Mac users can either brew install coreutils and replace cut with gcut and numfmt with gnumfmt or just omit the last two lines which results in Output for Computers.

## Don't download some LFS files automatically after a clone

Exclude some files ([related GitHub issue](https://github.com/git-lfs/git-lfs/issues/950) and [GitLab issue](https://gitlab.com/gitlab-org/gitlab-ce/issues/44993)):

```bash
git config -f .lfsconfig 'My directory'
git add .lfsconfig
```

Pull all LFS files later ([related GitHub issue](https://github.com/git-lfs/git-lfs/issues/1249)):

```bash
# -X means temporarily set lfs.fetchexclude
git lfs pull -X ""
```

## Properly mirror an LFS repo

* [GitHUB](https://help.github.com/enterprise/2.8/user/articles/duplicating-a-repository/#mirroring-a-repository-that-contains-git-large-file-storage-objects) - [SO](https://stackoverflow.com/a/41789052/125246)

```bash
git clone --bare https://hostname/exampleuser/old-repository.git
cd old-repository.git
git lfs fetch --all

# Might need to swap the next 2 steps
git push --mirror https://hostname/exampleuser/new-repository.git
git lfs push --all https://github.com/exampleuser/new-repository.git
```

## Remove LFS from a repo

Use filter-branch to remove the lfs-related files (index-filter is faster than tree-filter, but you can't use find because the repo is not checked out) ([ref](https://git-scm.com/docs/git-filter-branch#_examples)):

```bash
git filter-branch --index-filter '
          git rm -q --cached --ignore-unmatch -rf data
          git rm -q --cached --ignore-unmatch -rf .gitattributes
          git rm -q --cached --ignore-unmatch -rf .lfsconfig
          ' --prune-empty --tag-name-filter cat -- --all
```

Cleanup unused refs ([Checklist for Shrinking a Repository](https://git-scm.com/docs/git-filter-branch#_checklist_for_shrinking_a_repository), though could also use [BFG Repo-Cleaner](https://rtyley.github.io/bfg-repo-cleaner/)):

```bash
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
git reflog expire --expire=now --all
git gc --prune=now

```

* Or ([SO](https://stackoverflow.com/a/14728706/125246)):
    
    ```bash
    git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 -c gc.rerereresolved=0 \
        -c gc.rerereunresolved=0 -c gc.pruneExpire=now gc "$@"
    ```

Uninstall LFS (locally) and delete the lfs directory:

```bash
rm -rf lfs

# And remove [lfs] entries from config
```

* <https://github.com/git-lfs/git-lfs/issues/326#issuecomment-105130763>
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
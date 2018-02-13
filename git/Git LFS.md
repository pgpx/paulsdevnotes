# Git LFS

Manage large files outside of the main Git repo

* [Tutorial](https://github.com/git-lfs/git-lfs/wiki/Tutorial)

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


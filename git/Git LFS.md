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

* <https://github.com/git-lfs/git-lfs/blob/main/docs/man/git-lfs-migrate.adoc>

I had a quick play (with some help from ChatGPT) and can re-write the history so that it is very small.

0. Create a forked backup of the repo in GitLab!!
1. Clone the git repo to a new directory & then cd into it
2. Checkout each branch (so that `--everything` flags work below):

```bash
git for-each-ref --format='%(refname:short)' refs/remotes/origin/ \
| grep -v '^origin/HEAD$' \
| while read -r rb; do
    lb="${rb#origin/}"
    git show-ref --verify --quiet "refs/heads/$lb" \
      && git branch -f "$lb" "$rb" \
      || git branch --track "$lb" "$rb"
  done
```

3. Install [git-sizer](https://github.com/github/git-sizer): `brew install git-sizer`
4. Run git-sizer to find the largest blob files (that haven't been added to LFS) - not that `Blobs - total size` is the size of all non-LFS files:

```bash
% git-sizer -v --no-remotes
Processing blobs: 2852                        
Processing trees: 4909                        
Processing commits: 1384                        
Matching commits to trees: 1384                        
Processing annotated tags: 32                        
Processing references: 170                        
| Name                         | Value     | Level of concern               |
| ---------------------------- | --------- | ------------------------------ |
| Overall repository size      |           |                                |
| * Commits                    |           |                                |
|   * Count                    |  1.38 k   |                                |
|   * Total size               |   424 KiB |                                |
| * Trees                      |           |                                |
|   * Count                    |  4.91 k   |                                |
|   * Total size               |  1.83 MiB |                                |
|   * Total tree entries       |  49.1 k   |                                |
| * Blobs                      |           |                                |
|   * Count                    |  2.85 k   |                                |
|   * Total size               |   570 MiB |                                |
| * Annotated tags             |           |                                |
|   * Count                    |    32     |                                |
| * References                 |           |                                |
|   * Count                    |   170     |                                |
|     * Branches               |    69     |                                |
|     * Tags                   |    32     |                                |
|     * Remote-tracking refs   |    69     |                                |
|                              |           |                                |
| Biggest objects              |           |                                |
| * Commits                    |           |                                |
|   * Maximum size         [1] |  1.32 KiB |                                |
|   * Maximum parents      [2] |     2     |                                |
| * Trees                      |           |                                |
|   * Maximum entries      [3] |    40     |                                |
| * Blobs                      |           |                                |
|   * Maximum size         [4] |   347 MiB | !!!!!!!!!!!!!!!!!!!!!!!!!!!!!! |
|                              |           |                                |
| History structure            |           |                                |
| * Maximum history depth      |   646     |                                |
| * Maximum tag depth      [5] |     1     |                                |
|                              |           |                                |
| Biggest checkouts            |           |                                |
| * Number of directories  [6] |    99     |                                |
| * Maximum path depth     [7] |    11     | *                              |
| * Maximum path length    [8] |   110 B   | *                              |
| * Number of files        [6] |   375     |                                |
| * Total size of files    [9] |   348 MiB |                                |
| * Number of symlinks    [10] |     3     |                                |
| * Number of submodules       |     0     |                                |

[1]  9e062c43b42b2507477cc2f836c0ce83ae11a340
[2]  0101332d1ef8a1acb2170b74c94fcfdc07a707f9 (refs/heads/main)
[3]  1d674cbc577fa72049441a1bd9c0b691e4bb6fc8 (a27aa79ae87444e5373bd3d1ab994f284e629fb0:webapp/public/GalleryImages)
[4]  df98a51684f697ae6ead9b968d9198c497867f10 (refs/heads/InpaintAdd:U3v1-main_3_.zip)
[5]  4558936bdef2ce1d5461ab5c596249c8281af0ec (refs/tags/v0.0.1)
[6]  d59673e5fc099c2647d68da413c11eac38b1b248 (355bd8aafdee4e83877bb6b0b3dee58317973f28^{tree})
[7]  c7f8a92a328edc3b1fd81f1ff59fb4de19fc5e35 (refs/heads/return-schemas^{tree})
[8]  be501d6d3c828c0ae9b86c62304dc56876b231fb (a27aa79ae87444e5373bd3d1ab994f284e629fb0^{tree})
[9]  548b8952ddece6cd8d15d23607cab5fe9ed9e12c (refs/heads/InpaintAdd^{tree})
[10] 162a6322ce6f004237201ca841bc1448f664d8f3 (refs/heads/rateLimiterPy:server/myenv/bin)
```

4. Blob `[4]` is a file that could be added to LFS, might might as well add all `*.zip` files (since they are not diff-able):

```bash
git lfs migrate import --include="**/*.zip" --everything
```

5. Re-run `git-sizer -v --no-remotes` and see that `server/checkpoints/sam/sam2.1_hiera_small.pt` is 176 MiB, so add `server/checkpoints/**.pt` to LFS:

```bash
git lfs migrate import --include="server/checkpoints/**/*.pt" --everything
```

6. Re-run `git-sizer -v --no-remotes` and see that the max blob size is only 257KiB.

7. Rewrite the git history to make sure that all of the LFS file patterns in .gitattributes have been applied to the complete history:

```bash
export INCLUDE=$(awk '$0 !~ /^#/ && $0 ~ /filter=lfs/ {print $1}' .gitattributes | paste -sd, -)
git lfs migrate import --include="$INCLUDE" --everything
```

8. Re-run `git-sizer -v --no-remotes` and see that the Blobs total size is now 47.1 MiB, down from 570 MiB originally!
9. Then force-push everything to the repo:

```bash
git push --force --all origin
git push --force --tags origin
git lfs push --all origin
```


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
# Git Mirroring

* https://help.github.com/articles/duplicating-a-repository/
* http://blog.plataformatec.com.br/2013/05/how-to-properly-mirror-a-git-repository/

## Mirror a repository and keep it up-to-date:

```bash
git clone --mirror https://github.com/exampleuser/repository-to-mirror.git

# Set the push location to your mirror.
cd repository-to-mirror.git
git remote set-url --push origin https://github.com/exampleuser/mirrored

# Ignore refs that are not tags or branches (e.g. GitLab refs/merge-requests)
# http://christoph.ruegg.name/blog/git-howto-mirror-a-github-repository-without-pull-refs.html
git config --replace-all remote.origin.fetch +refs/heads/*:refs/heads/*
git config --add remote.origin.fetch +refs/tags/*:refs/tags/*
git config --add remote.origin.push +refs/heads/*:refs/heads/*
git config --add remote.origin.push +refs/tags/*:refs/tags/*

# Later fetch from the original repo and push to the new one
git fetch -p origin
git fsck && git push --mirror
```

* `git config -e` allows the Git config to be edit directly ([man](https://git-scm.com/docs/git-config))
* `git show-ref` to list all of the Git refs

Use `--mirror` instead of `--bare` because it tracks Git notes, etc. 

## If push --mirror fails on GitLab

Might be due to a bug: https://gitlab.com/gitlab-org/gitlab-ce/issues/41022

So push each ref individually (adapted from https://gitlab.com/gitlab-org/gitlab-ce/issues/41022#note_55696539):

```bash
git remote set-url origin "$TARGET_REPO"    # Probably not needed
git config --replace-all remote.origin.mirror false # Otherwise errors
for REF in $(git show-ref |\
    sed 's|.*refs/heads/\(.*\)|\1|' | \
    sed 's|.*refs/tags/\(.*\)|\1|'); \
    do git push --force origin ${REF}; done
```

## Issues with --mirror

Use `git fsck` to check the integrity of a mirror!

* http://web.archive.org/web/20130326122719/http://jefferai.org/2013/03/24/screw-the-mirrors/
* http://web.archive.org/web/20130326115327/http://jefferai.org:80/2013/03/24/too-perfect-a-mirror/

## [Mirroring a repository that contains Git Large File Storage objects](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/duplicating-a-repository#mirroring-a-repository-that-contains-git-large-file-storage-objects)

```bash
git clone --bare https://github.com/exampleuser/old-repository.git
cd old-repository.git
git lfs fetch --all

# Exclude a directory
git filter-repo --invert-paths --path-match 'dir-to-exclude'

# Push to new repo
git lfs push origin --all

# Pull subsequent updates
git fetch
git lfs fetch --all
```
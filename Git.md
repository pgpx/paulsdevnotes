# Git Notes

* [Homepage](https://git-scm.com/), [Docs](http://git-scm.com/docs)
* [Pro Git Book](https://git-scm.com/book/en/v2/)
* [Blog](https://git-scm.com/blog)
* [Git Magic](http://www-cs-students.stanford.edu/~blynn/gitmagic/) - tips / FAQs.
* [Git - Reset Demystified](https://git-scm.com/blog/2011/07/11/reset.html)
* <http://stackoverflow.com/questions/1800783/compare-local-git-branch-with-remote-branch>
* <http://git-scm.com/book/en/Git-Branching-Remote-Branches>

## Useful commands
```bash
# Get changes from remote repository, and replay local commits onto it (at the end) - rebasing:
git pull --rebase

# Look at changes on remote server branch:
git log origin/develop

# Look at local status
git status

# List of local and remote branches:
git diff -a

# Fetch changes from remote repository into local copy of remote repository
git fetch -v

# Clone a repository
git clone <repository address>

git branch develop
git push -u origin develop

# Look at a local repo's config, including where origin is mapped to.
cat .git/config

# Create a remote tracking branch
git checkout --track origin/develop

# http://www.kernel.org/pub/software/scm/git/docs/gitignore.html
# Ignore a file - Add file to .gitignore (which can be in any path, and then filenames are relative to that).

git branch --list          # show branches
git branch <branch-name>   # Create a branch
git checkout <branch-name> # Change to a branch

# Can potentially squash / rename all un-pushed commits
# http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html
git rebase -i <Last-commit-to-keep-as-is>

# Add to the previous commit (all staged)
# https://lostechies.com/derickbailey/2010/06/09/git-oops-i-forgot-to-add-those-new-files-before-committing/
git commit --amend -C HEAD

# Push to remote
git remote add origin git@gitlab.cms.tdev2.t-motion.co.uk:ebdc/henry-ee.git
git push -u origin --all   (-u set upstream tracking ref on every branch pushed)
git push -u origin --tags

# Push selected changes to remote (not all)
git push origin a7d640c4bc732826a2d074d2ef18371b34ae9306:develop

# Unstage a change (leave the change on the filesystem, but take it out of the staging area that will get committed with the next commit)
# http://stackoverflow.com/a/1505968/125246
git reset HEAD <file>

# GC
git gc --aggressive

git filter-branch --prune-empty --subdirectory-filter save 

git remote rm origin
git remote add origin https://github.com/pgpx/tis-100-solutions.git
git branch -vv
git branch --set-upstream-to=origin/master master

git remote add origin https://github.com/pgpx/tis-100-solutions.git
git branch --set-upstream-to=origin/master master
git fetch

# http://dereenigne.org/git/set-git-email-address-on-a-per-repository-basis
# http://schacon.github.io/git/git-filter-branch.html
git filter-branch -f --env-filter "GIT_AUTHOR_EMAIL='paul.martin@gmail.com'; GIT_COMMITTER_EMAIL='paul.martin@gmail.com';" -- --all
```

### Stash
```bash
git stash      # temporarily save local changes so they can be retrieved later
git stash pop  # reapply stashed changes and remove from stash
git stash drop # delete stashed change
git stash list # List stashes
git stash branch "branch-name" "stash@{0}"  # Create a branch from a named stash
```

## Tips

* [Undo a commit and redo](http://stackoverflow.com/a/927386/125246)

* Output the contents of a single file from a remote repo [SO](http://stackoverflow.com/a/18331440/125246)
```bash
FILE="my/filename.txt" && git archive --remote=git@myremote.co.uk/repo/name.git \
    HEAD "$FILE" | tar -xO "$FILE"
```

* [Rebase a commit (that wasn't pushed)](http://stackoverflow.com/a/846091/125246)
```bash
# Reset to the commit before the merge
git reset --hard HEAD^  # Maybe --hard to delete files?

# Get the latest contents from the remote
git fetch

# Rebase the commit
git rebase origin/master
```

## Remote management

Remote all references to remotes from a clone:
```bash
git remote remove origin
```

Push to an origin server

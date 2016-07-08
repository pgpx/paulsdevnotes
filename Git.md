# Git Notes

* [Homepage](https://git-scm.com/), [Docs](http://git-scm.com/docs)
* [Pro Git Book](https://git-scm.com/book/en/v2/)
* [Blog](https://git-scm.com/blog)
* [Git Magic](http://www-cs-students.stanford.edu/~blynn/gitmagic/) - tips / FAQs.
* [Git - Reset Demystified](https://git-scm.com/blog/2011/07/11/reset.html)
* <http://stackoverflow.com/questions/1800783/compare-local-git-branch-with-remote-branch>
* <http://git-scm.com/book/en/Git-Branching-Remote-Branches>
* [SVN-Git Cheat Sheet](https://www.cs.bath.ac.uk/~jjb/web/svn.html)
* [Git Conventions](https://medium.com/@tjholowaychuk/git-conventions-a940ee20862d)
* [Squashing commits with rebase](http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html)
* [Git team workflows: merge or rebase?](https://www.atlassian.com/git/articles/git-team-workflows-merge-or-rebase/)
* From <https://github.com/sindresorhus/awesome#developer-environment>:
  * [Git Cheat Sheet](https://github.com/arslanbilal/git-cheat-sheet)
  * [Git Tips](https://github.com/git-tips/tips)
  * [Git Addons](https://github.com/stevemao/awesome-git-addons)

## Read later

* <http://rnelson0.com/2015/05/01/preventing-git-astrophe-judicious-use-of-the-force-flag/>
* <http://www.gitguys.com/topics/creating-and-playing-with-branches/>

## Concepts

* `HEAD` is the name given to commit from which the working tree's current state was initialised (often a branch, but can be a detached head) [SO](http://stackoverflow.com/a/2304106/125246)

## Useful commands
```bash
# Get changes from remote repository, and replay local commits onto it (at the end) - rebasing:
git pull --rebase

# Look at changes on remote server branch:
git log origin/develop

# Look at local status
git status

# Hash of the current commit - http://stackoverflow.com/a/949391/125246
git rev-parse HEAD

# URL of the origin remote - http://stackoverflow.com/a/4089452/125246
git config --get remote.origin.url
# http://stackoverflow.com/a/32991784/125246
git remote get-url origin # For Git >= 2.7

# Timestamp of the latest commit - http://stackoverflow.com/a/3815007/125246
git show -s --format=%ci HEAD
# or author commit (when the commit first happened, ignoring merges)
git show -s --format=%ai HEAD

# List files modified as part of the commit - http://stackoverflow.com/a/424142/125246
git show --pretty="" --name-only bd61ad98

# or
git diff-tree --no-commit-id --name-only -r bd61ad98

# List of local and remote branches:
git diff -a

git branch develop

# Look at a local repo's config, including where origin is mapped to.
cat .git/config

# Create a remote tracking branch
git checkout --track origin/develop

# http://www.kernel.org/pub/software/scm/git/docs/gitignore.html
# Ignore a file - Add file to .gitignore (which can be in any path, and then filenames are relative to that).

git branch --list          # show branches
git branch <branch-name>   # Create a branch
git checkout <branch-name> # Change to a branch
git checkout [revision] .  # Change to a revision and see differences as modified files [SO](http://stackoverflow.com/a/2007704/125246)
git checkout [revision]    # Change to a revision as a detached head

# Can potentially squash / rename all un-pushed commits
# http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html
git rebase -i <Last-commit-to-keep-as-is>

# Add to the previous commit (all staged)
# https://lostechies.com/derickbailey/2010/06/09/git-oops-i-forgot-to-add-those-new-files-before-committing/
git commit --amend -C HEAD


# Unstage a change (leave the change on the filesystem, but take it out of the staging area that will get committed with the next commit)
# http://stackoverflow.com/a/1505968/125246
git reset HEAD <file>

# GC
git gc --aggressive

git filter-branch --prune-empty --subdirectory-filter save 

# http://dereenigne.org/git/set-git-email-address-on-a-per-repository-basis
# http://schacon.github.io/git/git-filter-branch.html
git filter-branch -f --env-filter "GIT_AUTHOR_EMAIL='paul.martin@gmail.com'; GIT_COMMITTER_EMAIL='paul.martin@gmail.com';" -- --all
```

Show file change [`log`](https://git-scm.com/docs/git-log) (following renames/moves) ([SO](http://stackoverflow.com/a/4303877/125246)):

```bash
git log --follow some_file.cpp
```

[rm](http://git-scm.com/docs/git-rm)
```sh
# Remove a file from Git, but keep the local file unchanged
git rm --cached myfile
```

Revert an uncommitted change to a file ([ref](http://www.norbauer.com/rails-consulting/notes/git-revert-reset-a-single-file.html))
```bash
# Checkout from HEAD, overwriting change
# Use -- to avoid accidentally checking out a branch with the same name
git checkout -- filename
```

Squash the last un-pushed 2 commits together ([ref](http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html))

```bash
git rebase -i HEAD~2

# Then change squash to pick for the 2nd commit, save,
# then #-out the second comment, save again.
```

Use [`archive`](https://git-scm.com/docs/git-archive) to extract the files from a revision as a tar.gz (instead of cloning the whole repository) ([SO])(http://stackoverflow.com/a/2467629/125246)

```sh
# Only get the files in subdir from a tag
git archive --format=tar.gz --output=extract.tar.gz --remote=git@my-git-remote.com:my-repo.git refs/tags/my-tag subdir

# Only get the files in subdir from a branch
git archive --format=tar.gz --output=extract.tar.gz --remote=git@my-git-remote.com:my-repo.git refs/heads/my-branch subdir
```

Metadata about the last commit ([SO](http://stackoverflow.com/a/7293026/125246))

```sh
# Commit message subject (before the blank line in the message)
git log -1 --pretty=%s

# Author (in the format: Name <email-address>)
git log -1 --pretty='%an <%ae>'
```

### [Stash](http://git-scm.com/docs/git-stash)
```bash
git stash      # temporarily save local changes so they can be retrieved later
git stash pop  # reapply stashed changes and remove from stash
git stash drop # delete stashed change
git stash list # List stashes
git stash branch "branch-name" "stash@{0}"  # Create a branch from a named stash
```

## Setup/config

Set your username and email ([ref](https://help.github.com/articles/setting-your-email-in-git/))
```sh
# Set email and username
git config user.email "your_email@example.com"
git config user.name "Your Name"

# (also check that GIT_COMMITTER_EMAIL or GIT_AUTHOR_EMAIL environment variables are not set)

# Set globally
git config --global user.email "your_email@example.com"
git config --global user.name "Your Name"

# Get (to check)
git config user.email
git config user.name

# View all settings
git config --list
```

## Branches

Change the commit that a branch points to (to an earlier one) ([SO](http://stackoverflow.com/a/7310222/125246))

```sh
git checkout some-other-branch
git branch -f my-branch my-rev
# Have to force-push the branch!
git push -f origin my-branch
git checkout my-branch
```

Show the current branch ([SO](http://stackoverflow.com/a/1418022/125246))

``sh
git rev-parse --abbrev-ref HEAD
```

## Tags

Delete a (remote) tag ([ref])(https://nathanhoad.net/how-to-delete-a-remote-git-tag))

```sh
git tag -d 12345
git push origin :refs/tags/12345

# Fetch tags
git fetch --tags

# Does a Git tag exist?
# http://stackoverflow.com/a/36942600/125246
if git rev-parse -q --verify "refs/tags/${TAG}" >/dev/null; then
```

## Tips

* [Undo a commit and redo](http://stackoverflow.com/a/927386/125246)

* Undo a public commit ([SO](http://stackoverflow.com/a/6376039/125246))
```bash
git revert HEAD
```

* Output the contents of a single file from a remote repo [SO](http://stackoverflow.com/a/18331440/125246)
```bash
FILE="my/filename.txt" && git archive --remote=git@myremote.co.uk/repo/name.git \
    HEAD "$FILE" | tar -xO "$FILE"
```

* [Rebase a commit (that wasn't pushed)](http://stackoverflow.com/a/846091/125246) and ([SO](http://stackoverflow.com/a/927386/125246))
```bash

# Reset to the last commit
git reset --hard; 

# Reset to the commit before the merge
git reset --hard HEAD^  # Maybe --hard to delete files?

# Reset to the status of the remote [SO](http://stackoverflow.com/a/12845541/125246)
git reset --hard origin/master

# or use soft to keep changes
git reset --soft HEAD~1

# Get the latest contents from the remote
git fetch

# Rebase the commit
git rebase origin/master
```

## Remote management

Show the status of a remote (which branches are tracking) ([SO](http://serverfault.com/a/175077/126442))
```
git remote show origin
```

Configure remotes for a repo
```bash
# Add an 'origin' remote
git remote add origin https://github.com/my/myrepo.git

# Push all branches and tags (as tracking)
git push -u origin --all   (-u set upstream tracking ref on every branch pushed)
git push -u origin --tags

# Or set tracking upstream branch as a separate step after pushing branch
git push origin master
git branch --set-upstream-to=origin/master master
```

List all branches (including remotes and status)
```bash
git branch -avv
```

Remove all references to remotes from a clone:
```bash
git remote remove origin
```

Delete a remote branch [(SO)](http://stackoverflow.com/a/2003515/125246)
```bash
git push origin --delete release/4.0.6
git branch -d release/4.0.6

# Prune branches on other machines
git fetch --all --prune
```

```bash
# Fetch changes from remote repository into local copy of remote repository
git fetch -v

# Clone a repository
git clone <repository address>

# Push selected changes to remote (not all)
git push origin a7d640c4bc732826a2d074d2ef18371b34ae9306:develop
```

## [Merging](https://git-scm.com/docs/git-merge)

Merge changes from another branch (but don't autocommit, so that you can review the changes first)
```bash
git merge --no-commit my-other-branch
```

[Undoing merges](https://git-scm.com/blog/2010/03/02/undoing-merges.html)

Revert a branch (master) back to an earlier commit (`git reset` changes the branch, `--hard`

```bash
git checkout master
# Set branch to sha, also modifies index and working tree to match
git reset --hard [sha_of_earlier_commit]
```

### Tag naming convention
`vX.Y.Z` can then co-exist with branches `X.Y.Z` ([SO](http://stackoverflow.com/a/21640164/125246)) and ([SO](http://stackoverflow.com/a/21639868/125246)) 

## Maven Git plugin

* <https://github.com/ktoso/maven-git-commit-id-plugin>
 * Available in SpringBoot ([ref](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#production-ready-git-commit-information))

Can add Git commit information when filtering resources:

```xml
<!-- Generate git properties (to be used when filtering build-number.properties)
     See: https://github.com/ktoso/maven-git-commit-id-plugin -->
<plugin>
    <groupId>pl.project13.maven</groupId>
    <artifactId>git-commit-id-plugin</artifactId>
    <version>2.2.1</version>
    <executions>
        <execution>
            <goals>
                <goal>revision</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <dotGitDirectory>${project.basedir}/.git</dotGitDirectory>
        <gitDescribe>
            <always>true</always>
        </gitDescribe>
    </configuration>
</plugin>
```

And create a file that will be filtered such as:
```properties
git.tags=${git.tags}
git.branch=${git.branch}
git.dirty=${git.dirty}
git.commit.id=${git.commit.id}
git.commit.id.describe=${git.commit.id.describe}
git.commit.message.full=${git.commit.message.full}
git.commit.time=${git.commit.time}
git.closest.tag.name=${git.closest.tag.name}
git.build.time=${git.build.time}
git.build.version=${git.build.version}

```

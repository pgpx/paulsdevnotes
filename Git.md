# Git Notes

* [Homepage](https://git-scm.com/)
* [Pro Git Book](https://git-scm.com/book/en/v2/)
* [Blog](https://git-scm.com/blog)
* [Git Magic](http://www-cs-students.stanford.edu/~blynn/gitmagic/) - tips / FAQs.

## Tips

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

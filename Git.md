# Git Notes

* [Blog](https://git-scm.com/blog)

## Tips

* [Undo a commit and redo](http://stackoverflow.com/a/927386/125246)

* Output the contents of a single file from a remote repo [SO](http://stackoverflow.com/a/18331440/125246)
```bash
FILE="my/filename.txt" && git archive --remote=git@myremote.co.uk/repo/name.git \
    HEAD "$FILE" | tar -xO "$FILE"
```

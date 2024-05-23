# Git filter-repo

Remove changes made to `src/main/java/com` between the specified commits (dry-run):

Start with a bare repo:

```bash
git clone --bare <my-repo>.git
```

```bash
git filter-repo --invert-paths --path-match src/main/java/com \
  --refs develop..feature/annotations-view-update --debug --dry-run
```

Remove specified files from git history for a specific branch (does not include the `main` commit from where the branch began):

```bash
git filter-repo --path file-a-to-exclude.py --path dir-a-to-exclude/ --invert-paths \
  --refs main..feature/my-branch --dry-run
  
# Look at the changes that would be applied (without --dry-run)
opendiff filter-repo/fast-export.original filter-repo/fast-export.filtered
 
# And to push changes:
git push -u origin feature/my-branch -f
```

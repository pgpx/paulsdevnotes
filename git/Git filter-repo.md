# Git filter-repo

Remove changes made to `src/main/java/com` between the specified commits (dry-run):

```bash
git filter-repo --invert-paths --path-match src/main/java/com \
  --refs develop..feature/annotations-view-update --debug --dry-run
```
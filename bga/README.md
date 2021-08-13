# Board Game Arena

## Setup

### Sync

* <https://en.doc.boardgamearena.com/Tools_and_tips_of_BGA_Studio#File_Sync>

Use lftp and fswatch:

```bash
#!/usr/bin/env bash
TARGET=mytutorialheart/
EXCLUDE=fswatch-exclude.txt

function sync_dir() {
    # Syncs from local to remote (needs --reverse for this order)
    # --delete-excluded doesn't seem to work
    lftp sftp://1.studio.boardgamearena.com/ -e "mirror --reverse --parallel=10 --delete --delete-excluded --exclude-glob-from=lftp-exclude.txt --verbose=1 $(pwd)/ ${TARGET}; exit"
} 

export -f sync_dir
sync_dir
# Watches current directory for changes
fswatch --one-per-batch --directories -v  --recursive "$(pwd)" |  xargs -I{}  -n 1 bash -c sync_dir
```
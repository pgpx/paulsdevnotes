# Rsync

* [Man](http://linux.die.net/man/1/rsync), [Home](https://rsync.samba.org/)

## Backup ideas

* [Easy Automated Snapshot-Style Backups with Linux and Rsync](http://www.mikerubel.org/computers/rsync_snapshots/)

First backup (copy):
```sh
rsyn c-a source backup/1/
```

Backup using hardlinks if files unchanged:

```sh
rsync -a --delete --link-dest=backup/1 source/ backup/0/

# Output status (including number of links)
stat -x source/a/a1.txt
```

Prevent other users from deleting or renaming the individual backup dirs, even if they have write perms to backup (using sticky bits)
```sh
chmod +t backup
```

Make the backup directory read-only with `chmod`:
```sh
rsync -a --perms --chmod=ugo-w source backup/1/
rsync -a --perms --chmod=ugo-w --link-dest=../1/ source backup/2/
rsync -a --perms --chmod=ugo-w --link-dest=$(pwd)/backup/2/ source backup/3/
```

`backup/1/` still has user write permissions though.

## Sticky bit

Sticky bit on a directory prevents other users from renaming and deleting files in that directory (even if they have directory write permissions) ([ref](http://www.thegeekstuff.com/2011/02/sticky-bit-on-directory-file/))

```sh
# Set sticky bit:
chmod +t dir
# or (leading 1)
chmod 1777 dir

# In ls -l you'll see a trailing 't' instead of 'x' for executable sticky
```

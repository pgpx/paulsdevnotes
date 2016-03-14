# Rsync

* [Man](http://linux.die.net/man/1/rsync), [Home](https://rsync.samba.org/)

## Backup ideas

* [Easy Automated Snapshot-Style Backups with Linux and Rsync](http://www.mikerubel.org/computers/rsync_snapshots/)

```sh
rsync -a --delete --link-dest=backup/1 source/ backup/0/
```

Sticky bit on a directory prevents other users from renaming and deleting files in that directory (even if they have directory write permissions) ([ref](http://www.thegeekstuff.com/2011/02/sticky-bit-on-directory-file/))

```sh
# Set sticky bit:
chmod +t dir
# or (leading 1)
chmod 1777 dir

# In ls -l you'll see a trailing 't' instead of 'x' for executable sticky
```

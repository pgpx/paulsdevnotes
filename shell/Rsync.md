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

## Lsyncd -- Live Syncing (Mirror) Daemon

* <https://github.com/axkibe/lsyncd>

> Lsyncd watches a local directory trees event monitor interface (inotify or fsevents). It aggregates and combines events for a few seconds and then spawns one (or more) process(es) to synchronize the changes. By default this is rsync.

* **Not installable with brew because no longer opensource.**

Watch local directory and transfer it to remote via rsync+ssh

```bash
lsyncd -rsync /home remotehost.org::share/
```

## lftp

> Command line driven, shell-like, reliable file transfer program.

* <https://github.com/lavv17/lftp>

```bash
lftp sftp://target-domain.com/ -e "mirror --reverse --parallel=10 --delete --delete-excluded --exclude-glob-from=lftp-exclude.txt --verbose=1 $(pwd)/ ${TARGET}; exit"
```

Where `lftp-exclude.txt` contains glob matches, one per-line (e.g. `mydir/**`.

Run with [fswatch](https://emcrisostomo.github.io/fswatch/) to continuously sync:

```bash
fswatch --one-per-batch --directories -v --recursive "$(pwd)" |  xargs -I{}  -n 1 <sync-command>
```

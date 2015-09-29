# Linux Admin

## Mounts

View all filesystems and how they are currently mounted
```sh
df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        40G  4.5G   33G  12% /
tmpfs           1.9G     0  1.9G   0% /dev/shm
/dev/vdb        197G   26G  161G  14% /mymountdir
```

Mount a device temporarily (will be lost after a restart)
```sh
mount /dev/vdb /mnt
```

Unmount a device
```sh
umount /mnt
```

Restart-safe mounts by editing `/etc/fstab`
```
# Tabs between fields
/dev/vdb		/mnt			ext4	defaults	1 1
```

Then to apply the changes:
```sh
mount -a
```

## Services

Create symlinks in /etc/rc3.d to have services start on boot ([SO](http://unix.stackexchange.com/a/83753/32390)):
```sh
cd /etc/rc3.d
ln -s ../init.d/httpd S100httpd
```

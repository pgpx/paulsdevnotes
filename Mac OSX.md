# Mac OS/X

## Creating USB boot drives from ISOs

([Rockstor ref](http://rockstor.com/blog/tutorials/creating-a-rockstor-usb-install-drive-on-your-mac/))

Find your USB drive:

```sh
diskutil list
```

Then unmount it

```sh
# Replace <disk2> with your disk name, rdisk is faster?
diskutil unmountDisk /dev/r<disk2>
```

Copy the ISO to the drive (`pv` shows progress bars, 1MB at a time):

```sh
pv FreeNAS-9.3-STABLE-201602031011.iso | sudo dd of=/dev/rdisk2 bs=1048576
```

## Troubleshooting

### Multi-touch gestures not working

[SO](http://apple.stackexchange.com/a/171529/109323)
```
killall Dock
```

## Character map

`Ctrl + Cmd⌘ + Space` ([ref](https://support.apple.com/en-gb/HT201586))
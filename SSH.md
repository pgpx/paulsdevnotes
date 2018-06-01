# SSH

* <http://en.wikipedia.org/wiki/Ssh-keygen>
* <https://utcc.utoronto.ca/~cks/space/blog/sysadmin/SSHKeyTypes>
* <https://stribika.github.io/2015/01/04/secure-secure-shell.html>

## ssh options

* <https://www.ssh.com/ssh/command/>
* <https://man.openbsd.org/ssh_config>

* ConnectTimeout=<seconds>
* `BatchMode=yes` - don't ask for confirmations
* `-C` - Compress I/O
* `-q` - quiet mode

```bash
set -e
ssh -o ConnectTimeout=5 -o BatchMode=yes -Cq \
    myserver "cd $(date +/data/logs/%Y/%m/%d); tail -$LINES server.log" | \
    pv --progress --timer --eta --rate --bytes --line-mode --size $LINES > testdata/prod.log
```

## Keyboard shortcuts ([SO](https://apple.stackexchange.com/a/35543/109323))

* `~.` - terminate the connection
* `~^Z` (press ~ then Ctrl+Z) to suspend the connection and type a command locally (run the command `fg` to return to the SSH session)
* `~~` if you want a tilde at the beginning of a line

## Port forwarding

`-R [bind_address:]port:host:hostport`
```bash
# Log in to myserver, with otherserver port 22 forwarded as port 2222 on myserver (via your local machine)
ssh -R2222:otherserver:22 root@myserver

# View ports in use
netstat -ant | grep LISTEN
lsof -P -n | grep 2222
```

## Asked for password when SSHing to another user/machine ([SO](http://unix.stackexchange.com/a/36687/32390))

* Add public key to `~/.ssh/authorized_keys`
* Check that `~/.ssh` and `~/.ssh/authorized_keys` is writable only by you (otherwise user will need to enter a password)

## ssh-keygen

Create a new RSA key:

```bash
ssh-keygen -t rsa -b 3072 -f mykey
```

Change the password on an existing key ([SO](http://stackoverflow.com/a/112409/125246)):

```bash
ssh-keygen -p
```

Adding a private key to the Mac OS/X keychain ([ref](https://wiki.hpcc.msu.edu/display/hpccdocs/Adding+a+Private+Key+to+Your+Mac+OSX+Keychain)):

```bash
ssh-add -K /path/of/private/key
```

List all loaded keys ([SO](https://github.com/lionheart/openradar-mirror/issues/15361)):

```bash
ssh-add -l
```

OS/X Sierra changed config so that keys are not automatically stored in/loaded from keychain.  To change this ([ref](https://developer.apple.com/library/content/technotes/tn2449/_index.html#//apple_ref/doc/uid/DTS40017589)):

```
Host server.example.com
    IdentityFile ~/.ssh/id_rsa
    UseKeychain yes
```

or ([SO](http://superuser.com/a/1163862/108786)), using [note](https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain):

```bash
Host *
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_rsa

```

Might have to re-add/change config in OS/X Sierra ([ref](https://github.com/lionheart/openradar-mirror/issues/15361))

To view the password for a key on the OS/X keychain:

* `Keychain Access -> Category: Passwords`, select the password then `Get Info -> Show password` or `Copy Password to Clipboard`

## Decrypt encrypted private keys

Encrypted private keys look something like ([SO](http://unix.stackexchange.com/a/528/32390)):

```bash
> cat ~/.ssh/id_rsa
-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
```

To decrypt (enter password, outputs to console) ([ref](https://support.citrix.com/article/CTX122930/))

```bash
openssl rsa -in ~/.ssh/id_rsa
```
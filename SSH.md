# SSH

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

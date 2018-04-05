# Screen

* <https://linode.com/docs/networking/ssh/using-gnu-screen-to-manage-persistent-terminal-sessions/>

Can connect/disconnect to a session (resuming even after disconnecting the terminal)




* Start a screen session:

```bash
screen
```

* Detach from a screen session: `Ctrl+a+d`

* Reattach to a Screen session:

```bash
# Last detached session:
screen -r

# Specific
screen -r <PID>
```

* List sessions and their PIDs:

```bash
screen -ls
```
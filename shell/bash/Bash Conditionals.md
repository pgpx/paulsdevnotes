# Bash Conditionals

## Conditionally running commands ([SO](https://askubuntu.com/a/539293/36040))

```bash
A; B    # Run A and then B, regardless of success of A
A && B  # Run B if and only if A succeeded
A || B  # Run B if and only if A failed
A &     # Run A in background.
```

## Check if a variable is set [SO](https://stackoverflow.com/a/230593/125246)

```bash
if [ -z "${VAR+xxx}" ]; then echo VAR is not set at all; fi
```
# Bash Input

## Read a password from STDIN without echoing [SO](https://stackoverflow.com/a/55108463/125246)

```bash
IFS= read -sr -p "Enter a password: " password
my-command "$password"
```

> `IFS=` keeps `read` from trimming spaces and tabs, the -r keeps it from trying to parse backslashes as escapes, `-p "Enter a password: "` supplies the prompt, `-s` keeps it from echoing as you type, and then `echo` at then end goes to the next line (normally handled by echoing the carriage return at the end of input... but `-s` suppresses that).
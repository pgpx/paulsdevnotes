# Bash Regex

Use `${BASH_REMATCH[1]}` to get match group values ([SO](https://stackoverflow.com/a/23118123/125246)):

```shell script
if [[ $source =~ /dir/([^/]+)/([^/]+)$ ]]; then
    my_val=${BASH_REMATCH[2]}
``` 
# Bash getopts


## Handle multiple values for an argument

Just add values to an array ([SO](https://stackoverflow.com/a/20761893/125246)):

```bash
while getopts "m:" opt; do
    case $opt in
        m) multi+=("$OPTARG");;
        #...
    esac
done
shift $((OPTIND -1))
echo "${multi[@]}
```
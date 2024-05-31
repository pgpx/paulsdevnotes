# Bash Paths

## [Directory containing the current script](http://stackoverflow.com/a/246128/125246)

```bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
```

or use `realpath` (handles edge cases better) ([SO](https://stackoverflow.com/a/14892459/125246)) 

```bash
sudo apt-get install realpath  # may already be installed
~ $ realpath .bashrc
```
or 

```bash
# Detect zsh vs bash https://stackoverflow.com/a/9911082/125246
if [ -n "${ZSH_VERSION+x}" ]; then
  # zsh script's directory: https://stackoverflow.com/a/18814147/125246
  script_dir_path="${0:A:h}"
elif [ -n "${BASH_VERSION+x}" ]; then
  script_dir_path="${BASH_SOURCE[0]%/*}"
else
  (>&2 echo "Unsupported shell!")
  return
fi
```

Or get the directory of a script when following a symlink to it ([SO](https://unix.stackexchange.com/a/17500/32390)):

```bash
# https://unix.stackexchange.com/a/17500/32390
script_dir_path="$(dirname "$(readlink -f "$0")")"
"${script_dir_path}"/target-script "$@"
```

## [Absolute path](http://stackoverflow.com/a/3915420/125246)

```bash
function abspath() { echo "$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"; }
```

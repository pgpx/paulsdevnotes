# Zsh

* <https://github.com/hmml/awesome-zsh>

## Oh My Zsh

* [Homepage](https://ohmyz.sh/), [GitHub](https://github.com/robbyrussell/oh-my-zsh),
  [Plugins](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins)
* <https://evdokimovm.github.io/windows/zsh/shell/syntax/highlighting/ohmyzsh/hyper/terminal/2017/02/24/how-to-install-zsh-and-oh-my-zsh-on-windows-10.html>

## Plugins

* <https://github.com/unixorn/awesome-zsh-plugins>
* <https://github.com/zsh-users/zsh-syntax-highlighting>
* <https://github.com/powerline/fonts>, <https://github.com/Homebrew/homebrew-cask-fonts>
    * <https://apple.stackexchange.com/questions/270143/problems-installing-powerline-fonts-on-macos-10-12>
* <https://github.com/jonmosco/kube-ps1> - Kubernetes prompt for bash and zsh
    * <https://stackoverflow.com/questions/42356861/can-i-use-autocompletion-for-kubectl-in-zsh>

## zsh detection

```bash
# Detect zsh vs bash https://stackoverflow.com/a/9911082/125246
if [ -n "$ZSH_VERSION" ]; then
  # zsh script's directory: https://stackoverflow.com/a/18814147/125246
  script_dir_path="${0:A:h}"
elif [ -n "$BASH_VERSION" ]; then
  script_dir_path="${BASH_SOURCE[0]%/*}"
else
  (>&2 echo "Unsupported shell!")
  return
fi
```
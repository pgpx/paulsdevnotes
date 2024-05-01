# Homebrew (aka brew)

MacOS package manager.

* <https://brew.sh/>
* <https://docs.brew.sh/>

* Don't unshallow the clone, because GitHub requested the change to reduce the load on their servers. ([SO](https://stackoverflow.com/a/55513642/125246) and [GitHub issue](https://github.com/Homebrew/brew/issues/3513#issuecomment-348599067))

## Installing an old version of a package

Older versions might be available:

* `brew info postgresql`
* `brew switch postresql 9.1.5`

If it is unavailable as `package@version` ([SO](https://stackoverflow.com/a/7787703/125246))

* Get the 'raw' link of the formula `.rb`, e.g. <https://raw.githubusercontent.com/Homebrew/homebrew-core/fa992c6a82eebdc4cc36a0c0d2837f4c02f3f422/Library/Formula/postgresql.rb>
* `brew install <raw-link>`

Can `brew pin postgresql` to avoid the package from being upgraded.

For git:

```bash
curl https://raw.githubusercontent.com/Homebrew/homebrew-core/115cd1cd624fe90b780e68ab0ebe81255154364b/Formula/g/git.rb -o git.rb
brew install ./git.rb --force --build-bottle
```

## Where an earlier version isn't directly available

Use a fork of a `homebrew-<app>` repo to control which version is installed:

* Fork `derailed/homebrew-k9s` and revert `master` to an earlier commit.
* Then switch to it: `brew uninstall k9s && brew untap derailed/k9s && brew tap pgpx/k9s && brew install k9s`
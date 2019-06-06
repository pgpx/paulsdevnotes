# Brew

MacOS package manager.

* <https://docs.brew.sh/>

## Installing an old version of a package

Older versions might be available:

* `brew info postgresql`
* `brew switch postresql 9.1.5`

If it is unavailable as `package@version` ([SO](https://stackoverflow.com/a/7787703/125246))

* Get the 'raw' link of the formula `.rb`, e.g. <https://raw.githubusercontent.com/Homebrew/homebrew-core/fa992c6a82eebdc4cc36a0c0d2837f4c02f3f422/Library/Formula/postgresql.rb>
* `brew install <raw-link>`

Can `brew pin postgresql` to avoid the package from being upgraded.
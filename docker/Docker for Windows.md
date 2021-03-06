# Docker for Windows

* [Known issues](https://github.com/git-for-windows/build-extra/blob/master/ReleaseNotes.md#known-issues)

## Path mangling

Docker can mangle paths when they are passed as arguments: ([SO](https://stackoverflow.com/a/49013604/125246) and [known issues](https://github.com/git-for-windows/build-extra/blob/master/ReleaseNotes.md#known-issues)):

> This is actually a bug/limitation of Git for Windows as described in the Release Notes under Known issues:
>
> If you specify command-line options starting with a slash, POSIX-to-Windows path conversion will kick in converting e.g. `"/usr/bin/bash.exe"` to `"C:\Program Files\Git\usr\bin\bash.exe"`. When that is not desired -- e.g. `"--upload-pack=/opt/git/bin/git-upload-pack"` or `"-L/regex/"` -- you need to set the environment variable `MSYS_NO_PATHCONV` temporarily, like so:
>
> `MSYS_NO_PATHCONV=1 git blame -L/pathconv/ msys2_path_conv.cc`
>
> Alternatively, you can double the first slash to avoid POSIX-to-Windows path conversion, e.g. "//usr/bin/bash.exe".
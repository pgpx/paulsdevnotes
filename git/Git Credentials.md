# Git Credentials

* <https://git-scm.com/docs/gitcredentials>

Find the credential helpers available to you ([ref](https://git-scm.com/docs/gitcredentials#_avoiding_repetition)):

```bash
$ git help -a | grep credential-
credential-foo
```
Use a new helper, e.g. `store`:

```bash
git config --global credential.helper store
```

Now `~/.gitconfig` will contain:

```
[credential]
	helper = store
```

[git-credential-store](https://git-scm.com/docs/git-credential-store) stores its credentials in `~/.git-credentials`, e.g.:

```
https://user:pass@example.com
```

# git-crypt

* <https://www.agwa.name/projects/git-crypt/>
* <https://github.com/AGWA/git-crypt>


Articles:

* <https://robertknight.me.uk/posts/git-crypt-intro/>
* <https://www.schibsted.pl/blog/devops/securing-data-with-git-crypt/>

## Limitations

* Cannot easily revoke access or re-encrypt with a new key.  Can just delete `.git-crypt` and all of the encrypted files and commit, then re-init and add (<https://github.com/AGWA/git-crypt/issues/47#issuecomment-221249281> and https://github.com/AGWA/git-crypt/issues/47#issuecomment-492939759)

* [Exporting your Public key](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/4/html/Step_by_Step_Guide/s1-gnupg-export.html)
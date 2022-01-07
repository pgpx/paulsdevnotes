# PGP

List secret keys:

```bash
gpg --list-secret-keys
```

gpg --export-secret-keys --armor > privatekey
gpg --export --armor > publickey

## Generate a GPG keypair

```bash
gpg --gen-key
```

## Encrypt and decrypt a message

* <https://yanhan.github.io/posts/2017-09-27-how-to-use-gpg-to-encrypt-stuff/>

Encrypt with a public key file:

```bash
gpg --encrypt  --recipient-file recipient-pubkey.gpg --armor --output myfile.txt.gpg myfile.txt
``
Decrypt:

```bash
gpg --output myfile.txt --decrypt myfile.txt.gpg
```
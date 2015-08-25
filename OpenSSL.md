# OpenSSL

* [The Most Common OpenSSL Commands](https://www.sslshopper.com/article-most-common-openssl-commands.html)

## Generate a new private key and certificate
[SO](http://superuser.com/a/226229/108786)

```bash
#!/usr/bin/env sh
# Generate a new private key and certifcate using the argument as the base filename.
# $1 = Domain
openssl req -x509 -nodes -days 730 -sha1 -newkey rsa:2048 -keyout "$1.key" -out "$1.cert" \
	-subj "/C=GB/ST=State/L=Town/O=Company/OU=OrgUnit/CN=$1/emailAddress=my@email.com"
```

## Display the contents of a certificate
```bash
openssl x509 -in my.cert -text -noout
```

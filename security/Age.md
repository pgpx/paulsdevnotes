# age

> Age is a simple, modern and secure file encryption tool, format, and Go library.

* <https://github.com/FiloSottile/age>
* [Yubikey plugin](https://github.com/str4d/age-plugin-yubikey) -
YubiKey 4 and 5 series (incl. Nano and USB-C).

## sops

* <https://github.com/mozilla/sops#encrypting-using-age>

```yaml
  - path_regex: (\.pass\..*|passwords\.yaml)$
    key_groups:
      - kms:
          - arn: '<kms-arn>'
        age: [ 'age10c...' ]
```

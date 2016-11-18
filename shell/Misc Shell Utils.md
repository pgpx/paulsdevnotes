# Misc Shell Utils

Generate a random 16 byte (32 digit) hex string ([SO](http://stackoverflow.com/a/34329057/125246))

```bash
hexdump -n 16 -e '4/4 "%08X" 1 "\n"' /dev/random
```
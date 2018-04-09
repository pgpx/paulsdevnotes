# Docker for Mac

## Fix clock time drift on Docker for Mac (out-of-sync with host)

* <https://github.com/docker/for-mac/issues/2076>

```bash
docker run --rm --privileged alpine hwclock -s
```
# Images

## Detect JPEG compression level ([ref](http://www.imagemagick.org/discourse-server/viewtopic.php?t=20235))

```sh
docker run -v $(pwd):/data jujhars13/docker-imagemagick identify -verbose /data/myimage.jpg

# Look for:
# Compression: JPEG
# Quality: 80
```

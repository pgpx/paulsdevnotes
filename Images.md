# Images

## Detect JPEG compression level ([ref](http://www.imagemagick.org/discourse-server/viewtopic.php?t=20235))

```sh
docker run -w=/data -v $(pwd):/data jujhars13/docker-imagemagick identify -verbose myimage.jpg

# Look for:
# Compression: JPEG
# Quality: 80
```

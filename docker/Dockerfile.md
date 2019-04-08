# Dockerfile

* https://docs.docker.com/engine/reference/builder/
* https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

## Tips

Create an empty file in a scratch container ([SO](https://stackoverflow.com/a/48123169/125246))

```dockerfile
# touch isn't present in scratch - only commands are ADD and COPY
FROM busybox AS build-env
RUN touch /empty

FROM scratch
COPY --from=build-env /empty /.emptyfile
``` 
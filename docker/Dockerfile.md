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

* Use an ARG in Dockerfile FROM for dynamic image specification ([ref](https://www.jeffgeerling.com/blog/2017/use-arg-dockerfile-dynamic-image-specification)):

    ```dockerfile
    ARG MYAPP_IMAGE=myorg/myapp:latest
    FROM $MYAPP_IMAGE
    ```
    
    Then:
    
    `docker build -t container_tag --build-arg MYAPP_IMAGE=localimage:latest .`
    
* Copy a directory keeping its structure: ([SO](https://stackoverflow.com/a/53539023/125246), [SO](https://stackoverflow.com/a/30220096/125246))

    ```dockerfile
    COPY files/ /files/
    COPY .    /myfiles
    ```
# Operating Systems

Detect whether a command is supported ([SO](https://stackoverflow.com/a/24982246/125246))

```bash
 if command -v apk > /dev/null ; then \
    apk --no-cache update ; \
    apk add --no-cache python py-pip py-setuptools ca-certificates groff less ; \
    rm -rf /var/cache/apk/* ; \
elif command -v apt-get > /dev/null ; then \
    apt-get update; \
    apt-get --no-install-recommends install --reinstall -y groff groff-base less ; \
    rm -rf /var/lib/apt/lists/* ; \
elif command -v yum > /dev/null ; then \
    yum update -y ; \
    yum install -y groff groff-base less python python-setuptools python-pip ; \
    yum clean all ; \
else \
    echo "Can't find package manager" ; \
    exit 1 ; \
fi

```
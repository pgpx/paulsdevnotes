# [Curl](https://github.com/bagder/curl)

[Wait for success](http://stackoverflow.com/a/21189440/125246)
```bash
until $(curl --output /dev/null --silent --head --fail http://myhost:myport); do
    printf '.'
    sleep 5
done
```

[Get status code](http://superuser.com/a/442395)
```bash
curl -s -o /dev/null -w "%{http_code}" http://www.example.org/
```

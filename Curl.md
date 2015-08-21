# [Curl](https://github.com/bagder/curl)

[Get status code](http://superuser.com/a/442395)
```bash
curl -s -o /dev/null -w "%{http_code}" http://www.example.org/
```

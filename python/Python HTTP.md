# Python HTTP

## [Requests](https://requests.readthedocs.io/en/master/) - HTTP for humans!

Automatically parses link headers ([SO](https://stackoverflow.com/a/50269860/125246)):

```python
response.links['next']['url']
```

Determine a file extension based on Content-Type ([SO](https://stackoverflow.com/a/21836410/125246):

```python
import requests
import mimetypes

response = requests.get(url)
content_type = response.headers['content-type']
extension = mimetypes.guess_extension(content_type)
```
# [Curl](https://github.com/bagder/curl)

[Wait for success](http://stackoverflow.com/a/21189440/125246)
```bash
until $(curl --output /dev/null --silent --head --fail http://myhost:myport); do
    printf '.'
    sleep 5
done
```

Or max number of times:
```bash
count=0		# Global count of seconds waited (so that we don't wait too long in total)

function check() {
	# max retries, url, cookie header (to force jvmroute)
	echo "Checking URL: $1 $2 $3"
	until $(curl --output /dev/null --silent --fail --cookie "$3" "$2"); do
		sleep 1
		n=$[$n+1]
		if [[ $n -ge $1 ]]; then
			echo "Failed to access URL $2 with cookie $3"
			exit 1
		fi
	done
}

check 45 'http://myurlcom/test' 'JSESSIONID=abc.app1'
```

[Get status code](http://superuser.com/a/442395)
```bash
curl -s -o /dev/null -w "%{http_code}" http://www.example.org/
```

Don't check SSL certs (e.g. with self-signed)
```bash
curl -v --insecure https://my-url.com/
```

Use a SOCKS proxy (and get it to resolve hostnames) ([SO](http://stackoverflow.com/a/28598130/125246))
```bash
# (using just --socks5 will resolve the hostname locally) 
curl -v --socks5-hostname <socks-proxy-ip/host:port> https://my-url.com/
```

Use an HTTP proxy:

```bash
curl -v --proxy http://10.40.212.212:8081 http://test/url
```

Don't capture the response body (only output headers) ([SO](http://stackoverflow.com/questions/10060098/getting-only-response-header-from-http-post-using-curl))

```bash
# -D, --dump-header <file> Write the protocol headers to the specified file
# -D - (write to stdout)
# -s (silent, no progress bars)

curl -s -D - www.acooke.org -o /dev/null
```

Capture the raw POST data (and rest of the request/response) ([SO](http://superuser.com/a/291456/108786))
```bash
curl --trace-ascii -   # instead of -v
```

Follow redirects and maintain cookies in a cookie jar across the redirect ([SO](http://stackoverflow.com/a/18474746/125246)):
```bash
curl --location --cookie-jar cookiejar http://myurl ; rm cookiejar
```

POST data (`application/x-www-form-urlencoded`):
```bash
curl --trace-ascii - --data param=value --data param2=value --data-urlencode param3='base64-encoded-value' http://myurl

# Content-Type: application/x-www-form-urlencoded
# ...
# => Send data, 4312 bytes (0x10d8)
# 0000: pass=HS100&transactionId=b3ad500d-4f98-475d-a10a-31117337ec54&re
```

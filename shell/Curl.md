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

Don't capture the response body (only output headers) ([SO](http://stackoverflow.com/questions/10060098/getting-only-response-header-from-http-post-using-curl))

```bash
# -D, --dump-header <file> Write the protocol headers to the specified file
# -D - (write to stdout)
# -s (silent, no progress bars)

curl -s -D - www.acooke.org -o /dev/null
```

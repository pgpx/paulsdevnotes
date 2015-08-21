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

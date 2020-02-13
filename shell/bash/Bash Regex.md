# Bash Regex

Use `${BASH_REMATCH[1]}` to get match group values ([SO](https://stackoverflow.com/a/23118123/125246)):

```shell script
if [[ $source =~ /dir/([^/]+)/([^/]+)$ ]]; then
    # http://reports.tools.eedev/maven/com.telekom.et/ebdc-ee-performance-test/3.50.0/EbdcPerformanceTest/13h0m/20200206-0912
    my_val=${BASH_REMATCH[2]}
``` 
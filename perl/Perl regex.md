# Perl regex

One liner to search-and-replace on every line in the file:

```shell script
perl -pi.bak \  # Save a backup for each file
  -e \
  's|source|target|g' index.html
```


One-liner - use `-0777` to set the line separator to an unlikely character (because the one-liner parses the file one line at a time):

```shell script
perl -0777 -pi.bak -e 's|(<tr>\s*<td>E\S+)\s*((?:<a .*?</a>\s*)*)(\s*</td>(?:\s*<td>.*?</td>){2}\s*<td>)(.*?</td>\s*)<td>(.*?)</td>(.*?</tr>)|$1 / $5$3$2$4$6|sg' index.html
```
 
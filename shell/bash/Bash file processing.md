# Bash file processing

## Read each line from a file into different variables

Use read (assuming default input delimiter is `\n` ([SO](https://stackoverflow.com/a/44112055/125246))

```bash
{ read a; read b; read c;} <<< "${s}"
{ read a; read b; read c;} < "my-file.txt"
```

`-d char` can specify another input delimiter`

## Get the absolute path of a file



## Loop through each line of a file

([SO](https://stackoverflow.com/a/1521498/125246)) Won't interpret escape characters within the file, and will always process the last line (even if it is missing a terminating linefeed):

```bash
while IFS="" read -r p || [ -n "$p" ]
do
  printf '%s\n' "$p"
done < peptides.txt
```

Or, trims leading whitespace, interprets backslash sequences and might skip the last line if no linefeed:

```bash
while read p; do
  echo "$p"
done <peptides.txt
```

## Iterating through directories

* [Why you shouldn't parse the output of ls(1)](http://mywiki.wooledge.org/ParsingLs)
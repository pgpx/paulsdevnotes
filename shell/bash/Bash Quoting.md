# Bash Quoting

* <https://mywiki.wooledge.org/Quotes> - good overview




## Quoting within a command substitution $(...)

([SO](https://unix.stackexchange.com/a/118438/32390))

`$()` alwayss create a new quoting context, so you can do things like this: `foo "$(bar "$(baz "$(ban "bla")")")"` (does not work with backticks!)

`DIRNAME=$(dirname "$FILE")` - works, but only because this is an assignment.
`DIRNAME="$(dirname "$FILE")"` - recommended, works even if not an assignment

Further improvements:
* `DIRNAME="$(dirname -- "$FILE")"` works if $FILE starts with a dash.
* `DIRNAME="$(dirname -- "$FILE"; printf x)" && DIRNAME="${DIRNAME%?x}"` works even if $FILE ends with a newline, since `$()` chops off newlines at the end of output and dirname outputs a newline after the result!
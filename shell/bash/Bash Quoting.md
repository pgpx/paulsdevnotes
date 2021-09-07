# Bash Quoting

* <https://mywiki.wooledge.org/Quotes> - good overview


## Optionally passing arguments to a command

Use `:+` to only expand if the variable is defined.  Quote inside of the `${}` to split into separate arguments([SU](https://superuser.com/a/802544/108786), [ref](http://mywiki.wooledge.org/BashFAQ/050#I_only_want_to_pass_options_if_the_runtime_data_needs_them)):

```bash
curl \
    ${title:+ --data-urlencode "title=${title}"} \
    http://example.com
```

## Quoting within a command substitution $(...)

([SO](https://unix.stackexchange.com/a/118438/32390))

`$()` alwayss create a new quoting context, so you can do things like this: `foo "$(bar "$(baz "$(ban "bla")")")"` (does not work with backticks!)

`DIRNAME=$(dirname "$FILE")` - works, but only because this is an assignment.
`DIRNAME="$(dirname "$FILE")"` - recommended, works even if not an assignment

Further improvements:
* `DIRNAME="$(dirname -- "$FILE")"` works if $FILE starts with a dash.
* `DIRNAME="$(dirname -- "$FILE"; printf x)" && DIRNAME="${DIRNAME%?x}"` works even if $FILE ends with a newline, since `$()` chops off newlines at the end of output and dirname outputs a newline after the result!
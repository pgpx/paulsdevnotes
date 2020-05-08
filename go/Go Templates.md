# Go Templates

Access first element of an array ([SO](https://stackoverflow.com/a/52682686/125246):

```gotemplate
Foobar {{ (index .Doc.Users 0).Name }}
```
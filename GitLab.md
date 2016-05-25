# [GitLab](https://about.gitlab.com/)

OpenSource clone of [GitHub](https://github.com/).

## Documentation

GitLab-flavoured Markdown ([ref](https://github.com/gitlabhq/gitlabhq/blob/master/doc/markdown/markdown.md)):

* Internal Links: `[to project](/group/project)`, `[to file](relative-path/filename.java)`
* Cannot use backticks in link text ``[`my text`](href.html)`` because you end up with `<code>my text</code>`

Tables:

```markdown
| Left Aligned | Centered | Right Aligned | Default | Centered | Right Aligned |
| :----------- | :------: | ------------: | ------- | :------: | ------------: |
| Cell 1       | Cell 2   | Cell 3        | Cell 4  | Cell 5   | Cell 6        |
| Cell 7       | Cell 8   | Cell 9        | Cell 10 | Cell 11  | Cell 12       |
```

Also supports [AsciiDoc](http://asciidoctor.org/).

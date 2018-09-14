# Git Tags

List remote tags ([SO](https://stackoverflow.com/a/25987962/125246)):

```bash
git ls-remote --tags
git ls-remote origin
git ls-remote --tags /url/to/upstream/repo
```

([SO](https://stackoverflow.com/a/15472310/125246))The ^{} is the syntax used to dereference a tag. It is described in [gitrevisions](https://www.kernel.org/pub/software/scm/git/docs/gitrevisions.html#_specifying_revisions.)
* When used with tag objects, git would recursively dereference the tag until it finds a non-tag object.
* When used with non-tag objects, it doesn't do anything and is equivalent to skipping the `^{}`

Use [git-show-ref](https://www.kernel.org/pub/software/scm/git/docs/git-show-ref.html) and [git-show](https://www.kernel.org/pub/software/scm/git/docs/git-show.html):

```bash
git show-ref --tags --dereference
bb944682f7f65272137de74ed18605e49257356c    refs/tags/v0.1.6
771a930dc0ba86769d6862bc4dc100acc50170fa    refs/tags/v0.1.6^{}

git show bb944682f7f65272137de74ed18605e49257356c
tag v0.1
Tagger: Ash <tuxdude@OptimusPrime>
Date:   Sun Jul 15 00:14:43 2012 -0700
```

... but the tags have to be annotated tags, created with metadata-providing options (like `-a`, `-s`, or `-u`), otherwise they are just refs pointing straight to the tagged object ([SO](https://stackoverflow.com/a/2534787/125246K)).
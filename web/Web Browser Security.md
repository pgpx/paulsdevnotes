# Web Browser Security

## `target=_blank`

* <https://mathiasbynens.github.io/rel-noopener/>
* Opened page can access the opening page via `window.opener` (e.g. to trigger a navigation).  Especially a risk in user-generated links.
* Use [`rel=noopener`](https://html.spec.whatwg.org/multipage/semantics.html#link-type-noopener) instead (to ensure `window.nopener` is `null` in some new browsers).
  * Use [`rel=noreferrer`](https://html.spec.whatwg.org/multipage/semantics.html#link-type-noreferrer) to block `Referer` header.
* Don't use `target=_blank` (or other `target`) unless [you really need to](https://css-tricks.com/use-target_blank/).

# Gatling

* <http://gatling.io/>, [Ref](http://gatling.io/docs/2.2.1/),
  [Cheat sheet](http://gatling.io/#/cheat-sheet/2.2.1), [GitHub](https://github.com/gatling/gatling)

## Simulations

* [Simulation setup](http://gatling.io/docs/2.2.1/general/simulation_setup.html)

Each user has its own session (including cookies, saved values).  `repeat` in a scenario will reuse these values for each iteration, so to have independent iterations you'll need new users.

* [Injection](http://gatling.io/docs/2.2.1/general/simulation_setup.html#injection) allows you to specify users per/second (optionally ramped, and over a duration).
  * Can also specify a fixed number of `atOnceUsers`, but they'll end once their scenario ends.
* Can [Throttle](http://gatling.io/docs/2.2.1/general/simulation_setup.html#throttling) users to a max requests/second (for a duration), but that includes all requests (including `silent` ones).
  * You'll still need to carefully specify the number of injected users (if too high, then you'll get too many requests from the first step in a scenario).

## [Scenarios](http://gatling.io/docs/2.2.1/general/scenario.html)

Combine common and specific headers with `++` with 2 maps of headers:

```scala
val commonHeaders = Map("X-CDB-CLIENT-ID" -> cfg.getString("gateway.headers.client-id"), ...)
protected val mediencenterHeaders: Map[String, String] = Map("X-CDB-USER-TOKEN"->cfg.getString("gateway.token.user")) ++ commonHeaders
```

## Checks

### CSS:

Uses [CSSelly](http://jodd.org/doc/csselly/), which is an implementation of the [W3C Selectors Level 3 specification](https://www.w3.org/TR/css3-selectors/)

```scala
.check(css("html:root > body.purchase").exists
```

### Nodes

Uses Jodd [Lagarto](http://jodd.org/doc/lagarto/) [`Node`](http://jodd.org/api/jodd/lagarto/dom/Node.html) objects

Extract form inputs (to be resubmitted later):

```scala
.check(css("""div.myform input""").ofType[Node].findAll
  .transform(inputNodes => inputNodes.map(n => (n.getAttribute("name"), n.getAttribute("value"))))
  .saveAs("purchaseForm")))

// ...

.exec(http("Make purchase")
  .formParamSeq("${purchaseForm}")
```

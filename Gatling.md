# Gatling

* <http://gatling.io/>, [Ref](http://gatling.io/docs/2.2.1/),
  [Cheat sheet](http://gatling.io/#/cheat-sheet/2.2.1)

## Simulations

* [Simulation setup](http://gatling.io/docs/2.2.1/general/simulation_setup.html)

Each user has its own session (including cookies, saved values).  `repeat` in a scenario will reuse these values for each iteration, so to have independent iterations you'll need new users.

* [Injection](http://gatling.io/docs/2.2.1/general/simulation_setup.html#injection) allows you to specify users per/second (optionally ramped, and over a duration).
  * Can also specify a fixed number of `atOnceUsers`, but they'll end once their scenario ends.
* Can [Throttle](http://gatling.io/docs/2.2.1/general/simulation_setup.html#throttling) users to a max requests/second (for a duration), but that includes all requests (including `silent` ones).
  * You'll still need to carefully specify the number of injected users (if too high, then you'll get too many requests from the first step in a scenario).

## Scenarios

Combine common and specific headers with `++` with 2 maps of headers:

```scala
val commonHeaders = Map("X-CDB-CLIENT-ID" -> cfg.getString("gateway.headers.client-id"), ...)
protected val mediencenterHeaders: Map[String, String] = Map("X-CDB-USER-TOKEN"->cfg.getString("gateway.token.user")) ++ commonHeaders
```

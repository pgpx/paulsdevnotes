# Java Dates

Use [`java.time.Clock`](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/time/Clock.html) for mocking - can create system, fixed, and relative clocks (amongst others).


## Issues

[Don’t use ZonedDateTime for far-future dates](https://stackoverflow.com/a/56256359/125246) - we won't know wha the timezone rules are (DST might change) - instead use `Instant` (UTC) or `LocalDateTime`.
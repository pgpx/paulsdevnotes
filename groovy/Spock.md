# Spock

Asserting on elements in a list ([SO](https://stackoverflow.com/questions/13138769/asserting-on-a-list-of-items-in-spock)):

```groovy
then:
weatherList != null
weatherList.size() == 3
// does this list really contain Calendar objects?
weatherList.every { it.forecastDate == today }
// OR, for a potentially better error message
weatherList.each { assert it.forecastDate == today }
```
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

## Helper methods

Can't mix helper methods for assertions and verifications ([SO](https://stackoverflow.com/a/55942852/125246))

Helper methods for assertions

```groovy
void helperAssertions(String param) {
    assert response.getRedirectedUrl() == param
}
```

Helper methods for Mock interactions ([SO](https://stackoverflow.com/a/37837499/125246))

```groovy
// In the test
then:
interaction {
    myInteractionHelper(param)
}

def myInteractionHelper(param) {
    1 * myMock.myMethod(param, 1, null)
}
```
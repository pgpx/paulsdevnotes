# Mockito

* <http://mockito.org/>
* <https://github.com/mockito/mockito>
* [Documentation](http://site.mockito.org/mockito/docs/current/org/mockito/Mockito.html)
* [API](http://site.mockito.org/mockito/docs/current/index.html)
* [Maven Central Repo](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22org.mockito%22%2C%20a%3A%22mockito-core%22)

Example ([ref](http://mockito.org/))
```java
import static org.mockito.Mockito.*;

// mock creation
List mockedList = mock(List.class);

// using mock object - it does not throw any "unexpected interaction" exception
mockedList.add("one");
mockedList.clear();

// selective, explicit, highly readable verification
verify(mockedList).add("one");
verify(mockedList).clear();

// you can mock concrete classes, not only interfaces
LinkedList mockedList = mock(LinkedList.class);

// stubbing appears before the actual execution
when(mockedList.get(0)).thenReturn("first");
```

## Setup

Use a [MockitoRule](http://site.mockito.org/mockito/docs/current/org/mockito/junit/MockitoRule.html)
instead of a [MockitoJUnitRunner](http://site.mockito.org/mockito/docs/current/org/mockito/runners/MockitoJUnitRunner.html)
(so that the [Runner](http://junit.org/javadoc/latest/org/junit/runner/Runner.html)
can be changed, and other [TestRule](http://junit.org/javadoc/latest/org/junit/rules/TestRule.html)s added):

```java
@Rule
public MockitoRule mockitoRule = MockitoJUnit.rule();
```

Create mock objects with [@Mock](http://site.mockito.org/mockito/docs/current/org/mockito/Mock.html)

```java
@Mock private MyClass myMock;
```

Create an object and inject mocks into it (constructor, properties, or fields) using
[@InjectMocks](http://site.mockito.org/mockito/docs/current/org/mockito/InjectMocks.html)

```java
@InjectMocks private MyClass myObj;
```

## Stubbing

```java
import static org.mockito.Mockito.*;

// For methods that return values
// (if no stubs match, then null is returned)
when(myStub.myFunc(arg1, arg2)).thenReturn(myRetVal);
when(myStub.myFunc(arg1, arg2)).thenThrow(myException);

// For void methods that succeed, don't have to do anything

// For void methods that you want to throw:
doThrow(myException).when(myStub).myFunc(arg1, arg2);
```

## Verification

```java
import static org.mockito.Mockito.*;

// Exactly one call
verify(myStub).myFunc(arg1);

// Multiple calls
verify(myStub, times(2)).myFunc(arg1);
verify(myStub, atLeast(2)).myFunc(arg1);
```

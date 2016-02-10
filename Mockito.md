# Mockito

* <http://mockito.org/>
* <https://github.com/mockito/mockito>
* [Documentation](http://site.mockito.org/mockito/docs/current/org/mockito/Mockito.html)
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

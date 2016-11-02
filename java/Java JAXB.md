# Java JAXB

* [JAXB blog by MoXy dev](http://blog.bdoughan.com/)

Stackoverflow questions:
* <http://stackoverflow.com/questions/6790168/can-should-i-list-inherited-properties-for-a-jaxb-mapped-bean-in-the-proporder>
* <http://stackoverflow.com/questions/10065013/when-serializing-a-generic-list-using-jaxb-how-do-i-add-position-information-to>
* <http://stackoverflow.com/questions/3549334/java-generic-jaxb-serialization>
* <http://stackoverflow.com/questions/3549334/java-generic-jaxb-serialization/3549916#3549916>
* <http://stackoverflow.com/questions/10052484/jaxb-unmarshalling-non-wrapped-elements>

API:

* [`javax.xml.bind`](http://docs.oracle.com/javase/8/docs/api/javax/xml/bind/package-summary.html), [`javax.xml.bind.annotation`](http://docs.oracle.com/javase/8/docs/api/javax/xml/bind/annotation/package-summary.html), [`javax.xml.bind.annotation.adapters`](http://docs.oracle.com/javase/8/docs/api/javax/xml/bind/annotation/adapters/package-summary.html)
    * [`XmlAdapter`](http://docs.oracle.com/javase/8/docs/api/javax/xml/bind/annotation/adapters/XmlAdapter.html)

## MOXy

* [Homepage](http://www.eclipse.org/eclipselink/moxy.php)

### Maven

* <http://wiki.eclipse.org/EclipseLink/Maven>

```xml
<repository>
<id>EclipseLink</id>
<url>http://download.eclipse.org/rt/eclipselink/maven.repo</url>
</repository>

<dependency>
<groupId>org.eclipse.persistence</groupId>
<artifactId>org.eclipse.persistence.moxy</artifactId>
<version>2.4.0</version>
</dependency>
```

### Setup
Add `jaxb.properties` file to domain object package:

```properties
# Use MOXy JAXB implementation (allows addtional customisation)
javax.xml.bind.context.factory=org.eclipse.persistence.jaxb.JAXBContextFactory
```

### MOXy notes

Output CDATA elements ([SO](http://stackoverflow.com/questions/6813948/using-moxys-xmlcdata-annotation-with-jersey)):

```java
@XmlCDATA
private String content;
```

Output xsi:schemaLocation ([SO](http://stackoverflow.com/questions/4863786/xmlschema-annotation-use-with-jaxb)):

```java
marshaller.setProperty(Marshaller.JAXB_SCHEMA_LOCATION, "http://com.telekom.digitalmedia/pcb/document /home/paulm/Dev/workspace/cms/src/main/resources/templates/document.xsd");
```

Pretty print:

```java
marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
```
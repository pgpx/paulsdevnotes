# Java JAXB

* [JAXB Website](https://jaxb.java.net/)
* [JSR 222 - JAXB Specification](https://jcp.org/en/jsr/detail?id=222)
* [JAXB blog by MoXy dev](http://blog.bdoughan.com/)
* [Unofficial JAXB Guide](https://jaxb.java.net/guide/index.html) - Glassfish / [jaxb.java.net](https://jaxb.java.net)
    * [JAXB Tutorial](https://jaxb.java.net/tutorial/)

API:

* [`javax.xml.bind`](http://docs.oracle.com/javase/8/docs/api/javax/xml/bind/package-summary.html), [`javax.xml.bind.annotation`](http://docs.oracle.com/javase/8/docs/api/javax/xml/bind/annotation/package-summary.html), [`javax.xml.bind.annotation.adapters`](http://docs.oracle.com/javase/8/docs/api/javax/xml/bind/annotation/adapters/package-summary.html)
    * [`XmlAdapter`](http://docs.oracle.com/javase/8/docs/api/javax/xml/bind/annotation/adapters/XmlAdapter.html)

Stackoverflow questions:

* <http://stackoverflow.com/questions/6790168/can-should-i-list-inherited-properties-for-a-jaxb-mapped-bean-in-the-proporder>
* <http://stackoverflow.com/questions/10065013/when-serializing-a-generic-list-using-jaxb-how-do-i-add-position-information-to>
* <http://stackoverflow.com/questions/3549334/java-generic-jaxb-serialization>
* <http://stackoverflow.com/questions/3549334/java-generic-jaxb-serialization/3549916#3549916>
* <http://stackoverflow.com/questions/10052484/jaxb-unmarshalling-non-wrapped-elements>

## Anotations

```java
@XmlAccessorType(XmlAccessType.FIELD)
@JsonIgnoreProperties(ignoreUnknown = true)
@XmlType(name = "Prop", namespace = "http://myns", propOrder = {"propA", "propB"})
public class MyClass { }

@XmlElement(namespace = "http://myns")
@JsonInclude(NON_EMPTY)
protected List<String> myAttr = new ArrayList<>();

@XmlTransient
private String myAttr;
```

## Type conversions

Crate an [`XmlAdapter`](http://docs.oracle.com/javase/8/docs/api/javax/xml/bind/annotation/adapters/XmlAdapter.html) to map types that JAXB knows how to map (ValueType) to other types (BoundType).

```java
public class MyXmlAdapter extends XmlAdapter<ValueType, BoundType> {
    @Override
    public BoundType unmarshal(ValueType v) throws Exception { ... }
    @Override
    public ValueType marshal(BoundType v) throws Exception { ... }
}
```

Then use it via the [`@XmlJavaTypeAdapter`](http://docs.oracle.com/javase/8/docs/api/javax/xml/bind/annotation/adapters/XmlJavaTypeAdapter.html) annotation on a property/class/package.

```java
  @XmlJavaTypeAdapter(MyXmlAdapter.class)
  protected BoundType prop;
```

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
# Use MOXy JAXB implementation (allows additional customisation)
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
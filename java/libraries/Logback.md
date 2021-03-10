# Logback

## Configuration

* <http://logback.qos.ch/manual/configuration.html>

### [Property substitution](http://logback.qos.ch/manual/configuration.html#variableSubstitution)

Can use `${PROP_NAME` for any value.

* Uses system properties by default: `-DPROP_NAME=value`
* Define a property: `<property name="PROP_NAME" value="test-value" />`
* Read properties from a file: `<property file="my.properties" />`
* Read properties from a file in the classpath: `<property resource="my.properties" />`
* Each can be scoped with `scope="scope"`
    * `local` (default) - exists from point of definition until end of config file.  Re-evaluated on config file reload.
    * `context` - inserted into context (so available to logging events), available until context is cleared.
    * `system` - inserted into system properties.
* Use default values: using `:-`, e.g. `${propName:-defaultValue}`
* Can nest properties when defining others, even in property files, e.g. `dest=${USER_HOME}/${fileName}`
    * Can do this with property names and defaults: `${${userId}.password}`
* `HOSTNAME` (context scope) - defined automatically.
* `CONTEXT_NAME` (context scope) - defined automatically, or [earlier in the configuration](http://logback.qos.ch/manual/configuration.html#contextName) `<contextName>name</contextName>` 
* Implement the `PropertyDefiner` interface, then include with `<define name="propName" class="a.class.implementing.PropertyDefiner">`

### [Conditional processing](http://logback.qos.ch/manual/configuration.html#conditional)

* Needs the [Janino](http://janino-compiler.github.io/janino/) library:

    ```
    <dependency>
      <groupId>org.codehaus.janino</groupId>
      <artifactId>janino</artifactId>
      <version>3.0.6</version>
    </dependency>
    ```

* `<if condition="..."><then>...</then><else>...</else></if>`
    * `property("HOSTNAME").contains("torino")`
    * `isDefined("k")`, `isNull("k")`
    
### [File inclusion](http://logback.qos.ch/manual/configuration.html#fileInclusion)

* `<include file="src/main/java/chapters/configuration/includedConfig.xml"/>`
  * Or `resource` for classpath, or `url`. 
* Included file _must_ have contents inside an `<included>...</included>` element.

## logstash-logback-encoder

* <https://github.com/logstash/logstash-logback-encoder>

Send logs to Logstash as JSON

### [Composite Encoder/Layout](https://github.com/logstash/logstash-logback-encoder#composite-encoderlayout)

Use to customise and extend the log configuration.

* [Pattern JSON Provider](https://github.com/logstash/logstash-logback-encoder#pattern-json-provider)


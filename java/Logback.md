# Logback

* <https://logback.qos.ch/>
* <https://logback.qos.ch/manual/>

## Controlling logging

Turn off all log messages for an appender using a `ThresholdFilter` ([SO](https://stackoverflow.com/a/17610917/125246)), also using a variable with a default value to control it ([ref](https://logback.qos.ch/manual/configuration.html#defaultValuesForVariables)):

```xml
<appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
    <filter class="ch.qos.logback.classic.filter.ThresholdFilter">
        <!-- Turn off all logback logging to STDOUT by running with: -DLOGBACK_THRESHOLD=OFF -->
        <level>${LOGBACK_THRESHOLD:-DEBUG}</level>
    </filter>
    <encoder class="ch.qos.logback.core.encoder.LayoutWrappingEncoder">
        ...
    </encoder>
</appender>
```

## JSON logging

* <https://www.baeldung.com/java-log-json-output>
* <https://github.com/qos-ch/logback-contrib/wiki/JSON>

Logback config:

```xml
<appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
    <encoder class="ch.qos.logback.core.encoder.LayoutWrappingEncoder">
        <layout class="ch.qos.logback.contrib.json.classic.JsonLayout">
            <jsonFormatter
                    class="ch.qos.logback.contrib.jackson.JacksonJsonFormatter">
                <prettyPrint>false</prettyPrint>
            </jsonFormatter>
            <appendLineSeparator>true</appendLineSeparator>
            <includeException>true</includeException>
            <timestampFormat>yyyy-MM-dd' 'HH:mm:ss.SSSZ</timestampFormat>
        </layout>
    </encoder>
</appender>
```

Example output:

```json
{"timestamp":"2018-09-13 16:44:33.691+0100","level":"ERROR","thread":"main","logger":"myloffer","mdc":{"key":"value"},
  "message":"test exception","context":"logcontext",
  "exception":"java.lang.RuntimeException: test cause\n\tat org.junit.runners....java:57)\n\t...)\n"}
```

Additional dependencies:

* `ch.qos.logback.contrib:logback-json-classic:0.1.5`
* `ch.qos.logback.contrib:logback-jackson:0.1.5`

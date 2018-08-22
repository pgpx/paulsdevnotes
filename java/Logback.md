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
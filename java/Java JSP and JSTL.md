# Java JSP and JSTL

## Spec support

* [Tomcat versions](http://tomcat.apache.org/whichversion.html)

Maven dependencies:

```xml
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>3.0.1</version>
    <scope>provided</scope>
</dependency>
<dependency>
    <groupId>javax.servlet.jsp</groupId>
    <artifactId>javax.servlet.jsp-api</artifactId>
    <version>2.3.1</version>
    <scope>provided</scope>
</dependency>
<dependency>
    <groupId>javax.el</groupId>
    <artifactId>javax.el-api</artifactId>
    <version>3.0.0</version>
    <scope>provided</scope>
</dependency>
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
    <version>1.2</version>
</dependency>
```

## Can access enums and constants in EL 3.0 ([SO](http://stackoverflow.com/a/3735006/125246))

```
<%@ page import="com.example.YourConstants" %>
```

This will under the covers be imported via ImportHandler#importClass() and be available as 

```
${YourConstants.FOO}
```

# Troubleshooting

## Slow JSP tag performance on Tomcat 8

Orders of magnitude slower!  Fixed in 8.0.33 - [bug report](https://bz.apache.org/bugzilla/show_bug.cgi?id=57583), [blog post](http://blog.nortal.com/tomcat-8-performance-issue-tagx-usage/)
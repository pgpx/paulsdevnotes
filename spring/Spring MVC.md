# Spring MVC

* [Ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc)

## [Overview](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-introduction)

All requests routed via the [`DispatcherServlet`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/DispatcherServlet.html) - [Front Controller](https://en.wikipedia.org/wiki/Front_controller) pattern.  Typically one per-context (but Spring Boot seems to prefer using only one).

Special bean types: HandlerMapping, HandlerAdapter, HandlerExceptionResolver, ViewResolver, LocaleResolver, LocaleContextResolver, ThemeResolver, MultipartResolver, FlashMapManager (though most not needed with annotations).

## [Controllers](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-controller)

Define a [`@Controller`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/stereotype/Controller.html) class, which is a
  [`@Component`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/stereotype/Component.html)
  and server will look for 
  [`@RequestMapping`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RequestMapping.html) methods.

[`@RequestMapping`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RequestMapping.html):

* At class level, defines the base URL for all methods in the class.

```java
@Controller
@RequestMapping("/base-path")
public class MyController {
```

* Method level, `path`/`value` maps the (sub)path.  Can be a URI template (to extract `@PathVariable`s):

```java
@RequestMapping(path = "/{day}")
public void mymethod(@PathVariable @DateTimeFormat(iso=ISO.DATE) Date day) {
```

  * Can use a regex in the mapping's URI template: `{varName:regex}`
  * Can use Ant-style path patterns, e.g. `/myPath/*.do`, `/owners/*/pets{petId}`, `/hotels/{hotel}/**`
  * Most specific path match wins (fewer wildcards and URI variables, with `**` wildcards the lowest).
  * By default all suffixes are matched (to allow URL extensions to easily map to resource types).  Can turn this off.  Watch out for Reflected File Download (RFD) attaches - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-requestmapping-rfd)

[`@RequestMapping`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RequestMapping.html) annotation parameters:

* `method = RequestMethod.GET`
* `path = "/{day}"`
* `consumes =` [`MediaType.APPLICATION_JSON_VALUE`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/MediaType.html) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-requestmapping-consumes)
* `produces =` [`MediaType.APPLICATION_JSON_VALUE`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/MediaType.html) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-requestmapping-produces)
* `params=myParam`, `params="myParam=myValue"`, `headers="myHeader=!myValue"` - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-requestmapping-params-and-headers)

[Method argument types](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-arguments):

* [`@PathVariable`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/PathVariable.html) `@DateTimeFormat(iso=ISO.DATE) Date day` - value extracted from the URI template.
  * If the value is a Map, then it gets all URI template variables.
* [`@RequestBody`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RequestBody.html) - request body is parsed using an [`HttpMessageConverter<T>`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/converter/HttpMessageConverter.html)
* `Model`
* [`@MatrixVariable`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/MatrixVariable.html) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-matrix-variables)
* ...

[Method return types](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-return-types):

* [`@ResponseBody`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/ResponseBody.html) - return value is output using an [`HttpMessageConverter<T>`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/converter/HttpMessageConverter.html).
* Map
* Form object
* ...

Support classes:

* `RequestMappingHandlerMapping`, `RequestMappingHandlerAdapter` - enabled by default using MVC Java config/namespace.

## [HTTP Message Conversion](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#rest-message-conversion)

* Use [`HttpMessageConverter<T>`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/converter/HttpMessageConverter.html) for `@ResponseBody` and `@RequestBody`.

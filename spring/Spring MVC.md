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

* [`@RestController`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RestController.html) combines `@Controller` and [`@ResponseBody`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/ResponseBody.html] - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-restcontroller)

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
* [`@RequestParam("param", required=false)`]() - request (query string/form) parameter.  Default is `required=true`.  [Type conversion](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-typeconversion) uses `WebDataBinder` or `Formatters` - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-requestparam)
* [`@RequestBody`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RequestBody.html) - request body is parsed using an [`HttpMessageConverter<T>`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/converter/HttpMessageConverter.html) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-requestbody)
* `Model`
* [`@MatrixVariable`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/MatrixVariable.html) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-matrix-variables)
* [`HttpEntity`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/HttpEntity.html) - access headers and body (like `@RequestBody`) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-httpentity)
* [`@ModelAttribute`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/ModelAttribute.html) on a method - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-modelattrib-method-args)
* [`@SessionAttributes`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/SessionAttributes.html) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-sessionattrib)
* [`HttpPutFormContentFilter`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/filter/HttpPutFormContentFilter.html) allows `application/x-www-form-urlencoded` content to be read from PUT and PATH methods - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-form-urlencoded-data)
* [`@CookieValue("JSESSIONID")`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/CookieValue.html) - retrieve a cookie value - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-cookievalue)
* [`@RequestHeader("Accept-Encoding")`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/RequestHeader.html) - retrieve a header value, comma-separated can map to an array or list, or a `Map/MultiValueMap/HttpHeaders` to get them all - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-requestheader)

[Method return types](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-return-types):

* [`@ResponseBody`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/ResponseBody.html) - return value is output using an [`HttpMessageConverter<T>`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/converter/HttpMessageConverter.html) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-responsebody)
* [`HttpEntity`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/HttpEntity.html) - set headers and body (like `@ResponseBody`) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-httpentity)
* * Map
* Form object
* ...

Support classes:

* `RequestMappingHandlerMapping`, `RequestMappingHandlerAdapter` - enabled by default using MVC Java config/namespace.

## Binding/Conversion

### For `@ResponseBody` and `@RequestBody`:

[HTTP Message Conversion](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#rest-message-conversion)

* Use [`HttpMessageConverter<T>`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/converter/HttpMessageConverter.html) 

### For parameters, path variables, request headers, cookie values - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-typeconversion)

* [`WebDataBinder`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/WebDataBinder.html) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-webdatabinder)
* [`Formatters`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/format/Formatter.html) registered with the [`FormattingConversionService`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/format/support/FormattingConversionService.html) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#format)

Use `@InitBinder`-annotated methods in a controller - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-webdatabinder):

```java
@InitBinder
public void initBinder(WebDataBinder binder) {
    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    binder.addCustomFormatter(new DateFormatter("yyyy-MM-dd")); // preferred
}
```

Use a custom [`WebBindingInitializer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/support/WebBindingInitializer.html) and add it to a [`RequestMappingHandlerAdapter`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/mvc/method/annotation/RequestMappingHandlerAdapter.html) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-webbindinginitializer)


[`@ControllerAdvice`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/ControllerAdvice.html) classes with `@ExceptionHandler`, `@InitBinder`, and `@ModelAttribute` annotated-mehtods to apply to selected classes - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-controller-advice)

```java
@ControllerAdvice(annotations = RestController.class)
@ControllerAdvice("org.example.controllers")
@ControllerAdvice(assignableTypes = {ControllerInterface.class, AbstractController.class})
```

Jackson's [Serialization Views](http://wiki.fasterxml.com/JacksonJsonViews) ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-jsonview))
and [JSONP](http://en.wikipedia.org/wiki/JSONP) support ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-jsonp))

## [Asynchronous Request Processing](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-async)

Controller methods can return a `Callable` (wrapped in a [`WebAsyncTask`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/context/request/async/WebAsyncTask.html) to set timeouts and executor) to then use a Spring-managed thread, or a `DeferredResult` to use a user-defined thread.

[`HandlerInterceptors`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/HandlerInterceptor.html) can also implement [`AsyncHandlerInterceptor`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/AsyncHandlerInterceptor.html) and register [`CallableProcessingInterceptor`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/context/request/async/CallableProcessingInterceptor.html) and [`DeferredResultProcessingInterceptor`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/context/request/async/DeferredResultProcessingInterceptor.html) to integrate more deeply into the lifecycle (e.g. for timeout) - [ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-async-interception)

[`ResponseBodyEmitter`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/mvc/method/annotation/ResponseBodyEmitter.html) return value can be used to push multiple events on a single HTTP response, to support "Long Polling" aka "HTTP Streaming" ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-async-http-streaming))
* [Server-Sent Events](http://www.w3.org/TR/eventsource/) with a [`SseEmitter`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/mvc/method/annotation/SseEmitter.html) ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-async-sse))
* Write directly to the `OutputStream` using a [`ResponseBodyEmitter`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/mvc/method/annotation/ResponseBodyEmitter.html) ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-async-output-stream))

Configure async:
* Set `asyncSupported` in a [`WebApplicationInitialzer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/WebApplicationInitializer.html), or extend [`AbstractDispatcherServletInitializer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/support/AbstractDispatcherServletInitializer.html) or [`AbstractAnnotationConfigDispatcherServletInitializer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/support/AbstractAnnotationConfigDispatcherServletInitializer.html) ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-async-configuration))
* [`WebMvcConfigurer.configureAsyncSupport`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html#configureAsyncSupport-org.springframework.web.servlet.config.annotation.AsyncSupportConfigurer-) - can set default async request timeout (10 seconds on Tomcat), and set the `Executor` and interceptors ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-ann-async-configuration-spring-mvc))

## [Handler mappings](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-handlermapping)
## [Resolving views](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-viewresolver)
## [Flash attributes](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-flash-attributes)
## [Building URIs](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-uri-building)
## [Locales](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-localeresolver)
## [Themes](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-themeresolver)
## [Multipart (file upload) support](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-multipart)
## [Handling exceptions](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-exceptionhandlers)
## [Web security](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-web-security)
## [Convention over configuration](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-coc)
## [HTTP caching](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-caching)

## [Code-based Servlet container initialisation](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-container-config)

Alternative to `web.xml` for Servlet 3.0+.  Implement a [`WebApplicationInitializer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/WebApplicationInitializer.html) or extend an [`AbstractAnnotationConfigDispatcherServletInitializer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/support/AbstractAnnotationConfigDispatcherServletInitializer.html) or [`AbstractDispatcherServletInitializer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/support/AbstractDispatcherServletInitializer.html), to register the application context, filters, etc.

## [Configuration](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config)

[`@EnableWebMvc`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/EnableWebMvc.html) added to a [`@Configuration`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/context/annotation/Configuration.html) class ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-enable)):
* Base config from [`WebMvcConfigurationSupport`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurationSupport.html)
  * `@Valid` (with JSR-303 Provider), XML (JAXB), JSON (Jackson 2), Atom and RSS (Rome)
* Can be overridden using a [`WebMvcConfigurer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html) or [`WebMvcConfigurerAdapter`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurerAdapter.html] ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-customize))

* Default formatters for `Number` and `Date` installed, including `@NumberFormat` and `@DateTimeFormat` (even with Joda Time if found).  Other formatters can be registered with `addFormatters` ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-conversion))
* 

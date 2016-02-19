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
* Can be overridden using a [`WebMvcConfigurer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html) or [`WebMvcConfigurerAdapter`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurerAdapter.html) ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-customize))
* Default formatters for `Number` and `Date` installed, including `@NumberFormat` and `@DateTimeFormat` (even with Joda Time if found).  Other formatters can be registered with [`addFormatters`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html#addFormatters-org.springframework.format.FormatterRegistry-) ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-conversion))
* [Validators](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#validator) ([API](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/validation/Validator.html)) can validate [`@Valid`](http://docs.oracle.com/javaee/7/api/javax/validation/Valid.html?is-external=true) or [`@Validated`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/validation/annotation/Validated.html) controller method arguments, or as a local validator via an [`@InitBinder`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/bind/annotation/InitBinder.html) method (to let you customise it for the controller).
  * Also supports [JSR-303/JSR-349](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#validation-beanvalidation-overview) bean validation using a [`LocalValidatorFactoryBean`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/validation/beanvalidation/LocalValidatorFactoryBean.html) which adapts Spring [`Validators`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/validation/Validator.html) to Java [`Validators`](http://docs.oracle.com/javaee/7/api/javax/validation/Validator.html?is-external=true).  By default, one of these is configured (if a provider, such as Hibernate Validator is on the classpath). ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-validation))
* [`HandlerInterceptors`]() and [`WebRequestInterceptors`]() can be applied to all paths or selected paths by overriding [`addInterceptors`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html#addInterceptors-org.springframework.web.servlet.config.annotation.InterceptorRegistry-) ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-interceptors))

```java
registry.addInterceptor(new LocaleInterceptor());
registry.addInterceptor(new ThemeInterceptor()).addPathPatterns("/**").excludePathPatterns("/admin/**");
registry.addInterceptor(new SecurityInterceptor()).addPathPatterns("/secure/*");
```

* [Content negotiation](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-content-negotiation) - by default checks path extension and Accept header, and registers `json`, `xml`, `rss`, and `atom` if dependencies on the classpath.
  * Customise by overriding [`configureContentNegotiation`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html#configureContentNegotiation-org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer-) - can disable/favour path extensions, parameters, Accept headers, add aditional media types, etc.
* [View controllers](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-view-controller) - define controllers that immediately forward to views by overriding [`addViewControllers`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html#addViewControllers-org.springframework.web.servlet.config.annotation.ViewControllerRegistry-), which is a shortcut for defining [`ParameterizableViewController`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/mvc/ParameterizableViewController.html)
* [View resolvers](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-view-resolvers) - configure content negotiation view resolution by overriding [`configureViewResolvers`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html#configureViewResolvers-org.springframework.web.servlet.config.annotation.ViewResolverRegistry-) - might also need to add a configurer class (e.g. [`FreeMarkerConfigurer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/view/freemarker/FreeMarkerConfigurer.html))
* [Serve static resources](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-static-resources) from locations other than the webapp root (including classpath).  Can define a cache period, and automatically sets `Last-Modified`.  Override [`addResourceHandlers`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html#addResourceHandlers-org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry-).  Mapping must be an Ant pattern (used by [`SimpleUrlHandlerMapping`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/handler/SimpleUrlHandlerMapping.html)).  e.g. for 1 year expiration with a [`VersionResourceResolver`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/resource/VersionResourceResolver.html) to create a filename with a hash of the contents (in a chain so that this is cached):

  ```java
  registry.addResourceHandler("/resources/**")
    .addResourceLocations("/public-resources/", "classpath:/META-INFI/public-web-resources)
    .setCachePeriod(31556926)
    .resourceChain(true).addResolver(
      new VersionResourceResolver().addContentVersionStrategy("/**"));
  ```

  * May need to add a [`ResouceUrlEncodingFilter`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/resource/ResourceUrlEncodingFilter.html) or [`ResourceUrlProvider`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/resource/ResourceUrlProvider.html) and [`CssLinkResourceTransformer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/resource/CssLinkResourceTransformer.html)
  * Can support [WebJars](http://www.webjars.org/) using a [`WebJarsResourceResolver`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/resource/WebJarsResourceResolver.html)
* Map the [`DispatcherServlet`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/DispatcherServlet.html) to `/` (overriding the container's default servlet), but stlll allow static resource requests to be handled by the container's default Servlet.  Override [`configureDefaultServletHandling`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html#configureDefaultServletHandling-org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer-) to configure a [`DefaultServletHttpRequestHandler`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/resource/DefaultServletHttpRequestHandler.html) with a URL mapping of `/**` and the lowest priority relative to other URL mappings. ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-default-servlet-handler))
  * Default Servlet name must be given if it has been changed.
* [Customise URL mapping and path matching](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-path-matching) by overriding [`configurePathMatch`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html#configurePathMatch-org.springframework.web.servlet.config.annotation.PathMatchConfigurer-) and using a [`PathMatchConfigurer`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/PathMatchConfigurer.html) - e.g. whether to use suffix pattern match, trailing slash, which [`UrlPathHelper`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/util/UrlPathHelper.html) and [`PathMatcher`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/util/PathMatcher.html) to use for request mappings, view controller mappings, and resource mappings.
* Customise [`HttpMessageConverter`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/http/converter/HttpMessageConverter.html) by overriding [`configureMessageConverters`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html#configureMessageConverters-java.util.List-) to replace the defaults or override [`extendMessageConverters`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurer.html#extendMessageConverters-java.util.List-) to add to the defaults. ([ref](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-message-converters))

  ```java
  Jackson2ObjectMapperBuilder builder = new Jackson2ObjectMapperBuilder()
          .indentOutput(true)
          .dateFormat(new SimpleDateFormat("yyyy-MM-dd"))
          .modulesToInstall(new ParameterNamesModule());
  converters.add(new MappingJackson2HttpMessageConverter(builder.build()));
  converters.add(new MappingJackson2XmlHttpMessageConverter(builder.xml().build()));
  ```
  * Indentation requires `woodstox-core-asl` dependency as well as `jackson-dataformat-xml`.
  * [`jackson-datatype-money`](https://github.com/zalando/jackson-datatype-money) supports [`javax.money`](https://github.com/JavaMoney/jsr354-api) types
  * [`jackson-datatype-hibernate`](https://github.com/FasterXML/jackson-datatype-hibernate) supports Hibernate specific types and properties (including lazy-loading aspects)
* [Advanced customisations](http://docs.spring.io/spring/docs/current/spring-framework-reference/htmlsingle/#mvc-config-advanced-java)
  * Look at [`WebMvcConfigurationSupport`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/WebMvcConfigurationSupport.html) (including the [`@Bean`]() declarations) to see what [`@EnableWebMvc`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/EnableWebMvc.html) [`@Import`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/context/annotation/Import.html)s.
  * Extend [`DelegatingWebMvcConfiguration`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/DelegatingWebMvcConfiguration.html) to replace [`@EnableWebMvc`](http://docs.spring.io/spring/docs/current/javadoc-api/org/springframework/web/servlet/config/annotation/EnableWebMvc.html) to customise.  Only have one per application.

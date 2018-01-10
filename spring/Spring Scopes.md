# Spring Scopes

[RequestContextHolder](https://docs.spring.io/spring-framework/docs/5.0.2.RELEASE/javadoc-api/org/springframework/web/context/request/RequestContextHolder.html#currentRequestAttributes--) can get the [RequestAttributes](https://docs.spring.io/spring-framework/docs/5.0.2.RELEASE/javadoc-api/org/springframework/web/context/request/RequestAttributes.html) which hold the (request and session-)scoped beans.

 When using MockMvc for testing:
 * <https://thomaswabner.wordpress.com/2013/02/27/testing-rest-interface-with-spring-3-2-and-a-session-scoped-bean/>
 * <https://stackoverflow.com/questions/35742457/how-to-instantiate-seesion-before-unit-testing-execution-so-that-autowired-sessi>
 * <http://www.java-allandsundry.com/2013/05/testing-spring-session-scope.html>
 
 * The MockHttpSession needs to be `@Autowired`, otherwise the scoped beans won't match (if you create a new session later).
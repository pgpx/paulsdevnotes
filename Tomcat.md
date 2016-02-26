# Tomcat

* [API](http://tomcat.apache.org/tomcat-8.0-doc/api/index.html)

## Pre-compiling JSPs

### At server start time

Use [`ServletRegistration.Dynamic`](http://docs.oracle.com/javaee/7/api/index.html?javax/servlet/ServletRegistration.Dynamic.html) to register a [`JSP_SERVLET_CLASS`](http://tomcat.apache.org/tomcat-8.0-doc/api/org/apache/catalina/core/Constants.html#JSP_SERVLET_CLASS) Servlet for each JSP.
Use the [`initParameter`](http://docs.oracle.com/javaee/7/api/javax/servlet/Registration.html#setInitParameter-java.lang.String-java.lang.String-) `jspFile` to set the JSP filename ([ref](http://tomcat.markmail.org/thread/pg65fgqhfra7czy5))

e.g. for SpringBoot in a [`ServletContextInitializer`](http://docs.spring.io/spring-boot/docs/current/api/org/springframework/boot/context/embedded/ServletContextInitializer.html) ([ref](http://www.leveluplunch.com/blog/2014/04/01/spring-boot-configure-servlet-mapping-filters/)):

```java
@Bean
public ServletContextInitializer preCompileJspsAtStartup() {
    return servletContext -> {
        getDeepResourcePaths(servletContext, "/WEB-INF/jsp/").forEach(jspPath -> {
            log.info("Registering JSP: {}", jspPath);
            ServletRegistration.Dynamic reg = servletContext.addServlet(jspPath, Constants.JSP_SERVLET_CLASS);
            reg.setInitParameter("jspFile", jspPath);
            reg.setLoadOnStartup(99);
            reg.addMapping(jspPath);
        });
    };
}

private static Stream<String> getDeepResourcePaths(ServletContext servletContext, String path) {
    return (path.endsWith("/")) ? servletContext.getResourcePaths(path).stream().flatMap(p -> getDeepResourcePaths(servletContext, p))
            : Stream.of(path);
}
```

### At build time

Generate Java source files for each JSP and a [web.xml](http://docs.oracle.com/cd/E13222_01/wls/docs81/webapp/web_xml.html#1039287) with their servlet mappings using [JspC](http://tomcat.apache.org/tomcat-8.0-doc/api/org/apache/jasper/JspC.html) ([ref](https://tomcat.apache.org/tomcat-8.0-doc/jasper-howto.html)).
This seems faster (to compile+run) vs the start-time method.

e.g. in Maven;

```xml
<!-- Needed to get the jasper Ant task to work (putting it in the plugin's dependencies didn't work) -->
<dependency>
	<groupId>org.apache.tomcat</groupId>
	<artifactId>tomcat-catalina-ant</artifactId>
	<version>8.0.32</version>
	<scope>provided</scope>
</dependency>

<!-- ... -->

<plugin>
	<artifactId>maven-antrun-plugin</artifactId>
	<version>1.8</version>
	<executions>
		<execution>
			<id>precompile-jsp-generate-java</id>
			<!-- Can't be generate-sources because we need the compiled Henry taglib classes already! -->
			<phase>compile</phase>
			<goals>
				<goal>run</goal>
			</goals>
			<configuration>
				<tasks>
					<echo message="Precompiling JSPs"/>
					<property name="compile_classpath" refid="maven.compile.classpath"/>
					<property name="target_dir" value="${project.basedir}/generated-sources/jspc" />
					<path id="jspc_classpath">
						<path path="${compile_classpath}"/>
					</path>

					<typedef resource="org/apache/catalina/ant/catalina.tasks" classpathref="jspc_classpath"/>

					<mkdir dir="${target_dir}/java"/>
					<mkdir dir="${target_dir}/resources"/>
					<jasper
							validateXml="false"
							uriroot="${project.basedir}/src/main/webapp"
							compilertargetvm="1.8"
							compilersourcevm="1.8"
							failonerror="true"
							javaencoding="UTF-8"
							webXml="${target_dir}/resources/precompiled-jsp-web.xml"
							outputDir="${target_dir}/java/" >
					</jasper>
					<!-- Can't use Maven to compile the JSP classes because it has already compiled the app's classes
						 (needed to do that becuase JspC needs compiled app classes) -->
					<javac srcdir="${target_dir}/java" destdir="${project.build.outputDirectory}" classpathref="jspc_classpath" fork="true"/>
					<!-- Have to copy the web.xml because process-resources phase has already finished (before compile) -->
					<copy todir="${project.build.outputDirectory}">
						<fileset dir="${target_dir}/resources"/>
					</copy>
				</tasks>
			</configuration>
		</execution>
	</executions>
</plugin>
<!-- Not strictly necessary, because Ant does the compilation, but at least attempts to keep it in sync with Maven -->
<plugin>
	<groupId>org.codehaus.mojo</groupId>
	<artifactId>build-helper-maven-plugin</artifactId>
	<executions>
		<execution>
			<id>add-precompiled-jsp-java-sources</id>
			<phase>generate-sources</phase>
			<goals><goal>add-source</goal></goals>
			<configuration>
				<sources>
					<source>${project.basedir}/generated-sources/jspc/java</source>
				</sources>
			</configuration>
		</execution>
		<execution>
			<id>add-precompiled-jsp-resources</id>
			<phase>generate-resources</phase>
			<goals><goal>add-resource</goal></goals>
			<configuration>
				<resources>
					<resource>
						<directory>${project.basedir}/generated-sources/jspc/resources</directory>
					</resource>
				</resources>
			</configuration>
		</execution>
	</executions>
</plugin>
```

Then register these with the [`ServletContext`](http://docs.oracle.com/javaee/7/api/javax/servlet/ServletContext.html) (by parsing the `web.xml` with Tomcat's [`WebXmlParser`](http://tomcat.apache.org/tomcat-8.0-doc/api/org/apache/tomcat/util/descriptor/web/WebXmlParser.html), e.g. for SpringBoot:

```java
@Value("classpath:precompiled-jsp-web.xml")
private Resource precompiledJspWebXml;

@Bean
public ServletContextInitializer registerPreCompiledJsps() {
    return servletContext -> {
        // Use Tomcat's web.xml parser (assume complete XML file and validate).
        WebXmlParser parser = new WebXmlParser(false, true, true);
        try (InputStream is = precompiledJspWebXml.getInputStream()) {
            WebXml webXml = new WebXml();
            boolean success = parser.parseWebXml(new InputSource(is), webXml, false);
            if (!success) {
                throw new RuntimeException("Error parsing Web XML " + precompiledJspWebXml);
            }
            for (ServletDef def :  webXml.getServlets().values()) {
                log.info("Registering precompiled JSP: {} = {} -> {}", def.getServletName(), def.getServletClass());
                ServletRegistration.Dynamic reg = servletContext.addServlet(def.getServletName(), def.getServletClass());
                reg.setLoadOnStartup(99);
            }

            for (Map.Entry<String, String> mapping : webXml.getServletMappings().entrySet()) {
                log.info("Mapping servlet: {} -> {}", mapping.getValue(), mapping.getKey());
                servletContext.getServletRegistration(mapping.getValue()).addMapping(mapping.getKey());
            }
        } catch (IOException e) {
            throw new RuntimeException("Error registering precompiled JSPs", e);
        }
    };
}
```

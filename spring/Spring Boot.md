# Spring Boot

* Current [Ref](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/)
          ([PDF](http://docs.spring.io/spring-boot/docs/current/reference/pdf/spring-boot-reference.pdf)),
          [API](http://docs.spring.io/spring-boot/docs/current/api/index.html)

Articles

* [Demystifying Spring Boot](https://medium.com/better-programming/demystifying-spring-boot-245e71feffc0) - The basics of API development in Spring Boot
## Embedded Tomcat

* For JSP support, add `org.apache.tomcat.embed:tomcat-embed-jasper` dependency ([SO](http://stackoverflow.com/a/20602011/125246))

## [Properties / externalised configuration](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-external-config)

* Looks for properties in an ordered sequence ([ref](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-external-config))
* 

## [Profiles](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-profiles)

* Last profile specified overrides previous profiles ([ref]())
* Specify profiles on the command line: `--spring.profiles.active=env-localhost,ci` ([ref](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-profiles))
* Add profiles in a properties file: `spring.profiles.include=my-profile,my-sig-profile` ([ref](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-adding-active-profiles))
* Profile-specific properties files can be used: `appliation-{profile}.properties`, e.g. `application-my-profile.properties` ([ref](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-external-config-profile-specific-properties)), or as sub-sections in YAML ([ref](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-external-config-multi-profile-yaml)).

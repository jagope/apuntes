# Spring security in spring

## xml configuration

1. Add springSecurityFilterChain to web.xml

```xml
<filter>
  <filter-name>springSecurityFilterChain</filter-name>
  <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
</filter>

<filter-mapping>
  <filter-name>springSecurityFilterChain</filter-name>
  <url-pattern>/*</url-pattern>
  <dispatcher>REQUEST</dispatcher>
  <dispatcher>FORWARD</dispatcher>
</filter-mapping>
```

2. Create a spring security configuration file

## annotation configuration
1. Add <kbd>@EnableWebSecurity</kbd> to a configuration class that extends WebSecurityConfigurerAdapter
2. 

# Spring security in springboot

# Spring Security

## Configuration class

We have to create a configuration class that extends **WebSecurityConfigurerAdapter** class:

```java
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
  ...
}
```

We have to override de **configure** mehtod:

```java
@Override
protected void configure(HttpSecurity http) throws Exception {
  ...
}
```

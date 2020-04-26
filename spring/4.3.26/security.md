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

## @PreAuthorize

Before we can use this annotation, we must first enable global method security. This can be done in Java code by adding the <kbd>@EnableGlobalMethodSecurity</kbd>

check user role:

```java
@PreAuthorize("hasRole('ROLE_ADMIN')")
@GetMapping("/user/{id}")
public String getUser(@PathVariable("id") String id) {
    ...
}
```

check multiple roles:
@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')")
@GetMapping("/users")
public String getUsers() {
    ...
}
```

## SecurityContext

By default, Spring Security uses a thread-local copy of this class. This means each request in our application has its security context that contains details of the user making the request.

To use it, we simply call the static methods in SecurityContextHolder:
```java
Authentication auth = SecurityContextHolder.getContext().getAuthentication();
if (auth != null && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ADMIN"))) {
    ...
}
```

##  UserDetailsService
The third way we can lookup user roles in Java code is by using the UserDetailsService. This a bean we can inject anywhere into our application and call it as needed:

```java
@GetMapping("/users")
public String getUsers() {
    UserDetails details = userDetailsService.loadUserByUsername("mike");
    if (details != null && details.getAuthorities().stream()
      .anyMatch(a -> a.getAuthority().equals("ADMIN"))) {
        // ...
    }
}
```

# Spring mvc test

## mvc test with spring boot

1. Annotate the class with @WebMvcTest(<controller>.class). It disables full auto-configuration and instead apply only configuration relevant to MVC tests. The WebMvcTest annotation auto-configure MockMvc instance as well. Using <controller>.class as parameter, we are asking to initialize only one web controller and you need to provide remaining dependencies required using Mock objects.
2. Inject MockMvc dependecy:
```java
@Autowired
private MockMvc mvc;
```
3. Call to the controller inside a test:
```java
mvc.perform(MockMvcRequestBuilders.get("/employees").accept(MediaType.APPLICATION_JSON)))
      .andExpect(MockMvcResultMatchers.status().isOk())
```

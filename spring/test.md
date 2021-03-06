# Spring mvc test

## mvc test
1. Add annotations to the class:
```java
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ApplicationConfig.class })
@WebAppConfiguration
public class GreetControllerTest {
    ....
}
```

<kbd>@WebAppConfiguration:</kbd> load the web application context

2. The WebApplicationContext Object
WebApplicationContext (wac) provides the web application configuration. It loads all the application beans and controllers into the context.

We'll now be able to wire the web application context right into the test:

```java
@Autowired
private WebApplicationContext wac;
```

3. Mocking Web Context Beans
MockMvc provides support for Spring MVC testing. It encapsulates all web application beans and make them available for testing:

```java
private MockMvc mockMvc;
@Before
public void setup() throws Exception {
    this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
}
```

4. Call to the controller inside a test
```java
mvc.perform(MockMvcRequestBuilders.get("/employees").accept(MediaType.APPLICATION_JSON)))
      .andExpect(MockMvcResultMatchers.status().isOk())
      .andExpect(MockMvcResultMatchers.content().contentType(MediaType.APPLICATION_JSON))
      .andExpect(MockMvcResultMatchers.jsonPath("$.name").value("valor"));
```

## mvc test with spring boot

1. Annotate the class with @WebMvcTest(&lt;controller>.class). It disables full auto-configuration and instead apply only configuration relevant to MVC tests. The WebMvcTest annotation auto-configure MockMvc instance as well. Using &lt;controller>.class as parameter, we are asking to initialize only one web controller and you need to provide remaining dependencies required using Mock objects.
```java
@ExtendWith(SpringExtension.class)
@WebMvcTest(controllers = { GreetController.class })
public class GreetControllerTest {
    ....
}
```

2. Inject MockMvc dependecy:
```java
@Autowired
private MockMvc mvc;
```

3. Mock the business logic, @MockBean automatically replaces the bean of the same type in the application context with a Mockito mock
```java
@MockBean
private GreetService service;
```

4. Call to the controller inside a test:
```java
mvc.perform(MockMvcRequestBuilders.get("/employees").accept(MediaType.APPLICATION_JSON)))
      .andExpect(MockMvcResultMatchers.status().isOk())
```

## Profiles

Podemos usar la anotación @ActiveProfiles para activar los profiles a usar durante la ejecución de los test

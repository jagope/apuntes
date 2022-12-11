# Integration test

## springboot

1. Annotate the test class with:
```java
@SpringBootTest(classes = {TestApplication.class}, webEnvironment = WebEnvironment.MOCK)
@ActiveProfiles({"test"})
@AutoConfigureMockMvc
public class IntegrationTest {
    ....
}
```

2. Inject MockMvc bean:
```java
@Autowired
private MockMvc mvc;
```

3. Call to the endpoint inside a test:
```java
final var result = mvc.perform(MockMvcRequestBuilders.get("/employees").accept(MediaType.APPLICATION_JSON))))
```

4. Check the result
```java
result.andExpect(MockMvcResultMatchers.status().isOk();
```

## spring
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

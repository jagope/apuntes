# Test in springboot

## Test with Junit 5

To run test with Junit 5 we have to add de annotation <kdd>@ExtendWith(SpringExtension.class)</kbd>

## Test controllers

Add the <kbd>@SpringBootTest</kbd> annotation. This tell spring to load the application context

Add the <kbd>@AutoConfigureMockMvc</kbd>. Create and configure MockMvc.

Inject a <kbd>MockMvc</kbd> instance into the test:

```java
@Autowired
private MockMvc mockMvc;
```

example of test:
```java
    @Test
    @DisplayName("GET /services/secured/tipoRegla - Found")
    void findAll() throws Exception {
        mockMvc.perform(get("/services/secured/tipoRegla"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$", hasSize(1)))
                .andExpect(jsonPath("$[0].id", is(45)))
        ;
    }
```

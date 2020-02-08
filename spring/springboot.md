# Environment Specific Properties File
If we need to target different environments, there's a built-in mechanism for that in Boot.

We can simply define an “application-environment.properties” file in the “src/main/resources” directory – and then set a Spring profile with the same environment name.

For example, if we define a “staging” environment, that means we'll have to define a staging profile and then application-staging.properties.

This env file will be loaded and will take precedence over the default property file. Note that the default file will still be loaded, it's just that when there is a property collision the environment specific property file takes precedence.

# Test

## Starter

```xml
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-test</artifactId>
	</dependency>
``` 

## Auto-Configured Tests

### @DataJpaTest

### @DataMongoTest

To test MongoDB applications @DataMongoTest is a useful annotation. By default, it configures an in-memory embedded MongoDB if the driver is available through dependencies, configures a MongoTemplate, scans for @Document classes, and configures Spring Data MongoDB repositories.

The mongo embedded dependency:
```xml
<dependency>
    <groupId>de.flapdoodle.embed</groupId>
    <artifactId>de.flapdoodle.embed.mongo</artifactId>
    <scope>test</scope>
</dependency>
```

### @RestClientTest

We generally use the @RestClientTest annotation to test REST clients. It auto-configures different dependencies like Jackson, GSON, and Jsonb support, configures a RestTemplateBuilder, and adds support for MockRestServiceServer by default.

## Integration Test

Al añadir la anotación ```@SpringBootTest``` conseguimos que se levante la aplicación, ej:

```java
@SpringBootTest(classes = <ConfiguracionClass>.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
```

Con la anotación ```@LocalServerPort``` podemos recuperar el puerto en el que arranca la aplicación, ej:

```java
@LocalServerPort
private int port;
```

Accedemos a la uri con la clase ```TestRestTemplate```, ej:

```java
		HttpEntity<String> entity = new HttpEntity<String>(null, headers);

		ResponseEntity<String> response = restTemplate.exchange(
				"http://localhost:" + port + "/stats/player/1",
				HttpMethod.GET,
				entity,
				String.class);

```

## The @TestPropertySource Annotation
If we need more granular control over test properties, then we can make use of the @TestPropertySource annotation.

This allows us to set test properties for a specific test context, taking precedence over the default property sources:

```java
@ContextConfiguration
@TestPropertySource("/my-test.properties")
public class IntegrationTests {
    // tests
}
```

If we don't want to use a file, we can specify names and values directly:

```java
@ContextConfiguration
@TestPropertySource("foo=bar", "bar=foo")
public class IntegrationTests {
    // tests
}
```

## Mocking with @MockBean

# Security

## starter
```xml
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-security</artifactId>
	</dependency>
```

# Scheduling

```java
@Configuration
@EnableScheduling
public class Configuration() {
	...
}
´´´

```java
@Scheduled(fixedRate=60000)
public void method() {
	...
}
```

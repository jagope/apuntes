## Test

### Integration Test

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

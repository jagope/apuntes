# Spring REST

## Spring 4.3.x
Para que funcione correctamente es necesario establecer la anotación @EnableWebMvc o <mvc:annotation-driven /> en el xml. Enables default Spring MVC configuration and registers Spring MVC infrastructure components expected by the DispatcherServlet. Use this annotation on an @Configuration class. In turn that will import DelegatingWebMvcConfiguration, which provides default Spring MVC configuration. Y para que devuelva los resultados en json es necesario añadir las siguientes dependencias:
```xml
<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-core</artifactId>
    <version>${jackson-version}</version>
</dependency>

<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-databind</artifactId>
    <version>${jackson-version}</version>
</dependency>
```

## Directly expose Repository as Rest path
We can create an application that accesses relational JPA data through a hypermedia-based RESTful front end.

We create an entity:

```java
@Entity
public class Person {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	private String firstName;
	private String lastName;
    ...
}
```

and the repository:

```java
@RepositoryRestResource(collectionResourceRel = "people", path = "people")
public interface PersonRepository extends PagingAndSortingRepository<Person, Long> {

	List<Person> findByLastName(@Param("name") String name);
}
```

At runtime, Spring Data REST will create an implementation of this interface automatically. Then it will use the @RepositoryRestResource annotation to direct Spring MVC to create RESTful endpoints at /people. Spring Data REST uses the HAL format for JSON output.

Now, we can get, put, post, ...:
```sh
$ curl http://localhost:8080/people
```

```sh
 curl -i -X POST -H "Content-Type:application/json" -d "{  \"firstName\" : \"Frodo\",  \"lastName\" : \"Baggins\" }" http://localhost:8080/people
 ```
 
 References: https://spring.io/guides/gs/accessing-data-rest/

## Versioning

There are four popular approaches to versioning a REST API:

* URI versioning
* URI parameter versioning
* Accept header versioning

### URI versioning

The version becomes part of the URI, for example: http://api.example.org/v1/users

### URI parameter versioning

The version is specified as a URI request parameter, for example: http://api.example.org/users?v=2

### Accept header versioning

This versioning approach use the accept header, using a custom media type, for example: **application/vnd.example.v3+json**


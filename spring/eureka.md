# Eureka

## Eureka server

1. Create a new project from https://start.spring.io/. Select **Eureka Server** dependencies

1. For java 9 and after we need add jaxb-api as a dependency because they are no longer bundle in than versions

```xml
		<dependency>
			<groupId>javax.xml.bind</groupId>
			<artifactId>jaxb-api</artifactId>
		</dependency>
 ```
1. Add @EnableEurekaServer annotation in main class

1. Configure properties.yml:

```yml
eureka:
  client:
    registerWithEureka: false
    fetchRegistry: false
```

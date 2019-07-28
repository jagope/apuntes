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

## Eureka client

1. Add the dependencies
	```xml
	<dependency>
		<groupId>org.springframework.cloud</groupId>
		<artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
	</dependency>

	<dependencyManagement>
		<dependencies>
			<dependency>
				<groupId>org.springframework.cloud</groupId>
				<artifactId>spring-cloud-dependencies</artifactId>
				<version>Finchley.SR2</version>
				<type>pom</type>
				<scope>import</scope>
			</dependency>
		</dependencies>
	</dependencyManagement>
	```
1. Add @EnableDiscoveryClient annotation in main class

1. Configure properties.yml:

	```yml
	eureka:
	  client:
	    serviceUrl:
	      defaultZone: http://localhost:1111/eureka/
	```
1. Discover client
	```java
	@Autowire
	private DiscoveryClient discoveryClient;
	
	...
	
	this.discoveryClient.getInstances(applicationName);
	```

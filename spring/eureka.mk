# Eureka

## Eureka server

1. Create a new project from https://start.spring.io/. Select ***Spring Web Starter*** and Eureka Server dependencies

2. Add @EnableEurekaServer annotation in main class

3. Configure properties.yml:

```yml
eureka:
  client:
    registerWithEureka: false
    fetchRegistry: false
```

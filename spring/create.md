# Generate application

Generate the base project with the [spring initializer](https://start.spring.io/)

# Define the API

Define the API with the [Open Api Specification](https://swagger.io/specification/). We can use the [swagger editor](https://editor.swagger.io/)

## Generating code
Add the yml file with the API definition to the project. Add the [Open API maven generator plugin](https://github.com/OpenAPITools/openapi-generator/tree/master/modules/openapi-generator-maven-plugin) to the pom.xml

```xml
<plugin>
  <groupId>org.openapitools</groupId>
  <artifactId>openapi-generator-maven-plugin</artifactId>
  <version>5.0.0</version>
  <executions>
    <execution>
      <goals>
        <goal>generate</goal>
      </goals>
    </execution>
  </executions>
  <configuration>
    <inputSpec>${project.basedir}/src/main/resources/api-definition/openapi.yaml</inputSpec>
    <generatorName>spring</generatorName>
    <apiPackage>es.jgp.api</apiPackage>
    <modelPackage>es.jgp.api.dto</modelPackage>
  </configuration>
</plugin>
```

add the needed dependencies

```xml
<dependency>
  <groupId>javax.validation</groupId>
  <artifactId>validation-api</artifactId>
</dependency>
<dependency>
  <groupId>io.springfox</groupId>
  <artifactId>springfox-swagger2</artifactId>
  <version>2.9.2</version>
</dependency>
<dependency>
  <groupId>org.openapitools</groupId>
  <artifactId>jackson-databind-nullable</artifactId>
  <version>0.2.2</version>
</dependency>
<dependency>
  <groupId>io.swagger.core.v3</groupId>
  <artifactId>swagger-annotations</artifactId>
  <version>2.1.12</version>
</dependency>
```

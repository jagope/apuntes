# Generate application

Generate the base project with the [spring initializer](https://start.spring.io/)

# Define the API

Define the API with the [Open Api Specification](https://swagger.io/specification/). We can use the [swagger editor](https://editor.swagger.io/)

## Generating code
Add the yml file with the API definition to the project.

Choose between [Swagger Codegen](https://github.com/swagger-api/swagger-codegen/blob/3.0.0/modules/swagger-codegen-maven-plugin/README.md) or [Open API maven generator plugin](https://github.com/OpenAPITools/openapi-generator/tree/master/modules/openapi-generator-maven-plugin) to generate REST server APIs. Anyways add the plugin configuraion to the pom.xml file.

Example of swagger codegen configuration:

```xml
<plugin>
    <groupId>io.swagger.codegen.v3</groupId>
    <artifactId>swagger-codegen-maven-plugin</artifactId>
    <version>3.0.31</version>
    <dependencies>
        <dependency>
            <groupId>com.github.jknack</groupId>
            <artifactId>handlebars</artifactId>
            <version>4.3.0</version>
        </dependency>
    </dependencies>
    <executions>
        <execution>
            <goals>
                <goal>generate</goal>
            </goals>
        </execution>
    </executions>
    <configuration>
        <inputSpec>${project.basedir}/src/main/resources/api-definition/openapi.yml</inputSpec>
        <language>spring</language>
        <apiPackage><base_package>.api</apiPackage>
        <modelPackage><base_package>.api.dto</modelPackage>
        <configOptions>
            <interfaceOnly>true</interfaceOnly>
            <dateLibrary>java8</dateLibrary>
        </configOptions>
    </configuration>
</plugin>
```
Note: with the 3.0.31 an error is produced, this error can be solved forcing to use an updated version of handlebars

Open API [config options for spring](https://openapi-generator.tech/docs/generators/spring/)

## Show de api

Add springdoc dependency to the project, this add the endpoint /swagger-ui/index.html

```xml
<dependency>
    <groupId>org.springdoc</groupId>
    <artifactId>springdoc-openapi-ui</artifactId>
    <version>1.6.3</version>
</dependency>
```

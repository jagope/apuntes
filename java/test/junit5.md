# JUnit 5

JUnit 5 requires Java 8 (or higher) at runtime. However, you can still test code that has been compiled with previous versions of the JDK.

## Use in spring boot

### How to configure

Exclude junit in the spring-boot-starter-test, and include the JUnit 5 jupiter engine dependency

```xml
<dependencies>
  ...
  <dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-test</artifactId>
    <scope>test</scope>
    <exclusions>
      <exclusion>
        <groupId>junit</groupId>
        <artifactId>junit</artifactId>
      </exclusion>
    </exclusions>
  </dependency>

  <dependency>
    <groupId>org.junit.jupiter</groupId>
    <artifactId>junit-jupiter-engine</artifactId>
    <version>${junit-jupiter.version}</version>
    <scope>test</scope>
  </dependency>
  ...
</dependecies>
```

### How to write test

The test has to be annotated with @ExtendWith(SpringExtension.class)

```java
@ExtendWith(SpringExtension.class)
public class ClassTest {
  ...
}
```

## Tags

### Test

### BeforeEach

### BeforeAll

### AfterEach

### AfterAll

### Disabled

No ejecuta el test. Se puede establecer a nivel de clase o de método. Permite definir una descripción

### DisplayName

Al ejecutar el test muestra esta descripción en vez del nombre del método

### Conditional execution

#### EnabledOnOs(&lt;OS>) DisabledOnOs(&lt;OS>)

#### EnabledOnJre(&lt;jre>) DiabledOnJre(&lt;jre>)

#### EnabledIfSystemProperty(&lt;name>, &lt;match>) DiabledIfSystemProperty(&lt;name>, &lt;match>)
  
#### EnabledIfEnvironmentVariable(&lt;name>, &lt;match>) DisabledIfEnvironmentVariable(&lt;name>, &lt;match>)

#### EnabledIf(&lt;condition>) DisabledIf(&lt;condition>)
  
  
## Assertions

### grouped assertions

```java
assertAll(
  () -> assertEquals(<expected>, <realValue>),
  () -> assertEquals(<expected>, <realValue>),
  ...
);
```

### assert exceptions

```java
assertThrows(<Exception>.class, <Executable>);
```

### assert timeout
```java
assertTimeout(<Duration>, <Executable>);

assertTimeoutPreemptively(<Duration>, <Executable>);
```

## Assumptions

Sirve para comprobar ciertas premisas, si no se cumplen aborta el test

Por ejemplo:
```java
assumeTrue("PRE".equals(System.getEnv("environment"));
```

# JUnit 5

## Use in spring boot

### How to write test

The test has to be annotated with @ExtendWith(SpringExtension.class)

```java
@ExtendWith(SpringExtension.class)
public class ClassTest {
  ...
}
```

## Annotations

### Test

### BeforeEach

### BeforeAll

### AfterEach

### AfterAll

### Disabled

No ejecuta el test. Se puede establecer a nivel de clase o de método. Permite definir una descripción

### DisplayName

Al ejecutar el test muestra esta descripción en vez del nombre del método

### Tag
Permite ejecutar solamente los test con cierto tag. Se puede establecer a nivel de clase o de método. Permite definir una etiqueta

### Nested
Se puede declarar una clase interna dentro del test, que se anotará con @Nested. Al ejecutar el test los resultados tendrán forma de árbol.

### Conditional execution

#### EnabledOnOs(&lt;OS>) DisabledOnOs(&lt;OS>)

#### EnabledOnJre(&lt;jre>) DiabledOnJre(&lt;jre>)

#### EnabledIfSystemProperty(&lt;name>, &lt;match>) DiabledIfSystemProperty(&lt;name>, &lt;match>)
  
#### EnabledIfEnvironmentVariable(&lt;name>, &lt;match>) DisabledIfEnvironmentVariable(&lt;name>, &lt;match>)

#### EnabledIf(&lt;condition>) DisabledIf(&lt;condition>)

### TestMethodOrder
Permite definir el orden en que se ejecutan los test. Uno de los métodos es por orden OrderAnnotation.class. El orden se especifica anotando cada método con la anotación @Order
  
## Parameterized test - value source

Hay que añadir la siguiente depencencia
```xml
<dependency>
  <groupId>org.junit.jupiter</groupId>
  <artifactId>junit-jupiter.params</artifactId>
  <version>${junit-platform.version}</version>
</dependency>
```

Hay que anotar el test con @ParameterizedTest, y se le pueden parametros desde distintas fuentes: 
@ValueSource(strings = {"", "", ...})
@EnumSource(&lt;Enum&gt;.class)
@CsvSource({"value11, value12, value13", "value21, value22, value33", ... })
@CsvFileSource(resources = "/file.csv")
@MethodSource("&lt;methodNamem&gt;)
@ArgumentsSource(&lt;class&gt;.class)

```java
@ParameterizedTest
@ValueSurce(string = {"", "", ""})
void test(String value) {
  ...
}
```

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
import org.junit.jupiter.api.function.Executable;

final Executable executable = () -> ...;
assertThrows(<Exception>.class, executable);
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

## ExtendWith
Allow to extend the behavior of test classes and methods.

To implement an extension you have to implement of of the following interfaces:
* TestInstancePostProcessor - executed after the test has been created, can be used to inject dependencies into the test instance
* ExecutionCondition - used to disable tests based on conditions
* ParameterResolver - used to resolve parameters for test methods
* TestExecutionExceptionHandler - used to handle exceptions

You can also add lifecycle callbacks: * BeforeAllCallback / AfterAllCallback - executed before / after all test methods in the test class * BeforeEachCallBack / AfterEachCallback – executed before / after each test method

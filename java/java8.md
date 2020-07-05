# java 8

## Lambda expressions

* Lambda expressions can be used anywhere the type is a functional interface
* The Lambda expression provides the implementation of the single abstract method of the functional interface

### Functional interface
* A functional interface has only one abstract method
* @FunctionalInterface annototion

#### Functional interface in the java.util.function package

##### Consumer<T>

Operation that takes a single value and returns no result

```java
String s -> System.out.println(s)
```

##### BiConsumer<T>

Operation that takes two valuea and returns no result

```java
(k, v) -> System.out.println("key: " + k + ", value: " + v)
```

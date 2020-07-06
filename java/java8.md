# java 8

## Intefaces

### Default methods

Permite definir una implementación de un método por defecto. La clase que implemente el interfaz no está obligada a sobreescribir los métodos default.

```java
public interface MyIF {
    default int getDefaultNumber() {
       return 0;
    }
}  
```

### Static methods

Actua de la misma forma que un metodo estatico definido en una clase. No es heredado por una clase que implemente el interfaz o por un subinterfaz.

```java
public interface MyIF {
    static int getDefaultNumber() {
        return 0;
    }
}

...
MyIF.getDefaultNumber();
...
```

## Lambda expressions

* Lambda expressions are anonymous functions, which are like methods but without a class
* Lambda expressions can be used anywhere the type is a functional interface
* The Lambda expression provides the implementation of the single abstract method of the functional interface
* Body of the Lambda may throw exceptions
* Single line Lambdas do not need braces and do not need an explicit return statement
* Lambdas with a single parameter do not need brackets
* Lambdas with no parameters must have empty brackets

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

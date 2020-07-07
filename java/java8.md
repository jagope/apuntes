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
* Can be used anywhere the type is a functional interface
* The Lambda expression provides the implementation of the single abstract method of the functional interface
* Body of the Lambda may throw exceptions
* Single line Lambdas do not need braces and do not need an explicit return statement
* Lambdas with a single parameter do not need brackets
* Lambdas with no parameters must have empty brackets
* Can refer to effectively final local variables from the surrounding scope

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

Operation that takes two values and returns no result

```java
(k, v) -> System.out.println("key: " + k + ", value: " + v)
```

##### Supplier

The opposite of a consumer

```java
() -> callToAMethod()
```

##### Function<T,R>

A function that accepts one argument and return a result. Type of argument and result may be diferent.

```java
student s -> s.getName()
```

##### BiFunction<T,U,R>

A function that accepts two arguments and return a result.

```java
(String name, student s) -> new Teacher(name, s)
```

##### UnaryOperator<T>

Specialised form of Function, accepts one argument and return a result of the sime type.

```java
String s -> s.toLowerCase()
```

##### BinaryOperator<T>

Specialised form of BiFunction, accepts two arguments and return a result, all of the same type.

```java
(String x, String y) -> x + y
```

##### Predicate

A boolean valued Function of one argument

```java
Student s -> s.graduationYear == 2011
```

##### BiPredicate

A boolean valued Function of two arguments

```java
(path, attr) -> String.valueOf(path).endsWith(".js") && attr.size() > 1024
```

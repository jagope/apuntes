# Java 10

## Var

Podemos utilizar var para crear objetos sin tener que definir el tipo, cuando asignamos un valor a la variable,
el tipo de la expresión define el tipo de la variable.

```java
var list = List.of(1, 2, 3);
var example = "example";
var team = new Team();
```

## New Methods for Collections

### copyOf

 para crear copias inmutables de List, Set y Map. Al igual que con el método of(), tendremos una UnsupportedOperationException si intentamos añadir elementos
 
 ```java
 List<Integer> listCopyOf = List.copyOf(list);
Set<String> setCopyOf = Set.copyOf(set);
Map<String, String> mapCopyOf = Map.copyOf(map)
```

### toUnmodifiable

se han añadido los métodos toUnmodificableList(), toUnmodificableSet() y toUnmodificableMap() a la clase Collectors para hacer las colecciones inmutables

````java
List toUnmodifiableList = Stream.of("a", "b", "c").collect(toUnmodifiableList());
Set toUnmodifiableSet = Stream.of("g", "h", "i").collect(Collectors.toUnmodifiableSet());
Map<Integer, Integer> toUnmodifiableMap = Stream.of(1, 2, 3).collect(toUnmodifiableMap(
        num -> num,
        num -> num * 4));
```


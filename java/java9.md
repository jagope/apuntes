# Java 9

## Modularización
Los módulos permiten la encapsulación en tiempo de compilación, de esta forma podemos restringir el acceso a una serie de paquetes.

Para definir los módulos es necesario definir el fichero module-info.java en la raiz del código fuente. Este fichero puede tener una estructura parecida al siguiente:

```java
module com.autentia.tutoriales.java11 {
    exports com.autentia.tutoriales.java11.exports;
    requires com.autentia.tutoriales.optional;
    requires com.autentia.tutoriales.interfaces;
}
```

Si alguien intenta usar otra clase de com.autentia.tutoriales.java11 que no estén dentro de com.autentia.tutoriales.java11.exports daría error de compilación. Además indico que el código de com.autentia.tutoriales.java11 requiere el código de los paquetes com.autentia.tutoriales.optional y com.autentia.tutoriales.interfaces para poder compilar.

hay más funcionalidades que podemos usar:

open module, para tener el módulo accesible por reflexión.

```java
open module com.autentia.tutoriales.java11 {
    exports com.autentia.tutoriales.java11.exports;
    requires com.autentia.tutoriales.optional;
    requires com.autentia.tutoriales.interfaces;
}
```
exports (package) to (package), para poder usar solo las clases de un paquete desde otro paquete concreto. Si además queremos exportar un paquete pero que solo se pueda usar dentro de otro paquete concreto, podríamos poner:

```java
module com.autentia.tutoriales.java11 {
    exports com.autentia.tutoriales.java11.exports;
            to com.autentia.tutoriales.java12;
    requires com.autentia.tutoriales.optional;
    requires com.autentia.tutoriales.interfaces;
}
```

requires transitive equivale a hacer require de los módulos que requiere otro módulo. Si el módulo com.autentia.tutoriales.optional requiere com.autentia.tutoriales.interfaces podríamos haber puesto:

```java
module com.autentia.tutoriales.java11 {
    exports com.autentia.tutoriales.java11.exports;
    requires transitive com.autentia.tutoriales.optional;
}
```

## Factory Methods for Collections

```java
List<Point> list = List.of(new Point(1, 1), new Point(2, 2));

Set<Point> set = Set.of(new Point(1, 1), new Point(2, 2));

Map<String, Integer> nameToAge = Map.of("Richard", 49, "Raoul", 47);

Map<String, Integer> nameToAge = Map.ofEntries(entry("Richard", 49), entry("Raoul", 47));
```

These collections are immutable




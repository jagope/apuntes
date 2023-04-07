# Java 7

## Clase Objects

La clase Objects nos ofrece los m&eacute;todos:
* <code>static boolean equals(Object a, Object b)</code>
* <code>static int hash(Object... values)</code>
* <code>static int hashCode(Object o)</code>

que nos ayudaran a simplificar los m&eacute;todos equals y hashCode

```java
@Override
public boolean equals( Object obj ) {
    if ( obj == null ) {
        return false;
    }
        
    if ( this == obj ) {
        return true;
    }
        
    if ( getClass() != obj.getClass() ) {
        return false;
    }
        
    final PersonObjects other = (PersonObjects) obj;
    if( !Objects.equals( email, other.email ) ) {
        return false;
    } else if( !Objects.equals( firstName, other.firstName ) ) {
        return false;            
    } else if( !Objects.equals( lastName, other.lastName ) ) {
        return false;            
    }
        
    return true;
}

@Override
public int hashCode() {
    return Objects.hash( email, firstName, lastName );
}  
```

## Diamond operator

```java
final Map< String, Collection< String > > map = new HashMap<>();
```
The compiler is able to infer the generics type parameters from the left side and allows omitting them in the right side of the expression

## Underscores in literals
Numerical literals can contain underscore charactets (\_) to improve the readability of code by separating digits of a literal into significant groups at almost any arbitrary place.

```java
long debitCard = 1234_5678_9876_5432L;
long amount = 1_000_000; 
```

## try-with-resources
Allows us to declare resources to be used in a try block with the assurance that the resources will be closed after the execution of that block. The resources declared need to implement the AutoCloseable interface.

```java
try (PrintWriter writer = new PrintWriter(new File("test.txt"))) {
    writer.println("Hello World");
}
```

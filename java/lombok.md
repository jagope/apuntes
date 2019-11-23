# Lombok

## Accesors

It's pretty typical to have get and set methods in our domain objects, but there are other ways that we may find more expressive.

### Standar accesors

Lombok add typical getter and setter methods.

```java
@Getter
@Setter
public class StandardAccount {
    private String name;
    private BigDecimal balance;
}

...

new StandardAccount().setName("Standard account");
```

### Fluent accesors

The fluent option gives us accessors that don't have a get or set prefix.

```java
@Accessors(fluent = true)
@Getter
@Setter
public class FluentAccount {
    private String name;
    private BigDecimal balance;
}

. . .

new FluentAccount().name("Fluent Account");
```

### Chained accesors

The chain option gives us setters that return this. Again note that it defaults to true.
This means we can chain multiple set operations together in one statement.

```java
@Accessors(chain = true)
@Getter
@Setter
public class FluentAccount {
    private String name;
    private BigDecimal balance;
}

new FluentAccount().setName("Fluent Account").setBalance(BigDecimal.TEN);
```

## Configuration properties

We can set a project- or directory-wide default for our favorite combination of settings by adding configuration properties to a lombok.config file:

```
lombok.accessors.chain=true
lombok.accessors.fluent=true
```

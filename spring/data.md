# @Query

In order to define SQL to execute for a Spring Data repository method, we can annotate the method with the @Query annotation — its value attribute contains the JPQL or SQL to execute.

## JPQL
By default, the query definition uses JPQL.

```java
@Query("SELECT u FROM User u WHERE u.status = 1")
Collection<User> findAllActiveUsers();
```

## Native
We can use native SQL to define our query setting nativeQuery attribute to true and define the native SQL query in the value attribute of the annotation:

```java
@Query( value = "SELECT * FROM USERS u WHERE u.status = 1", nativeQuery = true)
Collection<User> findAllActiveUsersNative();
```

## Named Parameters
We can pass method parameters to the query using named parameters. We define these using the @Param annotation inside our repository method declaration. Each parameter annotated with @Param must have a value string matching the corresponding JPQL or SQL query parameter name.

```java
@Query("SELECT u FROM User u WHERE u.status = :status and u.name = :name")
User findUserByStatusAndNameNamedParams(@Param("status") Integer status, @Param("name") String name);
```
```java
@Query("SELECT u FROM User u WHERE u.name IN :names")
List<User> findUserByNameList(@Param("names") Collection<String> names);
```

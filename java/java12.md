# Java 12

## Switch

switch has become an expresion which evaluates the contents of the switch to produce a result. It does not impact backward compatibility.

```java
int numLetters = switch (day) {
   case MONDAY, FRIDAY, SUNDAY -> 6;
   case TUESDAY -> 7;
   case THURSDAY, SATURDAY -> 8;
   case WEDNESDAY -> 9;
   default -> throw new IllegalStateException("Huh? " + day);
};
```

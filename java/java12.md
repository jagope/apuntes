# Java 12

## Switch

Switch has become an expresion which evaluates the contents of the switch to produce a result. It does not impact backward compatibility.
This is a preview feature, so be aware that it may change in future releases. Until it’s stabilized, don’t bet too much of your internal code on it and never publish code that uses it. To use it in experiments, add --enable-preview to compiler and JVM commands

```java
int numLetters = switch (day) {
   case MONDAY, FRIDAY, SUNDAY -> 6;
   case TUESDAY -> 7;
   case THURSDAY, SATURDAY -> 8;
   case WEDNESDAY -> 9;
   default -> throw new IllegalStateException("Huh? " + day);
};
```

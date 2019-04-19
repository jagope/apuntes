# Java 9

## Factory Methods for Collections

```java
List<Point> list = List.of(new Point(1, 1), new Point(2, 2));

Set<Point> set = Set.of(new Point(1, 1), new Point(2, 2));

Map<String, Integer> nameToAge = Map.of("Richard", 49, "Raoul", 47);

Map<String, Integer> nameToAge = Map.ofEntries(entry("Richard", 49), entry("Raoul", 47));
```

These collections are immutable




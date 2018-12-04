## Singleton

The main idea of it is to ensure that only one single instance of the class could be created at any given time.

```java
public class <class_name> {

	private static <class_name> instance;

	static {
		instance = new <class_name>();
	}
	
	public static <class_name> getInstance() {
		return instance;
	}
}
```

```java
public enum <enum_name> {
	INSTANCE
}
```

## Builder
```java

```
## Factory
## Dependency injection

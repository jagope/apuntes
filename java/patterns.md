## Singleton

The main idea of it is to ensure that only one single instance of the class could be created at any given time.

#### Static block initialisation
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

#### Lazy Initialisation
```java
public class <class_name> {
	    private static <class_name> instance; 
	    private <class_name>() {} 
	  
	    public static <class_name> getInstance()  {
	    	if (instance == null) 
	            instance = new <class_name>(); 
	        return instance; 
	    } 
	
}
```

#### Thread Safe Singleton
```java
public enum <enum_name> {
	INSTANCE
}
```

## Builder

Builder design pattern is a creational design pattern it means its solves the problem related to creation of object.

```java

```
## Factory

## Dependency injection

## Adapter pattern
An Adapter pattern acts as a connector between two incompatible interfaces that otherwise cannot be connected directly. An Adapter wraps an existing class with a new interface so that it becomes compatible with the client’s interface.

The main motive behind using this pattern is to convert an existing interface into another interface that the client expects.

Example:
![Adapter model example](https://github.com/jagope/apuntes/blob/master/java/patterns_images/adapter.jpg)

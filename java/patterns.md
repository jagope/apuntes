# Table of Contents
1. [Creational Patterns](#creational)
2. [Structural Patterns](#structural)


# Creational Patterns <a name="creational"></a>
Creational patterns deal with the creation of objects.

## The Prototype Pattern
A Prototype represents a fully initialized instance, to be copied or cloned.

## The Singleton pattern

The main idea of it is to ensure that only one single instance of the class could be created at any given time.

### Types of instantiation:

#### Eager/early instantiation

Instantiated while the class gets loaded.

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

#### Lazy instantiation

Instantiation is delayed until the caller method needs the singleton instance.

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

## The Builder Pattern

The Builder Pattern separates object construction from its representation.

```java
public class Coffee {
    class Coffee {
        private Coffee(Builder builder) {
            this.type = builder.type;
	    ...
        }

        private String type;
	...

        public static class Builder {
            private String type;
	    ...

	    public Builder sugar(String type) {
                this.type = type;
                return this;
            }
	    ...

            public Coffee build() {
                return new Coffee(this);
            }
        }

    }

    public static void main(String[] args) {
        Coffee coffee = new Coffee.Builder().type(true).build();
    }
}
```

## The Factory Pattern

The intent of the Factory Method pattern is to create a family of object types. It set an interface to produce an object, but allow sub classes to determine which class to instantiate. Factory method allows a class to delegate to sub classes

# Structural Patterns <a id="structural"></a>
Structural patterns deal with the composition of objects.

## The Proxy Pattern
A Proxy is an object that represents another object.

## The Decorator Pattern
The Decorator pattern allows us to add responsibilities to objects, dynamically.

## The Facade Pattern
A Facade is a single class that represents an entire subsystem.

## Adapter pattern

An Adapter pattern acts as a connector between two incompatible interfaces that otherwise cannot be connected directly. An Adapter wraps an existing class with a new interface so that it becomes compatible with the client’s interface.

The main motive behind using this pattern is to convert an existing interface into another interface that the client expects.

Example:

![Adapter pattern class diagram](https://github.com/jagope/apuntes/blob/master/java/patterns_images/adapter.jpg)

# Behavioral Patterns
Behavioral patterns focus more on the behavior of objects, or more precisely, interactions between objects.

## Dependency injection



## Visitor

Allows for one or more operation to be applied to a set of objects at runtime, decoupling the operations from the object structure.

```java
public interface Visitable {
  public void accept(Visitor visitor);
}
 
public class Book implements Visitable {
   .......
   @Override public void accept(Visitor visitor) {visitor.visit(this)};
   .......
}
 
public class Cd implements Visitable {
   .......
   @Override public void accept(Visitor visitor) {visitor.visit(this)};
   .......
}
 
interface Visitor {
   public void visit(Book book);
   public void visit(Magazine magazine);
   public void visit(Cd cd);
}
```

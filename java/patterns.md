# Table of Contents <a id="menu"></a>
1. [Creational Patterns](#creational)
	* [The Prototype Pattern](#prototype)
	* [The Singleton pattern](#singleton)
	* [The Builder Pattern](#builder)
	* [The Factory Pattern](#factory)
	* [Abstract Factory Pattern](#abstractFactory)
2. [Structural Patterns](#structural)
	1. [The Proxy Pattern](#proxy)
	2. [The Decorator Pattern](#decorator)
	3. [The Facade Pattern](#facade)
	4. [The Adapter pattern](#adapter)
	5. Bridge
	6. Composite
	7. Flyweight
3. [Behavioral Patterns](#behavioral)
	1. [Dependency injection](#dependecy)
	2. [Visitor](#visitor)
	4. Chain of responsibility
	5. Command
	8. Interpreter
	9. Iterator
	10. Mediator
	11. Memento
	12. Observer
	13. State
	14. Strategy
	15. Template Method
	

# Creational Patterns <a id="creational"></a>

Creational patterns deal with the creation of objects.

## The Prototype Pattern <a id="prototype"></a>
Specify the kinds of objects to create using a prototypical instance, and create new objects by copying this prototype.

[Table of Contents](#menu)

## The Singleton pattern <a id="singleton"></a>

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

[Table of Contents](#menu)

## The Builder Pattern <a id="builder"></a>

Separate the construction of a complex object from its representation so that the same construction process can create different representations.

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

[Table of Contents](#menu)

## The Factory Pattern <a id="factory"></a>

Define an interface for creating an object, but let subclasses decide which class to instantiate. The Factory method lets a class defer instantiation it uses to subclasses.

```java
public abstract class CocheFactory {
	public Coche crea () {
		Coche coche = creaCoche();

		...

		return coche;
	}

	protected abstract Coche creaCoche();
}

public class CocheInglesFactory extends CocheFactory {
	protected Coche creaCoche() {
		return new CochePilotoDerecha();
	}
}

CocheFactory factory = new CocheInglesFactory();
Coche coche = factory.crea();
```

## The Abstract Factory Pattern <a id="abstractFactory"></a>

Provide an interface for creating families of related or dependent objects without specifying their concrete classes.

```java
public interface RepositorioAlumnos {
	public List<String> listaAlumnos();
}

public class RepositorioAlumnosRelacional implements RepositorioAlumnos { ... }

public class RepositorioAlumnosNoSQL implements RepositorioAlumnos { ... }

public interface AbstractFactory {
	RepositorioAlumnos createRepositorioAlumnos();
}

public class FactoryRelacional implements AbstractFactory {
	@Override
	public RepositorioAlumnos createRepositorioAlumnos() {
		return new RepositorioAlumnosRelacional();
	}
}
```

[Table of Contents](#menu)

(#abstractFactory)

# Structural Patterns <a id="structural"></a>
Structural patterns deal with the composition of objects.

## The Proxy Pattern
A Proxy is an object that represents another object.

[Table of Contents](#menu)

## The Decorator Pattern
The Decorator pattern allows us to add responsibilities to objects, dynamically.

[Table of Contents](#menu)

## The Facade Pattern
A Facade is a single class that represents an entire subsystem.

[Table of Contents](#menu)

## Adapter pattern

An Adapter pattern acts as a connector between two incompatible interfaces that otherwise cannot be connected directly. An Adapter wraps an existing class with a new interface so that it becomes compatible with the client’s interface.

The main motive behind using this pattern is to convert an existing interface into another interface that the client expects.

Example:

![Adapter pattern class diagram](https://github.com/jagope/apuntes/blob/master/java/patterns_images/adapter.jpg)

[Table of Contents](#menu)

# Behavioral Patterns <a id="behavioral"></a>
Behavioral patterns focus more on the behavior of objects, or more precisely, interactions between objects.

## Dependency injection

[Table of Contents](#menu)

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

[Table of Contents](#menu)

# Table of Contents <a id="menu"></a>
1. [Creational Patterns](#creational)
	* [The Prototype Pattern](#prototype)
	* [The Singleton Pattern](#singleton)
	* [The Builder Pattern](#builder)
	* [The Factory Method Pattern](#factory)
	* [Abstract Factory Pattern](#abstractFactory)
2. [Structural Patterns](#structural)
	* [The Proxy Pattern](#proxy)
	* [The Decorator Pattern](#decorator)
	* [The Facade Pattern](#facade)
	* [The Adapter pattern](#adapter)
	* [The Bridge Pattern](#bridge)
	* [The Composite Pattern](#composite)
	* [The Flyweight Pattern](#flyweight)
3. [Behavioral Patterns](#behavioral)
	* [Dependency injection](#dependecy)
	* [Visitor](#visitor)
	* [Chain of responsibility](#chain)
	* [Command](#command)
	* [Interpreter](#interpreter)
	* [Iterator](#iterator)
	* [Mediator](#mediator)
	* [Memento](#memento)
	* [Observer](#observer)
	* [State](#state)
	* [Strategy](#strategy)
	* [Template Method](#template)
	

# Creational Patterns <a id="creational"></a>

Creational patterns deal with the creation of objects.

## The Prototype Pattern <a id="prototype"></a>

Specify the kinds of objects to create using a prototypical instance, and create new objects by copying this prototype.

[Table of Contents](#menu)

## The Singleton pattern <a id="singleton"></a>

Ensure a class only has one instance, and provide a global point of access to it.

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

## The Factory Method Pattern <a id="factory"></a>

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

# Structural Patterns <a id="structural"></a>

Structural patterns deal with the composition of objects.

## The Proxy Pattern <a id="proxy"></a>

Provide a surrogate or placeholder for another object to control access to it.

[Table of Contents](#menu)

## The Decorator Pattern <a id="decorator"></a>

Attach additional responsibilities to an object dynamically. Decorators provide a flexible alternative to subclassing for extending functionality.

Example:
```java
public interface Cafe {
	public String descripcion();
	public int precio();
}

public class CafeCorto implements Cafe {
	public String descripcion() {
		return "cafe corto";
	}
	public int precio() {
		return 90;
	}
}

public class ConLeche implements Cafe {
	
	private Cafe cafe;
	
	public ConLeche(Cafe cafe) {
		this.cafe = cafe;
	}
	
	@Override
	public String descripcion() {
		return cafe.descripcion() + " con leche";
	}
	
	@Override
	public int precio() {
		return cafe.precio() + 20;
	}
}

new ConLeche(new CafeCorto());
```

[Table of Contents](#menu)

## The Facade Pattern <a id="facade"></a>

Provide a unified interface to a set of interfaces in a subsystem. Facade defines a higher-level interface that makes the subsystem easier to use.

[Table of Contents](#menu)

## Adapter pattern <a id="adapter"></a>

Convert the interface of a class into another interface clients expect. Adapter lets classes work together that couldn’t otherwise because of incompatible interfaces. Aka Wrapper

Example:

![Adapter pattern class diagram](https://github.com/jagope/apuntes/blob/master/java/patterns_images/adapter.jpg)

[Table of Contents](#menu)

## The Composite Pattern <a id="composite"></a>

Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions of objects uniformly.

![Composite pattern class diagram](https://github.com/jagope/apuntes/blob/master/java/patterns_images/composite.png)

[Table of Contents](#menu)

## The Flyweight Pattern <a id="flyweight"></a>

Use sharing to support large numbers of fine-grained objects efficiently.

[Table of Contents](#menu)

# Behavioral Patterns <a id="behavioral"></a>
Behavioral patterns focus more on the behavior of objects, or more precisely, interactions between objects.

## Dependency injection

[Table of Contents](#menu)

## The Visitor Pattern <a id="visitor"></a>

Represent an operation to be performed on the elements of an object structure. Visitor lets you define a new operation without changing the classes of the elements on which it operates.

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

## The Chain of Responsability Pattern <a id="chain"></a>

Avoid coupling the sender of a request to its receiver by giving more than one object a chance to handle the request. Chain the receiving objects and pass the request along the chain until an object handles it

[Table of Contents](#menu)

## The Command Pattern <a id="command"></a>

Encapsulate a request as an object, thereby letting you parameterize clients with different requests, queue or log requests, and support undoable operations. Aka: Transaction

[Table of Contents](#menu)

## The Interpreter Pattern <a id="interpreter"></a>

Given a language, define a represention for its grammar along with an interpreter that uses the representation to interpret sentences in the language.

[Table of Contents](#menu)

## The Iterator Pattern <a id="iterator"></a>

Provide a way to access the elements of an aggregate object sequentially without exposing its underlying representation.

[Table of Contents](#menu)

## The Mediator Pattern <a id="mediator"></a>

Define an object that encapsulates how a set of objects interact. Mediator promotes loose coupling by keeping objects from referring to each other explicitly, and it lets you vary their interaction independently.

[Table of Contents](#menu)

## The Memento Pattern <a id="memento"></a>

Without violating encapsulation, capture and externalize an object’s internal state so that the object can be restored to this state later.

[Table of Contents](#menu)

## The Observer Pattern <a id="observer"></a>

Define a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and update automatically.

![Composite pattern class diagram](https://github.com/jagope/apuntes/blob/master/java/patterns_images/observer.jpeg)

[Table of Contents](#menu)

## The State Pattern <a id="state"></a>

Allow an object to alter its behavior when its internal state changes. The object will appear to change its class.

Example:
```java
public class Microondas {

	// estado inicial
	private Estado estado = Estado.APAGADO;

	private enum Estado {
 		....
 	}

	...
}

// por defecto no acepta las transiciones
private enum Estado {
	APAGADO {
	 ...
	}, ... ;

	public Estado setPotenciaMin() {
		System.out.println("No se permite operacion desde " + this);
		return this;
	}

	public Estado setPotenciaMax() {
		System.out.println("No se permite operacion desde " + this);
		return this;
	}

	....

	public Estado encender() {
		System.out.println("No se permite operacion desde " + this);
		return this;
	}

	public Estado apagar() {
		System.out.println("No se permite operacion desde " + this);
		return this;
	}
}

// para cada estado sobreescribo las transiciones posibles
APAGADO {
	public Estado setPotenciaMin() {
		System.out.println("fijada potencia mínima");
		return Estado.POTENCIA_MIN;
	}

	public Estado setPotenciaMax() {
		System.out.println("fijada potencia máxima");
		return Estado.POTENCIA_MIN;
	}

	public Estado abrirPuerta() {
		System.out.println("abriendo puerta");
		return Estado.PUERTA_ABIERTA;
	}
}
```

[Table of Contents](#menu)

## The Strategy Pattern <a id="strategy"></a>

Define a family of algorithms, encapsulate each one, and make them interchangeable. Strategy lets the algorithm vary independently from clients that use it.

![Composite pattern class diagram](https://github.com/jagope/apuntes/blob/master/java/patterns_images/strategy.png)

[Table of Contents](#menu)

## The Template Method <a id="template"></a>

Define the skeleton of an algorithm in an operation, deferring some steps to subclasses. Template Method lets subclasses redefine certain steps of an algorithm without changing the algorithm’s structure.

![Composite pattern class diagram](https://github.com/jagope/apuntes/blob/master/java/patterns_images/template.jpg)

[Table of Contents](#menu)

# Spring

## Anotaciones

### @Configuration
```java
@Configuraion
public <class> {
	...
}
```

### @Profile

```java
@Profile(value="<profile_name>")
public <class> {
	...
}
```
Activa el profile &lt;profile_name&gt;

### @Bean
```java
@Bean
public <interface> <method_name>() {
	return new <interface>Impl();
}
```
### @Autowired
Inyectará automáticamente la dependencia en la propiedad donde esté definido. 
Asocia el ```bean``` según este orden de criterio:

 1. Se enlazará a un objeto que se llame como la variable (```<variable_name>```) 
 2. Se enlazará a un objeto que comparta el mismo tipo de dato y del cuál sólo exista uno en el contexto (```<bean_class>```) 

Si no se dan ninguna de las dos situaciones lanzará una excepción a menos que se declare el atributo ```required``` y se establezca a ```false```

Será necesario incluir la etiqueta ```<context:annotation-config />``` en el contexto de spring.

ej: 
```java
@Autowired[(required="[false | true]")]
private <bean_class> <variable_name>;
```

### Qualifier
Se usa para controlar que ```bean``` se debe inyectar en la propiedad
ej: 
```
@Autowired[(required="[false | true]")]
@Qualifier("<bean_id>")
private <bean_class> <variable_name>;
```

### @Component
creará un bean de la clase en el contexto. Será necesario incluir la etiqueta ```<context:component-scan base-package=”<package>” />``` en el contexto de spring

ej:
```java
@Component(value=”<bean_id”>)
public class <class_name> {
}
```

### @Controller
Indica a Spring que se trata de un Controlador, con la funcionalidad que ello implica

### @Service
Indica a Spring que se trata de un elemento de negocio

### @Repository
Indica a Spring que se trata de un elemento que suministra datos

### @RequestController
Create a resource controller, approach to building RESTful web services

#### @RequestMapping

#### @RequestParam
parametros /path?name=valor

#### @PathVariable
parametros /path/{param}

#### @RequestBody

```java
@RequestMapping(value=”<url>”[, method=<[RequestMethod.GET | RequestMethod.POST]>])
```
se le puede asignar a la clase o a un método. Se ejecuta cuando la <url> de la request coincide con la <url> de la anotación, se puede especificar si tiene que responder al método POST o GET.

```java
@RequestParam(value=”<name>”[ ,required=”<[true | false]”, defaultValue=”<default>” )
```
se asigna a un parámetro de un método, introduce en el parámetro del valor del parámetro
&lt;value&gt; al campo, ej:

url: /eliminarProyecto.io?id=4

```java
@RequestMapping(value=”eliminarProyecto.io”)
public String eliminarProyecto(@RequestParam(“id”) int idProyecto) { … };
```

### @PostConstruct
Se establece en un método que se llamara cuando se cree el bean

### @PreDestroy
Se establece en un método que se llamara cuando se vaya a destruir el bean


### Configuración de la aplicación mediante xml y anotaciones
```xml
<context:annotation-config/>
```
Configura spring para que injecte los beans correspondientes en los campos anotados con @Autowired

```xml
<context:component-scan base-package="">
	<context:include-filter type="regex" expression="com.inditex.financiero.sfi.conciliacionbancaria.manager\.*\.impl\.*Impl"/>
</context:component-scan>

```
Configura spring para buscar componentes en los packages especificados

```xml
<bean id="" class=""/>
```
bean definition

## taglibs
```
<%taglib uri=”http://www.springframework.org/tags” prefix=”spring” %>
<%taglib uri=”http://www.springframework.org/tags/form” prefix=”form” %>
```

## 1. Bases de datos embebidas

When you wish to expose an embedded database instance as a bean in a Spring ApplicationContext, use the embedded-database tag in the spring-jdbc namespace:

```xml
<jdbc:embedded-database id="dataSource" type="[HSQL | H2 | DERBY]">
	<jdbc:script location="classpath:schema.sql"/>
	<jdbc:script location="classpath:test-data.sql"/>
</jdbc:embedded-database>
```

The configuration above creates an embedded HSQL database populated with SQL from schema.sql and testdata.sql resources in the classpath. The database instance is made available to the Spring container as a bean of type javax.sql.DataSource. This bean can then be injected into data access objects as needed.

Java based configuration:
```java
@Bean(destroyMethod = "shutdown")
public EmbeddedDatabase dataSource() {
    return new EmbeddedDatabaseBuilder().
            .setType(EmbeddedDatabaseType.H2)
            .addScript("db-schema.sql")
            .addScript("db-test-data.sql")
            .build();
}
```

## 2. PropertyPlaceHolderConfigurer

Esta clase nos permite extraer parametrizaciones del fichero de configuración de Spring y ubicarlas en ficheros de propiedades. 
Podremos acceder al valor de la variable de la siguiente manera:  ${variable}.

```xml
<bean class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
    <property name="location">
        <value>servicio.properties</value>
    </property>
</bean>
 
<bean id="servicioPropiedades" class="com.arquitecturajava.properties.Servicio">
    <property name="url" value="${url}"></property>
    <property name="puerto" value="${puerto}"></property>
</bean>
```

Si se define más de un PropertyPlaceholderConfigurer dentro del mismo contexto, spring intentará recuperar la variable del PropertyPlaceholderConfigurer
que haya cargado primero, si no encuentra esta variable en el fichero properties lanzará un error. Para evitar que lance el error y hay que añadir la siguiente propiedad 
en todos los PropertyPlaceHolderConfigurer:
```
<property name="ignoreUnresolvablePlaceholders" value="true" />
```
Con esta propiedad, si no encuentra la variable en el primer PropertyPlaceholderConfigurer, pasará a buscarla en el siguiente.

## 3. Exception Handling

#### Controller based
We can define exception handler methods in our controller classes. All we need is to annotate these methods with @ExceptionHandler annotation

```java
@ExceptionHandler(CustomGenericException.class)
public ModelAndView handleCustomException(CustomGenericException ex) {

	ModelAndView model = new ModelAndView("error/generic_error");
	model.addObject("errCode", ex.getErrCode());
	model.addObject("errMsg", ex.getErrMsg());

	return model;
}
```

#### Global Exception Handler

The handler methods in Global Controller Advice is same as Controller based exception handler methods and used when controller class is not able to handle the exception.

```java
@ControllerAdvice
public class GlobalExceptionController {

@ExceptionHandler(CustomGenericException.class)
public ModelAndView handleCustomException(CustomGenericException ex) {

	ModelAndView model = new ModelAndView("error/generic_error");
	model.addObject("errCode", ex.getErrCode());
	model.addObject("errMsg", ex.getErrMsg());

	return model;

}
```

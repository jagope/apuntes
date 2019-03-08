# Hibernate

## Configuraci&oacute;n

### Configuraci&oacute;n usando un fichero xml
En este fichero se definen varias propiedades de hibernate y la conexi&oacute;n a la base de datos. Por defecto el nombre del fichero de configuraci&oacute;n es **hibernate.cfg.xml**.

```xml
<hibernate-configuration>
   <session-factory>
      <property name="<property_name>"><value></property>
      ...
      
      <mapping resource="<nombre_entidad>.hbm.xml" />
      ...

   </session-factory>
</hibernate-configuration>
```

### Configuraci&oacute;n program&aacute;ticamente

```java
import org.hibernate.cfg.Configuration;

...

   Configuration configuration = new Configuration()
   
   configuration.setProperty("<property_name>", "<property_value>");
   ...
   
   configuration.addResource("<nombre_entidad>.hbm.xml");
   ...
```

### Propiedades
<kbd>hibernate.show_sql</kbd>: especifica si se deben mostrar en el log las sqls ejecutadas.
<kbd>hibernate.dialect</kbd>:
<kbd>hibernate.conection.driver_class</kbd>:
<kbd>hibernate.conection.url</kbd>:
<kbd>hibernate.conection.username</kbd>:
<kbd>hibernate.conection.password</kbd>:

## Definici&oacute;n de entidades

### Definici&oacute;n de entidades usando ficheros xml

Se pueden definir todas las entidades en un &uacute;nico fichero xml, o cada entidad en su propio fichero xml. Por convenio se suele crear cada entidad en su propio fichero y el nombre de este es &lt;nombre_entidad>.hbm.xml.

La estructura básica de un archivo de mapeo se ve así:

```xml
<?xml version="1.0"?>
<!DOCTYPE hibernate-mapping PUBLIC
        "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
        "http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">

<hibernate-mapping package="org.hibernate.tutorial.domain">
[...]
</hibernate-mapping>
```

#### class
```xml
<class name="<class_name>" table="<table_name>" schema="<schema_name>">
	...
</class>
```

**name:** fully qualified name of the java class.
**table:** database table name.
**schema:** database schema name.

#### id
```xml
<id name="" column="" type="" />
```
**name:** java class attibute name.
**column:** database table's column name. If is not present the value of the **name** is used
**type:** indicates a conversor than convert de data from the sql type to the java type and viceversa. If is not present hibernate calculates the type by reflection, hence it is preferred to define it explicitly.

#### property

```xml
<property name="" column="" type="" />
```
**name:** java class attibute name.
**column:** database table's column name.
**type:** data type of the column

#### many-to-one
```xml
<many-to-one name="" class="">
	<column name="" />
</many-to-one>
```

### Definici&oacute;n de entidades con anotaciones

#### @Entity

```java
@Entity
class <class_name> {
	...
}
```

#### @Table

```java
@Table(name="<table_name>", schema="<schema_name>")
class <class_name> {
	...
}
```

**name:** database table name.
**schema:** database schema name.


#### @Id

```java
class <class_name> {
	
    @Id
    @Generated()
    private int <id_column>;
}
```

#### @Column

```java
class <class_name> {
	
    @Column(name="<table_column_name>")
    private String <column>;
}
```

#### @ManyToOne
```java
class <class_name> {
	
    @ManyToOne
    private <foreign_class> <class>;
}
```

## Creaci&oacute;n de la sesi&oacute;n

```java
final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure(["other_hibernate.cfg.xml"]).build();
final SessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();

```
Es necesario crear un **Service Registry**, si no especificamos el nombre del fichero busca un fichero con el nombre por defecto **hibernate.cfg.xml**

## Creating a Criteria

```java
Criteria criteria = session.createCriteria(<entity_class>.class);

criteria.add(Restrictions.eq("<property_entity>", <value>);
...

criteria.addOrder(Order.asc("<property_entity>");
...

criteria.setFirstResult(<numero>);
criteria.setMaxResult(<numero>);

ProjectionList projections = Projections.projectionList();
projections.add(Projections.property("<property_entity>"));
...
criteria.setProjections(projections);

criteria.list();
```

# Hibernate en spring

org.springframework.orm.hibernate3.annotation.AnnotationSessionFactoryBean (que extiende a LocalSessionFactoryBean) para crear una configuraci&oacute;n con anotaciones

```
<property name="annotatedClasses">
    <list>
        <value>nuestro.paquete.Usuario</value>
    </list>
</property>
```

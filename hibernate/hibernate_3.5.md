## Definici&oacute;n de entidades usando ficheros xml

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

### class
```xml
<class name="<class_name>" table="<table_name>" schema="<schema_name>">
	...
</class>
```

**name:** fully qualified name of the java class.
**table:** database table name.
**schema:** database schema name.

### id
```xml
<id name="" column="" type="" />
```
**name:** java class attibute name.
**column:** database table's column name. If is not present the value of the **name** is used
**type:** indicates a conversor than convert de data from the sql type to the java type and viceversa. If is not present hibernate calculates the type by reflection, hence it is preferred to define it explicitly.

### property

```xml
<property name="" column="" type="" />
```
**name:** java class attibute name.
**column:** database table's column name.
**type:** data type of the column

### many-to-one
```xml
<many-to-one name="" class="">
	<column name="" />
</many-to-one>
```


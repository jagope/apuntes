# JAX-WS

Java API for XML Web Services (JAX-WS), es una especificaci&oacute;n para la creaci&oacute;n de servicios web basados en XML-SOAP.

Algunos productos que implementan la especificaci&oacute;n son CXF o Axis 2.

## Anotaciones

<kbd>@WebService</kbd>
<kbd>@WebMethod</kbd>
<kbd>@WebParam</kbd>

## Implementaci&oacute;n con cxf

#### Configuraci&oacute;n de maven

```xml
<dependencies>
	<dependency>
		<groupId>org.apache.cxf</groupId>
		<artifactId>cxf-rt-frontend-jaxws</artifactId>
		<version>${cxf.version}</version>
	</dependency>
	<dependency>
		<groupId>org.apache.cxf</groupId>
		<artifactId>cxf-rt-transports-http</artifactId>
		<version>${cxf.version}</version>
	</dependency>
	<dependency>
		<groupId>org.springframework</groupId>
		<artifactId>spring-web</artifactId>
		<version>${spring.version}</version>
	</dependency>
</dependencies>
```

#### Configuraci&oacute;n del servlet en el fichero web.xml:

````xml
<servlet>
  <display-name>cxf</display-name>
  <servlet-name>cxf</servlet-name>
  <servlet-class>org.apache.cxf.transport.servlet.CXFServlet</servlet-class>
  <load-on-startup>1</load-on-startup>
</servlet>

<servlet-mapping>
  <servlet-name>cxf</servlet-name>
  <url-pattern>/services/*</url-pattern>
</servlet-mapping>
```

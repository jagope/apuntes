# MapStruct

## Maven configuration
```xml
<properties>
	<org.mapstruct.version>1.4.1.Final</org.mapstruct.version>
</properties>

<dependency>
  <groupId>org.mapstruct</groupId>
  <artifactId>mapstruct-jdk8</artifactId>
  <version>${mapstruct.version}</version>
</dependency>

<plugin>
	<groupId>org.apache.maven.plugins</groupId>
	<artifactId>maven-compiler-plugin</artifactId>
	<configuration>
		<source>${java.version}</source>
		<target>${java.version}</target>
		<annotationProcessorPaths>
			<path>
				<groupId>org.mapstruct</groupId>
				<artifactId>mapstruct-processor</artifactId>
				<version>${mapstruct.version}</version>
			</path>
		</annotationProcessorPaths>
		<compilerArgs>
			<arg>-Amapstruct.defaultComponentModel=spring</arg>
		</compilerArgs>
	</configuration>
</plugin>
```

## The Mapper Interface

```java
@Mapper
public interface <Object>Mapper {
    SimpleDestination sourceToDestination(SimpleSource source);
    SimpleSource destinationToSource(SimpleDestination destination);
}
```

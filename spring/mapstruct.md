# MapStruct

## Dependency
```xml
<dependency>
  <groupId>org.mapstruct</groupId>
  <artifactId>mapstruct-jdk8</artifactId>
  <version>${mapstruct.version}</version>
</dependency>
```

## Annotation processor
```xml
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
						<arg>-Amapstruct.suppressGeneratorTimestamp=true</arg>
						<arg>-Amapstruct.defaultComponentModel=spring</arg>
					</compilerArgs>
				</configuration>
			</plugin>
```

## Work with lombock

If you use lombock and mapstruct together in sprinboot is necesary add the annotation processor of lombok

```xml
						<path>
							<groupId>org.projectlombok</groupId>
							<artifactId>lombok</artifactId>
						</path>
```

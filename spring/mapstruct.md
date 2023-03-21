# MapStruct
MapStruct is a Java Bean mapper. With MapStruct, we only need to create an interface, and the library will automatically create a concrete implementation during compile time.


## The Mapper Interface

```java
@Mapper
public interface SimpleSourceSimpleDestinationMapper {
    SimpleDestination sourceToDestination(SimpleSource source);
    SimpleSource destinationToSource(SimpleDestination destination);
}
```

### Mapping Fields With Different Field Names
When mapping different field names, we will need to configure its source field to its target field and to do that, we will need to add @Mapping annotation for each field

```java
@Mapper
public interface EmployeeMapper {
    
    @Mapping(target="employeeId", source="id")
    @Mapping(target="employeeName", source="name")
    EmployeeDTO employeeToEmployeeDTO(Employee entity);


}
```

### Before-Mapping and After-Mapping Annotations
Here's another way to customize @Mapping capabilities by using @BeforeMapping and @AfterMapping annotations. The annotations are used to mark methods that are invoked right before and after the mapping logic.
```java
@Mapper
public abstract class CarsMapper {
    @BeforeMapping
    protected void enrichDTOWithFuelType(Car car, @MappingTarget CarDTO carDto) {
        if (car instanceof ElectricCar) {
            carDto.setFuelType(FuelType.ELECTRIC);
        }
        if (car instanceof BioDieselCar) { 
            carDto.setFuelType(FuelType.BIO_DIESEL);
        }
    }

    @AfterMapping
    protected void convertNameToUpperCase(@MappingTarget CarDTO carDto) {
        carDto.setName(carDto.getName().toUpperCase());
    }

    public abstract CarDTO toCarDto(Car car);
}
```

## Inject Spring Components into the Mapper
Sometimes, we'll need to utilize other Spring components inside our mapping logic. In this case, we have to use an abstract class instead of an interface

```java
@Mapper
public abstract class SimpleDestinationMapperUsingInjectedService {
    @Autowired
    protected SimpleService simpleService;

    @Mapping(target = "name", expression = "java(simpleService.enrichName(source.getName()))")
    public abstract SimpleDestination sourceToDestination(SimpleSource source);
}
```

We must remember not to make the injected bean private! This is because MapStruct has to access the object in the generated implementation class.

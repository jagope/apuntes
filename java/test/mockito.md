 # Mockito

## mock with junit

```java
@Mock
private ConciliacionBancariaAjustesDiferenciasManager manager;

@InjectMocks
private final ConciliacionBancariaAjustesDiferenciasService service = new ConciliacionBancariaAjustesDiferenciasServiceImpl();

@Before
public void init() {
    MockitoAnnotations.initMocks(this);
}
```

se puede sustituir <kbd>MockitoAnnotations.initMocks(this);</kbd> por <kbd>@RunWith(MockitoJUnitRunner.class)</kbd>

## when - return

### return different values
If we want to return different values, then we can chain the stubs
```java
when(mockEmployeeDAO.getAwards(1001L)).thenReturn(2).thenReturn(4).thenReturn(9);
```
or
```java
when(mockEmployeeDAO.getAwards(1001L)).thenReturn(2,4,9);
```

se puede sustituir por
```java
given(<mock>.<method>).willReturn(<result>)
```

## check methods were called

### verify
Verifies certain behavior happened at least once / exact number of times / never. 

```java
import org.mockito.Mockito.*;
import static org.mockito.ArgumentMatchers.anyString;

verify(mock, times(5)).someMethod("was called five times");

verify(mock, atLeast(2)).someMethod("was called at least two times");

//you can use flexible argument matchers, e.g:
verify(mock, atLeastOnce()).someMethod(anyString());
```

### reset
At the point of the call to this method the mock forgot any interactions & stubbing

```java
reset(mock);
```

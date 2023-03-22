# AssertJ

## returns() and doesNotReturn()
The returns() method verifies the object under test returns the Expected value from the given function FunctionToGetTheValue. The doesNotReturn() method to verify the from() result doesn't match the expected value. Furthermore, we can use doesNotReturn() and returns() in the same assertion.

```java
then(TO_BE_TESTED)
  .returns(EXPECTED.getName(), from(Product::getName))
  .returns(EXPECTED.isOnSale(), from(Product::isOnSale))
  .doesNotReturn(EXPECTED.getId(), from(Product::getId));
```

## exceptions
```java
final var throwable = catchThrowable(() -> ...);

then(throwable).isInstanceOf(StatusConflictException.class);
```

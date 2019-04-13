# JUnit

## Rules

Rules allows very flexible addition or redefinition of the behavior of each test method in a test class. For this purpose, @Rule annotation should be used so as to mark public fields of a test class. Those fields should be of type MethodRule, which is an alteration in how a test method is run and reported. Multiple MethodRules can be applied to a test method. MethodRule interface has a lot of implementations, such as ExpectedException which allows in-test specification of expected exception types and messages and many others. Except for those already defined rules, developers can create their own custom rules and use them in their test cases as they wish

### Stopwatch
Tracks the time as each test is run. Just when the test is about to run, the current time in nanoseconds is stored so that when the test finishes, the time taken for execution can be determined.

Example:
```java
public class StopwatchExample {
   @Rule
   public final Stopwatch stopwatch = new Stopwatch() {
      protected void succeeded(long nanos, Description description) {
         System.out.println(description.getMethodName() + " succeeded, time taken " + nanos);
      }
   }
}
```

### TemporaryFolder
Provides a convenient way to create and manage a temporary directory. It guarantees that the new directory’s name does not conflict with existing files or directories. It also guarantees that content will be deleted after the test method finishes, whether the execution result is successful or not.

Example:

```java
public class TemporaryFolderTests {

   @Rule
   public TemporaryFolder tempFolder = new TemporaryFolder();

   @Test
   public void fileCreatedAndWrittenSuccessfully() throws IOException {
      File file = tempFolder.newFile("sample.txt");
      FileUtils.writeStringToFile( file, "JUnit Rocks!");
      String line = FileUtils.readFileToString(file);

      assertThat(line, is("JUnit Rocks!"));
   }
}
```

### TestName
To get the name of a test while it’s executing.

Example:

```java
public class TestNameTests {
   @Rule
   public TestName name = new TestName();

   @Test
   public void methodNameShouldBePrinted() {
      System.out.println("Test method name: " + name.getMethodName());
   }
}
```

### ErrorCollector
Collecting Errors When Multiple Assertions in One Test Fail
With the ErrorCollector class, JUnit offers a way to handle multiple test failures of a single test case. So, you can enable a test not to stop on an error by doing all assertions and listing the failed ones at the end. Listing 3 shows a test method with three statements that are checked with the ErrorCollector:

```java
public class ErrorCollectorTests {
   @Rule
   public ErrorCollector collector = new ErrorCollector();

   @Test
   public void statementsCollectedSuccessfully() {
      String s = null;
      collector.checkThat ("Value should not be null", null, is(s));
      s = "";
      collector.checkThat( "Value should have the length of 1", s.length(), is(1));
      s = "Junit!";
      collector.checkThat( "Value should have the length of 10", s.length(), is(10));
   }
}
```

Note the use of the ErrorCollector instance in the tests themselves. If the first statement passes but the next two fail, the output is as follows (condensed here by removing the stack trace detail): java.lang.AssertionError: Value should have the length of 1 Expected: is <1> but: was <0> at org.hamcrest.MatcherAssert... java.lang.AssertionError: Value should have the length of 10 Expected: is <10> but: was <6> at org.hamcrest.MatcherAssert…

### Running One Test Multiple Times
Running One Test Multiple Times with Different Parameters
It is fairly common to need to run the same method with varying inputs to see that the executed results are asserted successfully. Since version 4.0, JUnit provides the flexibility to do this with the @Parameters annotation, which enables you to run one test method again and again providing different input values each time. To demonstrate the parameterized usage, I will test a method that calculates a Fibonacci number according to a given index value of it in the sequence. To get the @Parameters annotation picked up, I need to state that the test class should be handled with a custom runner, which is Parameterized.class, rather than with the default runner that JUnit uses. To provide input values for the Fibonacci series, a public static method with a list of objects should be defined, and it should be marked with the @Parameterized.Parameters annotation. Each element of that list will be provided as a parameter to the constructor of the test class. Thus, the number of parameters passed to the constructor must match the item count of each element of the list. Listing 4 shows how this is done. Listing 4.

@RunWith(Parameterized.class)

public class FibonacciNumbersTests {
@Parameterized.Parameters
public static List data() {
return Arrays.asList(new Object[][]{ {0, 0}, {1, 1}, {2, 1}, {3, 2}, {4, 3}, {5, 5}, {6, 8}});
}

private int value;

private int expected;

public FibonacciNumbersTests( int input, int expected) {
value = input;
this.expected = expected;
}

@Test
public void fibonacciNumberCalc () {
assertEquals(expected, fib(value));
}

public static int fib(int n) {
if (n < 2) {
return n;
} else {
return fib(n - 1) + fib(n - 2);
}
}
}

Note the first line with the @RunWith annotation, which tells JUnit to use a specialized runner. 

Here, with each item, we are providing the input value first and then the expected value to make the assertion. For purposes of illustration, I have included the fib() method that we are testing as a static method within the test class. Also note that the test class can have only one constructor defined. Multiple constructor declarations will lead to an illegal argument exception.

## Categories
Categories allows you to group certain kinds of tests together and even include or exclude groups (categories). For example, you can separate slow tests from fast tests. To assign a test case or a method to one of those categories the @Category annotation is provided.

public interface FastTests { /* category marker */ }
public interface SlowTests { /* category marker */ } 

public class A {
@Test public void a() { 
    fail();
 	}

@Category(SlowTests.class) 
@Test public void b() {
 	}
 }

@Category({ SlowTests.class, FastTests.class })
public class B {
@Test public void c() { }
}

@RunWith(Categories.class)
@IncludeCategory(SlowTests.class)
@SuiteClasses({ A.class, B.class })
// Note that Categories is a kind of Suite
public class SlowTestSuite { 
// Will run A.b and B.c, but not A.a
}

@RunWith(Categories.class)
@IncludeCategory(SlowTests.class)
@ExcludeCategory(FastTests.class)
@SuiteClasses({ A.class, B.class })
// Note that Categories is a kind of Suite
public class SlowTestSuite {
// Will run A.b, but not A.a or B.c
} 

## FixMethodOrder Annotation
Podemos establecer el orden de ejecución de los test con esta anotación. Los tres valores posibles son DEFAULT, JVM y NAME_ASCENDING.

```java
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class JUnitFixMethodOrderTest {
	...
}

# Java 11

## String

Se han creado nuevos métodos en la clase String:

* `boolean isBlank()` - returns true if the string is empty or contains only white-spaces.
* `Stream <String> lines()` – returns a stream of lines extracted from this string, separated by line terminators.
* `String repeat (int count)` – returns a string whose value is the concatenation of this string’s repeated count times.
* `String strip()` – returns a string whose value is this string, with all leading and trailing white-spaces removed.
* `String stripLeading()` – returns a string whose value is this string, with all leading white-spaces removed.
* `String stripTrailing()` – returns a string whose value is this string, with all trailing white-spaces removed.

## HTTP Client (Standard)
JDK 9 introduced a new API to provide support for the HTTP Client protocol (JEP 110). Since JDK 9 introduced the Java Platform Module System (JPMS), this API was included as an incubator module. Incubator modules are intended to provide new APIs but without making them part of the Java SE standard. Developers can try the API and provide feedback. Once any necessary changes have been made (this API was updated in JDK 10), the API can be moved to become part of the standard.

The HTTP Client API is now part of the Java SE 11 standard. This introduces a new module and package to the JDK, java.net.http. The main types defined are

HttpClient
HttpRequest
HttpResponse
WebSocket
The API can be used synchronously or asynchronously. Asynchronous mode makes use of CompletableFutures and CompletionStages.

```java
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
 
import org.junit.Before;
import org.junit.Test;
 
public class HttpClientTest {
 
    private HttpClient client;
    String serviceUri;
 
    @Before
    public void setup() {
        client = HttpClient.newHttpClient();// default to HTTP_2
        serviceUri = "https://reqres.in/api/users";
    }
 
    @Test
    public void get_ofString() {
        String getUrl = serviceUri + "/2";
        HttpRequest request = HttpRequest.newBuilder().uri(URI.create(getUrl)).build();
        HttpResponse response;
        try {
            response = client.send(request, BodyHandlers.ofString());
            System.out.println("Response" + response.body());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    @Test
    public void put_ofString() {
        String putUrl = serviceUri + "/2";
        String upUsdateerString = "{\"name\": \"Mary\",  \"job\": \"leader\"}";
        HttpRequest request = HttpRequest.newBuilder().uri(URI.create(putUrl))
                .PUT(BodyPublishers.ofString(upUsdateerString)).build();
        HttpResponse response;
        try {
            response = client.send(request, BodyHandlers.ofString());
            System.out.println("Response" + response.body());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    @Test
    public void post_discarding() {
        String newUserString = "{\"name\": \"Mary\",  \"job\": \"leader\"}";
        HttpRequest request = HttpRequest.newBuilder().uri(URI.create(serviceUri))
                .POST(BodyPublishers.ofString(newUserString)).build();
        try {
            HttpResponse response = client.send(request, BodyHandlers.discarding());
            System.out.println("Response" + response.statusCode());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    @Test
    public void delete_ofString() {
        String deleteUrl = serviceUri + "/2";
        HttpRequest request = HttpRequest.newBuilder().uri(URI.create(deleteUrl)).DELETE().build();
        try {
            HttpResponse response = client.send(request, BodyHandlers.discarding());
            System.out.println("Response" + response.statusCode());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
}
```

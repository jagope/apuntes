# Java 11

## String

Nuevos métodos  repeat, strip, stripLeading, stripTrailing, isBlank y lines en la clase String:

boolean isBlank() – returns true if the string is empty or contains only white-spaces.
Stream <String> lines() – returns a stream of lines extracted from this string, separated by line terminators.
String repeat​(int count) – returns a string whose value is the concatenation of this string’s repeated count times.
String strip() – returns a string whose value is this string, with all leading and trailing white-spaces removed.
String stripLeading() – returns a string whose value is this string, with all leading white-spaces removed.
String stripTrailing() – returns a string whose value is this string, with all trailing white-spaces removed.

## HTTP Client (Standard)
JDK 9 introduced a new API to provide support for the HTTP Client protocol (JEP 110). Since JDK 9 introduced the Java Platform Module System (JPMS), this API was included as an incubator module. Incubator modules are intended to provide new APIs but without making them part of the Java SE standard. Developers can try the API and provide feedback. Once any necessary changes have been made (this API was updated in JDK 10), the API can be moved to become part of the standard.

The HTTP Client API is now part of the Java SE 11 standard. This introduces a new module and package to the JDK, java.net.http. The main types defined are

HttpClient
HttpRequest
HttpResponse
WebSocket
The API can be used synchronously or asynchronously. Asynchronous mode makes use of CompletableFutures and CompletionStages.

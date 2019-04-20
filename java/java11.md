# Java 11

## String

Nuevos métodos  repeat, strip, stripLeading, stripTrailing, isBlank y lines en la clase String

## HTTP Client (Standard)
JDK 9 introduced a new API to provide support for the HTTP Client protocol (JEP 110). Since JDK 9 introduced the Java Platform Module System (JPMS), this API was included as an incubator module. Incubator modules are intended to provide new APIs but without making them part of the Java SE standard. Developers can try the API and provide feedback. Once any necessary changes have been made (this API was updated in JDK 10), the API can be moved to become part of the standard.

The HTTP Client API is now part of the Java SE 11 standard. This introduces a new module and package to the JDK, java.net.http. The main types defined are

HttpClient
HttpRequest
HttpResponse
WebSocket
The API can be used synchronously or asynchronously. Asynchronous mode makes use of CompletableFutures and CompletionStages.

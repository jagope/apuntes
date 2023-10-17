# Openapi specification
```yml
openapi: "<openapi version>"
```

# Info
```yml
info:
  title: <title>
  version: "<api version>"
  contact:
    name: "<name>"
    email: "<email>"
```

# Servers
```yml
servers:
  - url: <url>
    description: <description>
  - ...
```


# Paths
```yml
paths:
  /baseurl/{<path_param>}:
    get:
      summary: <summary>
      description: <description>
      parameters:
        - name: <path_param>
          in: path
          required: (true|false)
          type: (boolean|integer|numer|string)
        - name: <query_param>
          in: query
          required: (true|false)
          type: (boolean|integer|numer|string)
      responses:
        <http code>
          description:
          content:
            application/json:
              schema:
                $ref: '#/schemas/<name>'
    post:
      summary: <summary>
      description: <description>
      requestBody:
        content:
            application/json:
              schema:
                $ref: '#/schemas/<name>'
      responses:
        <http code>
          description:
          content:
            application/json:
              schema:
                $ref: '#/schemas/<name>'
    put:
      summary: <summary>
      description: <description>
      requestBody:
        content:
            application/json:
              schema:
                $ref: '#/schemas/<name>'
      responses:
        <http code>
          description:
          content:
            application/json:
              schema:
                $ref: '#/schemas/<name>'
    delete:
      summary: <summary>
      description: <description>
      parameters:
        - name: <path_param>
          in: path
          required: (true|false)
          type: (boolean|integer|numer|string)
        - name: <query_param>
          in: query
          required: (true|false)
          type: (boolean|integer|numer|string)

```

# Schemas
```yml
schemas:
  <name>:
    properties:
      <property1>:
        type: (boolean|integer|numer|string|array)
      <property2>:
        type: (boolean|integer|numer|string|array)
      <property3>:
        type: array
        items:
          type: (boolean|integer|numer|string|object)
    required:
      - <property1>
      ...

```

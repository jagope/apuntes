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
          schema:
            $ref: '#/schemas/<name>'
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

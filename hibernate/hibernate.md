## Properties

### show-sql
show sql statements in the log
```yml
hibernate.show-sql: true
```

### format_sql
show sql statements formatted in the log
```yml
hibernate.format_sql: true
```

### generate_statistics
show sql statements formatted in the log
```yml
hibernate.generate_statistics: true
```

## Log configuration
To show SQL statements add org.hibernate.SQL=DEBUG.
To show the bind parameter values add org.hibernate.type.descriptor.sql=TRACE.

# SQL

## Sentencias SQL

#### insert
```sql
INSERT INTO <table_name> (<column_names>) VALUES (<column_values);
```

#### update
```sql
UPDATE <table_name> SET <column_names> = <value> (,<column_names> = <value>)*;
```

#### delete

Borra una serie de filas de la tabla. Podemos usar una claúsula WHERE para limitar las filas a borrar, a las que cumplan una condición. La sintaxis sería:

```sql
DELETE FROM <table_name> WHERE <condition>
```

#### truncate

Elimina todas las filas de la tabla. También resetea los contadores de auto incremento a 0. La sintaxis es:

```sql
TRUNCATE TABLE <table_name>;
```

#### drop

Elimina la estructura de la tabla.

```sql
DROP TABLE <table_name>;
```

# DB2

## Comandos

#### db2start
```sh
> db2start
```
Arranca la base de datos

## L&iacute;nea de comandos

#### list tablespaces
```sh
db2 list tablespaces
```

#### sql
```sh
db2 <sql>
```
Ejecuta la sentencia <sql>

#### -tvf
```sh
db2 -tvf <file>
```
Ejecuta las sentencias que se encuentren en el fichero <file>

## Sentencias sql

#### create database
```sh
CREATE DATABASE <name> [USING CODESET <code_set> TERRITORY <territory>];
```
Crea una base de datos.

ejemplo:
```sh
CREATE DATABASE INDITEX USING CODESET ISO8859-1 TERRITORY es_ES
```
#### connect

```sh
db2 connect to <database>
```
Se conecta a la base de datos &lt;database>

#### create schema
```sh
CREATE SCHEMA <name>;
```
crea un schema en la base de datos a la que se est&aacute; conectado

#### limit result
```sh
SELECT * FROM <schema>.<table> FETCH FIRST <x> ROWS ONLY;
```
devuelve solo los primeros &lt;x> registros

## Select sobre tablas de sistemas

```sql
-- Recupera el rol de un usuario
SELECT * FROM SYSCAT.ROLEAUTH WHERE GRANTEE = '?';
```

```sql
-- Recupera los permisos sobre las tablas que tiene un rol
SELECT * FROM SYSCAT.TABAUTH WHERE GRANTEE = '?' ORDER BY GRANTEE, TABSCHEMA, TABNAME;
```

```sql
-- Recupera los datos de una columna a partir de los datos devueltos por un error ("TBSPACEID=2, TABLEID=11, COLNO=0")
SELECT * 
FROM SYSCAT.COLUMNS c
INNER JOIN SYSCAT.TABLES t ON t.TABSCHEMA = c.TABSCHEMA AND t.TABNAME = c.TABNAME
WHERE t.TABLEID = ? AND t.TBSPACEID = ? AND c.COLNO = ?
```

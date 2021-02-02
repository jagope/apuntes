## Show Database Privileges

### Show all privileges granted to a user
```sql
SELECT
	*
FROM
	DBA_TAB_PRIVS
WHERE
	GRANTEE = '<rol>';
```

### Show all privileges granted to a table
```sql
SELECT
  *
FROM
  DBA_TAB_PRIVS WHERE TABLE_NAME = '<table>' AND OWNER = '<schema>';
```

### Show the role asigned to a user
```sql
 SELECT
  *
FROM
  DBA_ROLE_PRIVS WHERE grantee = 'DFINAN';
```

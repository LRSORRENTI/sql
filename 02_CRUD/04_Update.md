# Update 

### NOTE !IMPORTANT

In mysql workbench the safe mode is enabled by default, so if your WHERE clause doesn't have a key it will prevent running the query. Try disabling that using these steps -

Edit > Preferences > Sql Editor > uncheck the "Safe Updates"

Note - try reconnecting the server (Query > Reconnect to Server) and than run your query again. and unchecking this setting works

The "Safe Updates" option in MySQL Workbench is designed to prevent accidental updates or deletions of data when a query doesn't use a key in the WHERE clause. By default, it requires that you use a primary key or unique key in your WHERE clause for UPDATE and DELETE statements. Since you were using the name column in your WHERE clause, which might not be a key, the "Safe Updates" option was preventing the query from executing.

Disabling the "Safe Updates" option allows you to run UPDATE and DELETE queries without this restriction. Just be cautious when using this setting, as it makes it easier to accidentally update or delete large amounts of data if your WHERE clause is not specific enough.


### How can we update existing rows, in our cats example, if our cat has a birthday, how can we increment age?

## A good rule of thumb, always select before updating to ensure you're updating the proper / desired field.

When updating the keywords 'UPDATE' and 'SET' go hand in hand.

SELECT name, age FROM cats WHERE name='Ringo';
+-------+------+
| name  | age  |
+-------+------+
| Ringo |    4 |
+-------+------+

Happy birthday to Ringo, he's now 5, we need to updata his age.

```
UPDATE cats SET age=5 WHERE name='Ringo';
Query OK, 1 row affected (0.18 sec)
Rows matched: 1  Changed: 1  Warnings: 0

```

```
SELECT name, age FROM cats WHERE name='Ringo';
+-------+------+
| name  | age  |
+-------+------+
| Ringo |    5 |
+-------+------+
```
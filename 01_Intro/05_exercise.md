# Create a table with two columns name and quantity, then practice dropping it

```
CREATE TABLE pastries ( name VARCHAR(50), quantity INT);
```

```
luke@localhost) [pastries]> show tables
    -> ;
+--------------------+
| Tables_in_pastries |
+--------------------+
| pastries           |
+--------------------+
1 row in set (0.00 sec)

(luke@localhost) [pastries]> desc pastries;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(50) | YES  |     | NULL    |       |
| quantity | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

```
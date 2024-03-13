# Aliases 

When we select data, sometimes the column names can be very long, we can use aliases to select columns, these don't modify the name of the original column, but they can be useful to shorten long queries.

To do this, use the 'AS' keyword:

```
SELECT cat_id AS id, name FROM cats;
+----+----------------+
| id | name           |
+----+----------------+
|  1 | Ringo          |
|  2 | Cindy          |
|  3 | Dumbledore     |
|  4 | Egg            |
|  5 | Misty          |
|  6 | George Michael |
|  7 | Jackson        |
+----+----------------+
7 rows in set (0.00 sec)

```
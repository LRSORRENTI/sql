# WHERE 

WHERE is a special clause in SQL, that allows for narrowing of rows selected. So far with 

```
SELECT name, breed FROM cats;
```

Those are just the names of the columns, and returns all of the rows from those columns, but we can narrow down the rows returned using the WHERE clause. 

**NOTE: Where is not limited to just SELECT, it will often be used to delete, or update rows, and you can use '=', '>', '<', '>=', '<=', and '<>'. The last <> is used to check for not equal to, similar to != in Python**

```
SELECT * FROM cats WHERE age=4;
```
+--------+-------+---------+------+
| cat_id | name  | breed   | age  |
+--------+-------+---------+------+
|      1 | Ringo | Tabby   |    4 |
|      4 | Egg   | Persian |    4 |
+--------+-------+---------+------+

```
SELECT name, age, breed FROM cats WHERE age=4;
+-------+------+---------+
| name  | age  | breed   |
+-------+------+---------+
| Ringo |    4 | Tabby   |
| Egg   |    4 | Persian |
+-------+------+---------+
```

You also don't need to select or return the value to use WHERE:

```
SELECT name FROM cats WHERE age=4;
```
+-------+
| name  |
+-------+
| Ringo |
| Egg   |
+-------+
Above we return all the cats that are 4 years old, but only the names for those cats.

You can also use text to return a given cat:

```
SELECT * FROM cats WHERE name='Egg';
```

+--------+------+---------+------+
| cat_id | name | breed   | age  |
+--------+------+---------+------+
|      4 | Egg  | Persian |    4 |
+--------+------+---------+------+


SELECT cat_id FROM cats;
+--------+
| cat_id |
+--------+
|      1 |
|      2 |
|      3 |
|      4 |
|      5 |
|      6 |
|      7 |
+--------+
7 rows in set (0.00 sec)

SELECT name, breed FROM cats;
+----------------+------------+
| name           | breed      |
+----------------+------------+
| Ringo          | Tabby      |
| Cindy          | Maine Coon |
| Dumbledore     | Maine Coon |
| Egg            | Persian    |
| Misty          | Tabby      |
| George Michael | Ragdoll    |
| Jackson        | Sphynx     |
+----------------+------------+
7 rows in set (0.01 sec)

SELECT * FROM cats WHERE breed='tabby';
+--------+-------+-------+------+
| cat_id | name  | breed | age  |
+--------+-------+-------+------+
|      1 | Ringo | Tabby |    4 |
|      5 | Misty | Tabby |   13 |
+--------+-------+-------+------+
2 rows in set (0.00 sec)

SELECT name, age FROM cats WHERE breed='tabby';
+-------+------+
| name  | age  |
+-------+------+
| Ringo |    4 |
| Misty |   13 |
+-------+------+
2 rows in set (0.00 sec)

SELECT * FROM cats WHERE cat_id=age;
+--------+---------+---------+------+
| cat_id | name    | breed   | age  |
+--------+---------+---------+------+
|      4 | Egg     | Persian |    4 |
|      7 | Jackson | Sphynx  |    7 |
+--------+---------+---------+------+
2 rows in set (0.00 sec)

SELECT cat_id, age FROM cats WHERE cat_id=age;
+--------+------+
| cat_id | age  |
+--------+------+
|      4 |    4 |
|      7 |    7 |
+--------+------+
2 rows in set (0.00 sec)

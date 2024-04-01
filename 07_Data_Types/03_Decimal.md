# DECIMAL type

INSERT INTO parent(children) VALUES (1.5);
Query OK, 1 row affected (0.08 sec)

SELECT * FROM parent;
+----------+
| children |
+----------+
|        3 |
|        3 |
|        2 |
+----------+

We tried to insert a decimal of 1.5, SQL will auto round the value if we don't specify it as a decimal 

So for anything like prices, or finances where decimals are necessary, omitting the DECIMAL type annotation isn't ideal

Sometimes when storing decimals in memory, it can be costly,
there are different methods of storing decimals, things like FLOAT and DOUBLE which we'll cover soon

The syntax looks like this

DECIMAL(5, 2)

The 5 denotes tha total number of values before the decimal point, and the 2 is the amount of values after, so 555.18
is a valid DECIMAL 

But the (5, 2) is the MAXIMUM, we can also have 422.88 or 
12.90

But in this example 999.99 is our cap, since we specified 5 total values, and two decimals, that's the max for that DECIMAL(5, 2) annotation, 1244.01 would exceed the specification and return an error for that field if we tried to insert it since there's 6 total numbers

CREATE TABLE products(price DECIMAL(5,2));
Query OK, 0 rows affected (1.22 sec)

INSERT INTO products VALUES (4.55);
Query OK, 1 row affected (0.10 sec)

SELECT * FROM products;
+-------+
| price |
+-------+
|  4.55 |
+-------+
1 row in set (0.00 sec)

INSERT INTO products VALUES (885.15);
Query OK, 1 row affected (0.09 sec)

SELECT * FROM products;
+--------+
| price  |
+--------+
|   4.55 |
| 885.15 |
+--------+
2 rows in set (0.00 sec)

Note that if we tried something like:

INSERT INTO products (price) VALUES (8347.1); 
ERROR 1264 (22003): Out of range value for column 'price' at row 1

We'll get an error, technically it's omly 5 digits, but in the DECIMAL type annotation we specifically said it needs to have to digits after the '.'

But take a look at the below query, and note the response:

INSERT INTO products (price) VALUES(5.026);
Query OK, 1 row affected, 1 warning (0.09 sec)

SHOW WARNINGS;
+-------+------+--------------------------------------------+
| Level | Code | Message                                    |
+-------+------+--------------------------------------------+
| Note  | 1265 | Data truncated for column 'price' at row 1 |
+-------+------+--------------------------------------------+

SELECT * FROM products;
+--------+
| price  |
+--------+
|   4.55 |
| 885.15 |
|   5.03 |
+--------+
3 rows in set (0.00 sec)

Notice it rounded up to fit within those two digits, so when we insert after a decimal, it will work, but keep that in mind it does round the value

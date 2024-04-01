# FLOAT and DOUBLE

We just covered the DECIMAL data type, which can be more exact but the caveat is that it can take and use more memory 

If we use FLOAT or DOUBLE, we can store decimal values using less memory but it also has a cost, it's less precise than DECIMAL 

FLOAT | 4 Bytes of memory | 7 Digit precision issue

DOUBLE | 8 Bytes of memory | 15 Digit precision 

Let's look at an example: 

CREATE TABLE nums (x FLOAT, y DOUBLE);

INSERT INTO nums (x,y) VALUES (1.123, 1.123);

SELECT * FROM nums;
+-------+-------+
| x     | y     |
+-------+-------+
| 1.123 | 1.123 |
+-------+-------+

INSERT INTO nums (x,y) VALUES (1.12345678, 1.12345678);

SELECT * FROM nums;
+---------+------------+
| x       | y          |
+---------+------------+
|   1.123 |      1.123 |
| 1.12346 | 1.12345678 |
+---------+------------+

We see that our double is storing more precision than the float, in the float insert we lost some digits 

But we'll see the same issue with DOUBLE if we try something like: 


INSERT INTO nums (x,y) VALUES (1.12345678, 1.12345678919122121212);
Query OK, 1 row affected (0.15 sec)

SELECT * FROM nums;
+---------+--------------------+
| x       | y                  |
+---------+--------------------+
|   1.123 |              1.123 |
| 1.12346 |         1.12345678 |
| 1.12346 |         1.12345678 |
| 1.12346 | 1.1234567891912213 |
+---------+--------------------+

Notice that the Double will also round the value if it exceeds the max number of bytes
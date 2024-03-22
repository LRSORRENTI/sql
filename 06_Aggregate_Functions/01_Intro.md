# Aggregate Functions Intro 

We use aggregate functions to operate on data to tell us the average, min, or max of a given data set 

## COUNT 

The COUNT function is built into MySQL, we can use COUNT to return the amount of a piece of data: 

SELECT COUNT(*) FROM books;
+----------+
| COUNT(*) |
+----------+
|       19 |
+----------+
1 row in set (0.02 sec)

# Inner Joins 

An inner join is a much more common type of join than the cross join, and it works like this:

Select all values from table A and table B where a joint condition is met 

So we have a table A and a table B, we can specify certain conditions for the join

We get some keywords for inner joins, the JOIN and ON keywords, which are used to select the table to join to, and the values to set the join condition to respectively

The syntax looks like this:

SELECT * FROM customers
JOIN orders 
    ON customers.id = orders.customer_id;


+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@gmail.com  |  5 | 1999-01-03 | 458.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+

Remember the foreign key in the orders table customer_id is a reference to the id on the customers table, which makes sense for a join 

We wrote the query to join FROM customers, but the inverse would get us the same result

SELECT * FROM orders 
JOIN customers 
    ON orders.customer_id = customers.id;

+----+------------+--------+-------------+----+------------+-----------+------------------+
| id | order_date | amount | customer_id | id | first_name | last_name | email            |
+----+------------+--------+-------------+----+------------+-----------+------------------+
|  1 | 2016-02-10 |  99.99 |           1 |  1 | Boy        | George    | george@gmail.com |
|  2 | 2017-11-11 |  35.50 |           1 |  1 | Boy        | George    | george@gmail.com |
|  3 | 2014-12-12 | 800.67 |           2 |  2 | George     | Michael   | gm@gmail.com     |
|  4 | 2015-01-03 |  12.50 |           2 |  2 | George     | Michael   | gm@gmail.com     |
|  5 | 1999-01-03 | 458.25 |           5 |  5 | Bette      | Davis     | bette@gmail.com  |
+----+------------+--------+-------------+----+------------+-----------+------------------+

Often times you'll also slim down what to select instead of SELECT * 

SELECT first_name, last_name, order_date, amount FROM customers
    -> JOIN orders ON orders.customer_id = customers.id; 
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-01-03 | 458.25 |
+------------+-----------+------------+--------+

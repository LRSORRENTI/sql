# Left Join 

The second type of join we'll go over is the Left Join

Not quite as common as inner join, but has it's use cases 

Think about having two tables to compare against one another, presumably they have something in common, like a foreign key 

We start from the left table, and grab anything from the right table that corresponds to the left, and anything left over we'll be null, let's look at an example 

SELECT first_name, last_name, order_date, amount
FROM customers 
LEFT JOIN orders ON orders.customer_id = customers.id;

+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2017-11-11 |  35.50 |
| Boy        | George    | 2016-02-10 |  99.99 |
| George     | Michael   | 2015-01-03 |  12.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| David      | Bowie     | NULL       |   NULL |
| Blue       | Steele    | NULL       |   NULL |
| Bette      | Davis     | 1999-01-03 | 458.25 |
+------------+-----------+------------+--------+

Take note of the null values from our left join query, it grabbed the entire first name, last name, amount, and order date from orders, and it joined the rest of the customers table even though Bowie, and Steele haven't placed an order

This can be especially useful to determine differences, if for some reason we want to see all users that have never placed an order, this would be a way to find out 

## Left Join and Group By 

We can pair left join with group, and use a helper function called if null 

SELECT first_name, last_name, SUM(amount) AS total
FROM customers 
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

+------------+-----------+--------+
| first_name | last_name | total  |
+------------+-----------+--------+
| Boy        | George    | 135.49 |
| George     | Michael   | 813.17 |
| David      | Bowie     |   NULL |
| Blue       | Steele    |   NULL |
| Bette      | Davis     | 458.25 |
+------------+-----------+--------+

We've got some null values, let's say for every null value we want to sub in 0.00 as a value

IFNULL is the helper function we'll use to do this 

IFNULL takes in some arguments, the first is the checked value, the second will be the replacement if a null is found:

IFNULL(sum(total), 0.00)

SELECT first_name, last_name, IFNULL(SUM(amount), 0.00) AS total
FROM customers 
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

+------------+-----------+--------+
| first_name | last_name | total  |
+------------+-----------+--------+
| Boy        | George    | 135.49 |
| George     | Michael   | 813.17 |
| David      | Bowie     |   0.00 |
| Blue       | Steele    |   0.00 |
| Bette      | Davis     | 458.25 |
+------------+-----------+--------+

This can be especially useful if we need to perform some math operations on all totals
# Using Inner Join and Group By Together

SELECT first_name, last_name, order_date, amount
FROM customers
JOIN orders ON orders.customer_id = customers.id;

+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-01-03 | 458.25 |
+------------+-----------+------------+--------+

Let's try to return the total each user spemt

SELECT first_name, last_name, SUM(amount) AS total
FROM customers
JOIN orders ON orders.customer_id = customers.id
GROUP BY customers.first_name, customers.last_name
ORDER BY total DESC;

+------------+-----------+--------+
| first_name | last_name | total  |
+------------+-----------+--------+
| George     | Michael   | 813.17 |
| Bette      | Davis     | 458.25 |
| Boy        | George    | 135.49 |
+------------+-----------+--------+



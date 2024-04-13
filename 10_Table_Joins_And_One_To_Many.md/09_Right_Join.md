# Right Join

Right joins are the opposite of left joins, we look at two tables, a left and a right table, then join everything from the right, and if there's values missing they will be null

As it stands we won't see a difference in our right join than our previous left join, let's add in some data 

INSERT INTO orders (
    amount, order_date
) 
VALUES (
    100, CURDATE()
);

+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-01-03 | 458.25 |           5 |
|  7 | 2024-04-13 | 100.00 |        NULL |
+----+------------+--------+-------------+

Notice we do have a NULL value for one of the customer_id, in the real world this example wouldn't likely occur since placing an order would require an id, but for learning purposes it'll work

SELECT first_name, last_name, order_date, amount
FROM customers 
RIGHT JOIN orders
ON customers.id = orders.customer_id;

+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-01-03 | 458.25 |
| NULL       | NULL      | 2024-04-13 | 100.00 |
+------------+-----------+------------+--------+


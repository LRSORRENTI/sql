# Cross Joins 

We've cemented our customers, and orders relationship by using the REFERENCE keyword and pointing to the customer table id

We'll start simple, write a query that returns all the orders placed by Boy George

First thing we need is Boy's id, which in our example is easy since there's so few customers, but imagine the data set is gigantic

SELECT id FROM customers WHERE first_name = 'Boy' &&last_name = 'George';

+----+
| id |
+----+
|  1 |
+----+

SELECT * FROM orders WHERE customer_id = 1;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
+----+------------+--------+-------------+

Now above we have all of Boy's orders, we could sum them up, average or do anything. 

But what if we want to see values from the customers table as well, the above query isn't enough to get us there, we need 

## Using Cross Join

Cross joins aren't common, but useful to know how to perform them

SELECT * FROM customers, orders;

+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  5 | Bette      | Davis     | bette@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  1 | 2016-02-10 |  99.99 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  5 | Bette      | Davis     | bette@gmail.com  |  2 | 2017-11-11 |  35.50 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  2 | 2017-11-11 |  35.50 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  2 | 2017-11-11 |  35.50 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  5 | Bette      | Davis     | bette@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  3 | 2014-12-12 | 800.67 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  1 | Boy        | George    | george@gmail.com |  3 | 2014-12-12 | 800.67 |           2 |
|  5 | Bette      | Davis     | bette@gmail.com  |  4 | 2015-01-03 |  12.50 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  4 | 2015-01-03 |  12.50 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  4 | 2015-01-03 |  12.50 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  1 | Boy        | George    | george@gmail.com |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@gmail.com  |  5 | 1999-01-03 | 458.25 |           5 |
|  4 | Blue       | Steele    | blue@gmail.com   |  5 | 1999-01-03 | 458.25 |           5 |
|  3 | David      | Bowie     | david@gmail.com  |  5 | 1999-01-03 | 458.25 |           5 |
|  2 | George     | Michael   | gm@gmail.com     |  5 | 1999-01-03 | 458.25 |           5 |
|  1 | Boy        | George    | george@gmail.com |  5 | 1999-01-03 | 458.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+

It's not particularly useful, but important to know it's possible, it just takes all info from both tables and returns a cross joined table
# IS NULL 

To check for any NULL values we can use IS NULL to check against specified values

SELECT * FROM books where author_fname IS NULL;
+---------+------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title            | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+------------------+--------------+--------------+---------------+----------------+-------+
|      20 | Summa Theologica | NULL         | Aquinas      |          1265 |             10 |  3000 |
+---------+------------------+--------------+--------------+---------------+----------------+-------+

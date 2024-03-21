# Matching special chars 

What if we want to match a book with a %, or _ in the title? 

In these situations you can use the escape character to escape it with a backslash 

SELECT * FROM books WHERE title LIKE '%\%%';
+---------+-------------+--------------+--------------+---------------+----------------+-------+
| book_id | title       | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------+--------------+--------------+---------------+----------------+-------+
|      17 | 10% Happier | Dan          | Harris       |          2014 |             29 |   256 |
+---------+-------------+--------------+--------------+---------------+----------------+-------+

SELECT * FROM books WHERE title LIKE '%\_%';
+---------+-----------+--------------+--------------+---------------+----------------+-------+
| book_id | title     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------+--------------+--------------+---------------+----------------+-------+
|      18 | fake_book | Freida       | Harris       |          2001 |            287 |   428 |
+---------+-----------+--------------+--------------+---------------+----------------+-------+

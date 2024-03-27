# Min and Max 

Min and max are aggregate functions that help us locate the minimum and maximum values from a set of data

SELECT MIN(released_year) FROM books;
+--------------------+
| MIN(released_year) |
+--------------------+
|               1945 |
+--------------------+

SELECT MAX(pages) FROM books;
+------------+
| MAX(pages) |
+------------+
|        634 |
+------------+

SELECT MIN(author_lname), MAX(author_lname) FROM books;

With this query we return the lowest alphabetical (C), and highest alphabetical (S)
+-------------------+-------------------+
| MIN(author_lname) | MAX(author_lname) |
+-------------------+-------------------+
| Carver            | Steinbeck         |
+-------------------+-------------------+

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+

## Subqueries

We can also chain on a subquery, this can be especially helpful for finding and returning data we need, subqueries are defined with an =, and and inner wrapped (SELECT)

SELECT * FROM books WHERE pages = (SELECT Min(pages) FROM books);
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
+---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+

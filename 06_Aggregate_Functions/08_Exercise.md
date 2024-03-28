# End of section exercise:

1. Print the total number of books in the database

SELECT COUNT(book_id) AS total_num_books FROM book
s;
+-----------------+
| total_num_books |
+-----------------+
|              19 |
+-----------------+


2. Print out how many books were released in each year

SELECT released_year, COUNT(*) AS books_that_year
 FROM books GROUP BY  released_year ORDER BY books_that_year ASC;
+---------------+-----------------+
| released_year | books_that_year |
+---------------+-----------------+
|          2016 |               1 |
|          1996 |               1 |
|          2012 |               1 |
|          2013 |               1 |
|          2000 |               1 |
|          2010 |               1 |
|          1981 |               1 |
|          1989 |               1 |
|          1985 |               1 |
|          1945 |               1 |
|          2004 |               1 |
|          2005 |               1 |
|          2014 |               1 |
|          2017 |               1 |
|          2003 |               2 |
|          2001 |               3 |
+---------------+-----------------+



3. Print the total number of books in stock for all books 

SELECT SUM(stock_quantity) FROM books;
+---------------------+
| SUM(stock_quantity) |
+---------------------+
|                2450 |
+---------------------+


4. Find the average released year for every author, be conscious that we have more than one author with the last name harris

SELECT CONCAT(author_fname, author_lname) AS author_name, AVG(released_year), COUNT(*) FROM books GROUP BY(author_name);;
+---------------------+--------------------+----------+
| author_name         | AVG(released_year) | COUNT(*) |
+---------------------+--------------------+----------+
| JhumpaLahiri        |          1999.5000 |        2 |
| NeilGaiman          |          2006.6667 |        3 |
| DaveEggers          |          2008.6667 |        3 |
| MichaelChabon       |          2000.0000 |        1 |
| PattiSmith          |          2010.0000 |        1 |
| RaymondCarver       |          1985.0000 |        2 |
| DonDeLillo          |          1985.0000 |        1 |
| JohnSteinbeck       |          1945.0000 |        1 |
| DavidFoster Wallace |          2004.5000 |        2 |
| DanHarris           |          2014.0000 |        1 |
| FreidaHarris        |          2001.0000 |        1 |
| GeorgeSaunders      |          2017.0000 |        1 |
+---------------------+--------------------+----------+

5. Find the full name, and use concat, of the author who's written the longest book

SELECT CONCAT(author_fname, ' ', author_lname) as
full_name, MAX(pages) FROM books GROUP BY full_name ORDER BY MAX(pages) DESC LIMIT 1;
+----------------+------------+
| full_name      | MAX(pages) |
+----------------+------------+
| Michael Chabon |        634 |
+----------------+------------+

### NOTE: 
There's a subquery version of the above query:
SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);


6. Return three columns, first the year in ASC order, seond the num books released for that year. third the avg pages of all books released that year

SELECT released_year AS year FROM books  ORDER BY
released_year ASC;
+------+
| year |
+------+
| 1945 |
| 1981 |
| 1985 |
| 1989 |
| 1996 |
| 2000 |
| 2001 |
| 2001 |
| 2001 |
| 2003 |
| 2003 |
| 2004 |
| 2005 |
| 2010 |
| 2012 |
| 2013 |
| 2014 |
| 2016 |
| 2017 |
+------+
SELECT released_year AS year, COUNT(*) AS '# books', AVG(pages) AS 'avg pages' FROM books GROUP BY year ORDER BY released_year ASC;
+------+---------+-----------+
| year | # books | avg pages |
+------+---------+-----------+
| 1945 |       1 |  181.0000 |
| 1981 |       1 |  176.0000 |
| 1985 |       1 |  320.0000 |
| 1989 |       1 |  526.0000 |
| 1996 |       1 |  198.0000 |
| 2000 |       1 |  634.0000 |
| 2001 |       3 |  443.3333 |
| 2003 |       2 |  249.5000 |
| 2004 |       1 |  329.0000 |
| 2005 |       1 |  343.0000 |
| 2010 |       1 |  304.0000 |
| 2012 |       1 |  352.0000 |
| 2013 |       1 |  504.0000 |
| 2014 |       1 |  256.0000 |
| 2016 |       1 |  304.0000 |
| 2017 |       1 |  367.0000 |
+------+---------+-----------+

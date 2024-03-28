# AVG

AVG is another commonly used aggregate functiom, we could use it to find the average released year across our books data set, or refine by author, and find the specific author's average released year

SELECT author_lname, AVG(released_year) FROM books GROUP BY(author_lname);
+----------------+--------------------+
| author_lname   | AVG(released_year) |
+----------------+--------------------+
| Lahiri         |          1999.5000 |
| Gaiman         |          2006.6667 |
| Eggers         |          2008.6667 |
| Chabon         |          2000.0000 |
| Smith          |          2010.0000 |
| Carver         |          1985.0000 |
| DeLillo        |          1985.0000 |
| Steinbeck      |          1945.0000 |
| Foster Wallace |          2004.5000 |
| Harris         |          2007.5000 |
| Saunders       |          2017.0000 |
+----------------+--------------------+

SELECT released_year, AVG(stock_quantity), COUNT(*) FROM books GROUP BY released_year;
+---------------+---------------------+----------+
| released_year | AVG(stock_quantity) | COUNT(*) |
+---------------+---------------------+----------+
|          2003 |             66.0000 |        2 |
|          2016 |             43.0000 |        1 |
|          2001 |            134.3333 |        3 |
|          1996 |             97.0000 |        1 |
|          2012 |            154.0000 |        1 |
|          2013 |             26.0000 |        1 |
|          2000 |             68.0000 |        1 |
|          2010 |             55.0000 |        1 |
|          1981 |             23.0000 |        1 |
|          1989 |             12.0000 |        1 |
|          1985 |             49.0000 |        1 |
|          1945 |             95.0000 |        1 |
|          2004 |            172.0000 |        1 |
|          2005 |             92.0000 |        1 |
|          2014 |             29.0000 |        1 |
|          2017 |           1000.0000 |        1 |
+---------------+---------------------+----------+


# GROUP BY

GROUP BY summarizes or aggregates identical data into single rows 

SELECT author_lname FROM books GROUP BY author_lname;
+----------------+
| author_lname   |
+----------------+
| Lahiri         |
| Gaiman         |
| Eggers         |
| Chabon         |
| Smith          |
| Carver         |
| DeLillo        |
| Steinbeck      |
| Foster Wallace |
| Harris         |
| Saunders       |
+----------------+

Above you can see what group by returns, it looks similar to the query for distinct author_lname, but under the hood, we have a much different query than the distinct query. 

SELECT author_lname, COUNT(*) AS books_written FROM books GROUP BY author_lname ORDER BY books_written DESC;
+----------------+---------------+
| author_lname   | books_written |
+----------------+---------------+
| Gaiman         |             3 |
| Eggers         |             3 |
| Lahiri         |             2 |
| Carver         |             2 |
| Foster Wallace |             2 |
| Harris         |             2 |
| Chabon         |             1 |
| Smith          |             1 |
| DeLillo        |             1 |
| Steinbeck      |             1 |
| Saunders       |             1 |
+----------------+---------------+

SELECT released_year, COUNT(*) AS books_released_total FROM books
    -> GROUP BY released_year ORDER BY books_released_total DESC;
+---------------+----------------------+
| released_year | books_released_total |
+---------------+----------------------+
|          2001 |                    3 |
|          2003 |                    2 |
|          2016 |                    1 |
|          1996 |                    1 |
|          2012 |                    1 |
|          2013 |                    1 |
|          2000 |                    1 |
|          2010 |                    1 |
|          1981 |                    1 |
|          1989 |                    1 |
|          1985 |                    1 |
|          1945 |                    1 |
|          2004 |                    1 |
|          2005 |                    1 |
|          2014 |                    1 |
|          2017 |                    1 |
+---------------+----------------------+

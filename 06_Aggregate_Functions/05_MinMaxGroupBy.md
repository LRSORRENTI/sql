# Min / Max with Group By

The below query returns the first book each author released

SELECT author_lname, MIN(released_year) AS earliest_book FROM books GROUP BY author_lname ORDER BY MIN(released_year) ASC;
+----------------+---------------+
| author_lname   | earliest_book |
+----------------+---------------+
| Steinbeck      |          1945 |
| Carver         |          1981 |
| DeLillo        |          1985 |
| Lahiri         |          1996 |
| Chabon         |          2000 |
| Gaiman         |          2001 |
| Eggers         |          2001 |
| Harris         |          2001 |
| Foster Wallace |          2004 |
| Smith          |          2010 |
| Saunders       |          2017 |
+----------------+---------------+

SELECT author_lname, MAX(released_year) AS latest_book FROM books GROUP BY author_lname ORDER BY MAX(released_year) ASC;
+----------------+-------------+
| author_lname   | latest_book |
+----------------+-------------+
| Steinbeck      |        1945 |
| DeLillo        |        1985 |
| Carver         |        1989 |
| Chabon         |        2000 |
| Lahiri         |        2003 |
| Foster Wallace |        2005 |
| Smith          |        2010 |
| Eggers         |        2013 |
| Harris         |        2014 |
| Gaiman         |        2016 |
| Saunders       |        2017 |
+----------------+-------------+

SELECT CONCAT(author_lname, ' ', author_lname) AS name,
       
    -> COUNT(*) AS books_written,
    -> MAX(released_year) AS latest_book,
    -> MIN(released_year) AS first_book,
    -> FROM books GROUP BY author_fname, author_lname
    -> ORDER BY COUNT(*) ASC;
+----------------+---------------+-------------+------------+
| author_lname   | books_written | latest_book | first_book |
+----------------+---------------+-------------+------------+
| Chabon         |             1 |        2000 |       2000 |
| Smith          |             1 |        2010 |       2010 |
| DeLillo        |             1 |        1985 |       1985 |
| Steinbeck      |             1 |        1945 |       1945 |
| Saunders       |             1 |        2017 |       2017 |
| Lahiri         |             2 |        2003 |       1996 |
| Carver         |             2 |        1989 |       1981 |
| Foster Wallace |             2 |        2005 |       2004 |
| Harris         |             2 |        2014 |       2001 |
| Gaiman         |             3 |        2016 |       2001 |
| Eggers         |             3 |        2013 |       2001 |
+----------------+---------------+-------------+------------+

# SUM 

The next aggregate function we'll look at is SUM, sum is used to sum up values, like all the pages from the emtire books table

SELECT SUM(pages) FROM books;
+------------+
| SUM(pages) |
+------------+
|       6623 |
+------------+

But SUM is often paired with GROUP BY to narrow down the sum total, like to SUM all the pages, or books written by a given author 

SELECT author_lname, SUM(pages) FROM books GROUP BY author_lname;
+----------------+------------+
| author_lname   | SUM(pages) |
+----------------+------------+
| Lahiri         |        489 |
| Gaiman         |        977 |
| Eggers         |       1293 |
| Chabon         |        634 |
| Smith          |        304 |
| Carver         |        702 |
| DeLillo        |        320 |
| Steinbeck      |        181 |
| Foster Wallace |        672 |
| Harris         |        684 |
| Saunders       |        367 |
+----------------+------------+

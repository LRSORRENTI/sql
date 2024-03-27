# Group By multiple columns

SELECT CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*) AS books_written FROM books GROUP BY author_lname, author_fname ORDER BY COUNT(*) DESC;
+----------------------+---------------+
| author               | books_written |
+----------------------+---------------+
| Neil Gaiman          |             3 |
| Dave Eggers          |             3 |
| Jhumpa Lahiri        |             2 |
| Raymond Carver       |             2 |
| David Foster Wallace |             2 |
| Michael Chabon       |             1 |
| Patti Smith          |             1 |
| Don DeLillo          |             1 |
| John Steinbeck       |             1 |
| Dan Harris           |             1 |
| Freida Harris        |             1 |
| George Saunders      |             1 |
+----------------------+---------------+

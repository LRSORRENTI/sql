# Aggregate Functions Intro 

We use aggregate functions to operate on data to tell us the average, min, or max of a given data set 

## COUNT 

The COUNT function is built into MySQL, we can use COUNT to return the amount of a piece of data, and passing in '*' is going to return the total rows: 

SELECT COUNT(*) FROM books;
+----------+
| COUNT(*) |
+----------+
|       19 |
+----------+
1 row in set (0.02 sec)

SELECT DISTINCT(COUNT(author_fname)) FROM books;
+-----------------------+
| (COUNT(author_fname)) |
+-----------------------+
|                    19 |
+-----------------------+

SELECT COUNT(DISTINCT(released_year)) FROM books;
+--------------------------------+
| COUNT(DISTINCT(released_year)) |
+--------------------------------+
|                             16 |
+--------------------------------+

SELECT COUNT(DISTINCT(author_lname)) FROM books;
+-------------------------------+
| COUNT(DISTINCT(author_lname)) |
+-------------------------------+
|                            11 |
+-------------------------------+


SELECT title FROM books WHERE title LIKE '%the%';
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Namesake                              |
| A Hologram for the King: A Novel          |
| The Circle                                |
| The Amazing Adventures of Kavalier & Clay |
| Consider the Lobster                      |
| Lincoln In The Bardo                      |
+-------------------------------------------+

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
+----------+
| COUNT(*) |
+----------+
|        6 |
+----------+

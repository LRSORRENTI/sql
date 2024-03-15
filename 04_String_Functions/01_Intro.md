# Books 

We have a .sql file, and we'll run it from the command line to create the db and table 

```
source book_data.sql
```

## Concat 

Concat is a way to concatenate and join strings between rows

Concat takes any number of string arguments and returns a concatenated version.

SELECT CONCAT('H', 'e', 'l', 'l', 'o', 'W', 'o', 'r', 'l', 'd');
+----------------------------------------------------------+
| CONCAT('H', 'e', 'l', 'l', 'o', 'W', 'o', 'r', 'l', 'd') |
+----------------------------------------------------------+
| HelloWorld                                               |
+----------------------------------------------------------+
1 row in set (0.02 sec)

The above isn't very useful but it shows an important concept, we can use CONCAT to join together real data from SQL 

We could use CONCAT to return the author's first, and last name from the books db

 SELECT CONCAT(author_fname, '!!!') FROM books;
+-----------------------------+
| CONCAT(author_fname, '!!!') |
+-----------------------------+
| Jhumpa!!!                   |
| Neil!!!                     |
| Neil!!!                     |
| Jhumpa!!!                   |
| Dave!!!                     |
| Dave!!!                     |
| Michael!!!                  |
| Patti!!!                    |
| Dave!!!                     |
| Neil!!!                     |
| Raymond!!!                  |
| Raymond!!!                  |
| Don!!!                      |
| John!!!                     |
| David!!!                    |
| David!!!                    |
+-----------------------------+
16 rows in set (0.02 sec)

SELECT CONCAT(author_fname,' ', author_lname) FROM
 books;
+----------------------------------------+
| CONCAT(author_fname, ' ', author_lname) |
+----------------------------------------+
| Jhumpa Lahiri                          |
| Neil Gaiman                            |
| Neil Gaiman                            |
| Jhumpa Lahiri                          |
| Dave Eggers                            |
| Dave Eggers                            |
| Michael Chabon                         |
| Patti Smith                            |
| Dave Eggers                            |
| Neil Gaiman                            |
| Raymond Carver                         |
| Raymond Carver                         |
| Don DeLillo                            |
| John Steinbeck                         |
| David Foster Wallace                   |
| David Foster Wallace                   |
+----------------------------------------+
16 rows in set (0.01 sec)


We can also provide an alias for a cleaner return statement:

 SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM
    ->  books;
+----------------------+
| author_name          |
+----------------------+
| Jhumpa Lahiri        |
| Neil Gaiman          |
| Neil Gaiman          |
| Jhumpa Lahiri        |
| Dave Eggers          |
| Dave Eggers          |
| Michael Chabon       |
| Patti Smith          |
| Dave Eggers          |
| Neil Gaiman          |
| Raymond Carver       |
| Raymond Carver       |
| Don DeLillo          |
| John Steinbeck       |
| David Foster Wallace |
| David Foster Wallace |
+----------------------+
16 rows in set (0.00 sec)

## CONCAT_WS 

There's another way to concat, that's with separator or CONCAT_WS

When using the _WS version, as a first argument, we pass in the thing we'd like to use as a separator:

SELECT CONCAT_WS(' - ', author_fname, author_lname) FROM books;
+----------------------------------------------+
| CONCAT_WS(' - ', author_fname, author_lname) |
+----------------------------------------------+
| Jhumpa - Lahiri                              |
| Neil - Gaiman                                |
| Neil - Gaiman                                |
| Jhumpa - Lahiri                              |
| Dave - Eggers                                |
| Dave - Eggers                                |
| Michael - Chabon                             |
| Patti - Smith                                |
| Dave - Eggers                                |
| Neil - Gaiman                                |
| Raymond - Carver                             |
| Raymond - Carver                             |
| Don - DeLillo                                |
| John - Steinbeck                             |
| David - Foster Wallace                       |
| David - Foster Wallace                       |
+----------------------------------------------+


SELECT CONCAT_WS('-', title, author_fname, author_lname) FROM books;
+--------------------------------------------------------------------+
| CONCAT_WS('-', title, author_fname, author_lname)                  |
+--------------------------------------------------------------------+
| The Namesake-Jhumpa-Lahiri                                         |
| Norse Mythology-Neil-Gaiman                                        |
| American Gods-Neil-Gaiman                                          |
| Interpreter of Maladies-Jhumpa-Lahiri                              |
| A Hologram for the King: A Novel-Dave-Eggers                       |
| The Circle-Dave-Eggers                                             |
| The Amazing Adventures of Kavalier & Clay-Michael-Chabon           |
| Just Kids-Patti-Smith                                              |
| A Heartbreaking Work of Staggering Genius-Dave-Eggers              |
| Coraline-Neil-Gaiman                                               |
| What We Talk About When We Talk About Love: Stories-Raymond-Carver |
| Where I'm Calling From: Selected Stories-Raymond-Carver            |
| White Noise-Don-DeLillo                                            |
| Cannery Row-John-Steinbeck                                         |
| Oblivion: Stories-David-Foster Wallace                             |
| Consider the Lobster-David-Foster Wallace                          |
+--------------------------------------------------------------------+

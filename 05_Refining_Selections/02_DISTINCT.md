# DISTINCT 

Distinct is a clause that allows for returning unique results from a query, excluding any duplicates 

Here's an example of a query without distinct:

```
SELECT  author_lname FROM books;
+----------------+
| author_lname   |
+----------------+
| Lahiri         |
| Gaiman         |
| Gaiman         |
| Lahiri         |
| Eggers         |
| Eggers         |
| Chabon         |
| Smith          |
| Eggers         |
| Gaiman         |
| Carver         |
| Carver         |
| DeLillo        |
| Steinbeck      |
| Foster Wallace |
| Foster Wallace |
| Harris         |
| Harris         |
| Saunders       |
+----------------+

```

And using DISTINCT: 
```
 SELECT DISTINCT author_lname FROM books;
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

```

We can see that the query returns only each author's lastname distinctly.

## Another example:

SELECT released_year FROM books;
+---------------+
| released_year |
+---------------+
|          2003 |
|          2016 |
|          2001 |
|          1996 |
|          2012 |
|          2013 |
|          2000 |
|          2010 |
|          2001 |
|          2003 |
|          1981 |
|          1989 |
|          1985 |
|          1945 |
|          2004 |
|          2005 |
|          2014 |
|          2001 |
|          2017 |
+---------------+

SELECT DISTINCT released_year FROM books;
+---------------+
| released_year |
+---------------+
|          2003 |
|          2016 |
|          2001 |
|          1996 |
|          2012 |
|          2013 |
|          2000 |
|          2010 |
|          1981 |
|          1989 |
|          1985 |
|          1945 |
|          2004 |
|          2005 |
|          2014 |
|          2017 |
+---------------+

## Third example

Without DISTINCT:

SELECT CONCAT(author_fname, author_lname) FROM books;
+------------------------------------+
| CONCAT(author_fname, author_lname) |
+------------------------------------+
| JhumpaLahiri                       |
| NeilGaiman                         |
| NeilGaiman                         |
| JhumpaLahiri                       |
| DaveEggers                         |
| DaveEggers                         |
| MichaelChabon                      |
| PattiSmith                         |
| DaveEggers                         |
| NeilGaiman                         |
| RaymondCarver                      |
| RaymondCarver                      |
| DonDeLillo                         |
| JohnSteinbeck                      |
| DavidFoster Wallace                |
| DavidFoster Wallace                |
| DanHarris                          |
| FreidaHarris                       |
| GeorgeSaunders                     |
+------------------------------------+

Using DISTINCT

SELECT DISTINCT CONCAT(author_fname, ' ',  author_lname) AS 'distinct names' FROM books;
+----------------------+
| distinct names       |
+----------------------+
| Jhumpa Lahiri        |
| Neil Gaiman          |
| Dave Eggers          |
| Michael Chabon       |
| Patti Smith          |
| Raymond Carver       |
| Don DeLillo          |
| John Steinbeck       |
| David Foster Wallace |
| Dan Harris           |
| Freida Harris        |
| George Saunders      |
+----------------------+
12 rows in set (0.00 sec)

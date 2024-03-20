# More on order by 

Often you'll see a number included directly after the order by statement:

SELECT title, author_fname, author_lname FROM books ORDER BY 2;

It's basically a shorthand for order by the second column selected, if you had three our four columns, you pass in 3 for order by col 3 etc.. 

Often it's an easier way to sort, especially if column names are long, but passing in the name of the column to sort by instead is more direct and informative as a query

## Order by multiple columns 

We can order by multiple columns as well, notice how we first order by author last name, which is correct, then notice for each of carvers, and eggers books those are in ASC order eggers 2001, eggers 2012, eggers 2013 etc. We can order first by author_lname, then order the released_year for each ordered author as well

SELECT author_lname, released_year, title FROM books ORDER BY author_lname, released_year;
+----------------+---------------+-----------------------------------------------------+
| author_lname   | released_year | title                                               |
+----------------+---------------+-----------------------------------------------------+
| Carver         |          1981 | What We Talk About When We Talk About Love: Stories |
| Carver         |          1989 | Where I'm Calling From: Selected Stories            |
| Chabon         |          2000 | The Amazing Adventures of Kavalier & Clay           |
| DeLillo        |          1985 | White Noise                                         |
| Eggers         |          2001 | A Heartbreaking Work of Staggering Genius           |
| Eggers         |          2012 | A Hologram for the King: A Novel                    |
| Eggers         |          2013 | The Circle                                          |
| Foster Wallace |          2004 | Oblivion: Stories                                   |
| Foster Wallace |          2005 | Consider the Lobster                                |
| Gaiman         |          2001 | American Gods                                       |
| Gaiman         |          2003 | Coraline                                            |
| Gaiman         |          2016 | Norse Mythology                                     |
| Harris         |          2001 | fake_book                                           |
| Harris         |          2014 | 10% Happier                                         |
| Lahiri         |          1996 | Interpreter of Maladies                             |
| Lahiri         |          2003 | The Namesake                                        |
| Saunders       |          2017 | Lincoln In The Bardo                                |
| Smith          |          2010 | Just Kids                                           |
| Steinbeck      |          1945 | Cannery Row                                         |
+----------------+---------------+-----------------------------------------------------+


SELECT CONCAT (author_fname, ' ', author_lname) AS author FROM books ORDER BY author_lname;
+----------------------+
| author               |
+----------------------+
| Raymond Carver       |
| Raymond Carver       |
| Michael Chabon       |
| Don DeLillo          |
| Dave Eggers          |
| Dave Eggers          |
| Dave Eggers          |
| David Foster Wallace |
| David Foster Wallace |
| Neil Gaiman          |
| Neil Gaiman          |
| Neil Gaiman          |
| Dan Harris           |
| Freida Harris        |
| Jhumpa Lahiri        |
| Jhumpa Lahiri        |
| George Saunders      |
| Patti Smith          |
| John Steinbeck       |
+----------------------+
19 rows in set (0.00 sec)

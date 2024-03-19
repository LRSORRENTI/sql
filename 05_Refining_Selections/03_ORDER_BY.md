# ORDER BY 

Order by is used to sort results from our queries 

Often times you'll want to sort, or order your data numerically, alphabetically, descending or ascending order

Below is a sorted alphabetical query: 

SELECT DISTINCT author_lname FROM books ORDER BY author_lname;
+----------------+
| author_lname   |
+----------------+
| Carver         |
| Chabon         |
| DeLillo        |
| Eggers         |
| Foster Wallace |
| Gaiman         |
| Harris         |
| Lahiri         |
| Saunders       |
| Smith          |
| Steinbeck      |
+----------------+
11 rows in set (0.00 sec)

Notice the Order By clause position, it always comes after the FROM tablename statement 

## ASCENDING BY DEFAULT 

By default order by will return the data in ascending order A-Z, 1-99 etc..

You can pass in the DESC clause to inverse this  

SELECT DISTINCT author_lname FROM books ORDER BY author_lname DESC;
+----------------+
| author_lname   |
+----------------+
| Steinbeck      |
| Smith          |
| Saunders       |
| Lahiri         |
| Harris         |
| Gaiman         |
| Foster Wallace |
| Eggers         |
| DeLillo        |
| Chabon         |
| Carver         |
+----------------+

## If data is organized descendingly, you can pass in ASC to inverse it, but by default the order by clause returns data in ASC anyway 

SELECT title, released_year FROM books ORDER BY released_year;
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| Cannery Row                                         |          1945 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| White Noise                                         |          1985 |
| Where I'm Calling From: Selected Stories            |          1989 |
| Interpreter of Maladies                             |          1996 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |
| fake_book                                           |          2001 |
| American Gods                                       |          2001 |
| A Heartbreaking Work of Staggering Genius           |          2001 |
| Coraline                                            |          2003 |
| The Namesake                                        |          2003 |
| Oblivion: Stories                                   |          2004 |
| Consider the Lobster                                |          2005 |
| Just Kids                                           |          2010 |
| A Hologram for the King: A Novel                    |          2012 |
| The Circle                                          |          2013 |
| 10% Happier                                         |          2014 |
| Norse Mythology                                     |          2016 |
| Lincoln In The Bardo                                |          2017 |
+-----------------------------------------------------+---------------+
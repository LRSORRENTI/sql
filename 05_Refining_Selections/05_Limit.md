# Limit Clause 

We can limit the amount of results from a query with the limit clause

It comes at the end of the query, and takes a number argument: 

SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Lincoln In The Bardo             |          2017 |
| Norse Mythology                  |          2016 |
| 10% Happier                      |          2014 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+
5 rows in set (0.01 sec)

## NOTE 

Limit can also take two args, for example to achieve the same result as above use 0,5, which is 'start and end position'

 SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 0,5;

+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Lincoln In The Bardo             |          2017 |
| Norse Mythology                  |          2016 |
| 10% Happier                      |          2014 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+


SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 1,6;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Norse Mythology                  |          2016 |
| 10% Happier                      |          2014 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
| Just Kids                        |          2010 |
| Consider the Lobster             |          2005 |
+----------------------------------+---------------+

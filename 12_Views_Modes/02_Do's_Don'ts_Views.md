# What we can and can't do with views and why

Views may act, and look like a table but it's important to remember they are not full-fledged tables 

This means not all table operations are available for us to perform when working with a virtual table view 

SELECT * FROM full_reviews;

+----------------------+---------------+-----------+--------+------------+-----------+
| title                | released_year | genre     | rating | first_name | last_name |
+----------------------+---------------+-----------+--------+------------+-----------+
| Archer               |          2009 | Animation |    8.0 | Thomas     | Stoneman  |
| Arrested Development |          2003 | Comedy    |    8.1 | Thomas     | Stoneman  |
| Bob's Burgers        |          2011 | Animation |    7.0 | Thomas     | Stoneman  |
| Bojack Horseman      |          2014 | Animation |    7.5 | Thomas     | Stoneman  |
| Breaking Bad         |          2008 | Drama     |    9.5 | Thomas     | Stoneman  |
| Archer               |          2009 | Animation |    7.5 | Wyatt      | Skaggs    |
| Bojack Horseman      |          2014 | Animation |    7.6 | Wyatt      | Skaggs    |
| Breaking Bad         |          2008 | Drama     |    9.3 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    6.5 | Wyatt      | Skaggs    |
| Curb Your Enthusiasm |          2000 | Comedy    |    8.4 | Wyatt      | Skaggs    |
| Fargo                |          2014 | Drama     |    9.1 | Wyatt      | Skaggs    |
| Freaks and Geeks     |          1999 | Comedy    |    7.8 | Wyatt      | Skaggs    |
| General Hospital     |          1963 | Drama     |    5.5 | Wyatt      | Skaggs    |
| Stranger Things      |          2016 | Drama     |    8.5 | Wyatt      | Skaggs    |
| Archer               |          2009 | Animation |    8.5 | Kimbra     | Masters   |
| Arrested Development |          2003 | Comedy    |    8.0 | Kimbra     | Masters   |
| Bob's Burgers        |          2011 | Animation |    7.1 | Kimbra     | Masters   |
| Bojack Horseman      |          2014 | Animation |    7.8 | Kimbra     | Masters   |
| Breaking Bad         |          2008 | Drama     |    9.0 | Kimbra     | Masters   |
| Curb Your Enthusiasm |          2000 | Comedy    |    7.8 | Kimbra     | Masters   |
| General Hospital     |          1963 | Drama     |    6.8 | Kimbra     | Masters   |
| Seinfeld             |          1989 | Comedy    |    8.0 | Kimbra     | Masters   |
| Stranger Things      |          2016 | Drama     |    8.9 | Kimbra     | Masters   |
| Archer               |          2009 | Animation |    7.7 | Domingo    | Cortes    |
| Arrested Development |          2003 | Comedy    |    6.0 | Domingo    | Cortes    |
| Bob's Burgers        |          2011 | Animation |    8.0 | Domingo    | Cortes    |
| Bojack Horseman      |          2014 | Animation |    8.3 | Domingo    | Cortes    |
| Breaking Bad         |          2008 | Drama     |    9.1 | Domingo    | Cortes    |
| Curb Your Enthusiasm |          2000 | Comedy    |    8.8 | Domingo    | Cortes    |
| Freaks and Geeks     |          1999 | Comedy    |    8.5 | Domingo    | Cortes    |
| General Hospital     |          1963 | Drama     |    5.8 | Domingo    | Cortes    |
| Seinfeld             |          1989 | Comedy    |    7.2 | Domingo    | Cortes    |
| Stranger Things      |          2016 | Drama     |    8.9 | Domingo    | Cortes    |
| Archer               |          2009 | Animation |    8.9 | Colt       | Steele    |
| Arrested Development |          2003 | Comedy    |    9.9 | Colt       | Steele    |
| Bob's Burgers        |          2011 | Animation |    8.0 | Colt       | Steele    |
| Bojack Horseman      |          2014 | Animation |    8.5 | Colt       | Steele    |
| Breaking Bad         |          2008 | Drama     |    9.9 | Colt       | Steele    |
| Curb Your Enthusiasm |          2000 | Comedy    |    9.1 | Colt       | Steele    |
| Fargo                |          2014 | Drama     |    9.7 | Colt       | Steele    |
| Freaks and Geeks     |          1999 | Comedy    |    9.3 | Colt       | Steele    |
| General Hospital     |          1963 | Drama     |    4.5 | Colt       | Steele    |
| Halt and Catch Fire  |          2014 | Drama     |    9.9 | Colt       | Steele    |
| Arrested Development |          2003 | Comedy    |    8.4 | Pinkie     | Petit     |
| Bob's Burgers        |          2011 | Animation |    7.5 | Pinkie     | Petit     |
| Freaks and Geeks     |          1999 | Comedy    |    8.8 | Pinkie     | Petit     |
| General Hospital     |          1963 | Drama     |    4.3 | Pinkie     | Petit     |
+----------------------+---------------+-----------+--------+------------+-----------+

**Let's say we want to delete everything from the year 2010 in our virtual table**

In a normal table we could just 

DELETE FROM full_reviews WHERE releaed_year = 2010;

But if we try to run that DELETE operation:

ERROR 1395 (HY000): Can not delete from join view 'tv_show_reviews.full_reviews'

GROUP BY, sub queries, DISTINCT and many more SQL features aren't available on a Virtual table

## We can alter the structure of the view: 

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series;
+----+-----------------------+---------------+-----------+
| id | title                 | released_year | genre     |
+----+-----------------------+---------------+-----------+
|  9 | General Hospital      |          1963 | Drama     |
| 13 | Seinfeld              |          1989 | Comedy    |
|  8 | Freaks and Geeks      |          1999 | Comedy    |
|  6 | Curb Your Enthusiasm  |          2000 | Comedy    |
| 11 | Malcolm In The Middle |          2000 | Comedy    |
|  2 | Arrested Development  |          2003 | Comedy    |
| 12 | Pushing Daisies       |          2007 | Comedy    |
|  5 | Breaking Bad          |          2008 | Drama     |
|  1 | Archer                |          2009 | Animation |
|  3 | Bob's Burgers         |          2011 | Animation |
|  4 | Bojack Horseman       |          2014 | Animation |
|  7 | Fargo                 |          2014 | Drama     |
| 10 | Halt and Catch Fire   |          2014 | Drama     |
| 14 | Stranger Things       |          2016 | Drama     |
+----+-----------------------+---------------+-----------+

 **We use the OR REPLACE VIEW** to edit an existing view

CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

SELECT * FROM ordered_series;
+----+-----------------------+---------------+-----------+
| id | title                 | released_year | genre     |
+----+-----------------------+---------------+-----------+
| 14 | Stranger Things       |          2016 | Drama     |
|  4 | Bojack Horseman       |          2014 | Animation |
|  7 | Fargo                 |          2014 | Drama     |
| 10 | Halt and Catch Fire   |          2014 | Drama     |
|  3 | Bob's Burgers         |          2011 | Animation |
|  1 | Archer                |          2009 | Animation |
|  5 | Breaking Bad          |          2008 | Drama     |
| 12 | Pushing Daisies       |          2007 | Comedy    |
|  2 | Arrested Development  |          2003 | Comedy    |
|  6 | Curb Your Enthusiasm  |          2000 | Comedy    |
| 11 | Malcolm In The Middle |          2000 | Comedy    |
|  8 | Freaks and Geeks      |          1999 | Comedy    |
| 13 | Seinfeld              |          1989 | Comedy    |
|  9 | General Hospital      |          1963 | Drama     |
+----+-----------------------+---------------+-----------+

**There's also ALTER VIEW, this is another option to edit existing views**

ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series
+----+-----------------------+---------------+-----------+
| id | title                 | released_year | genre     |
+----+-----------------------+---------------+-----------+
|  9 | General Hospital      |          1963 | Drama     |
| 13 | Seinfeld              |          1989 | Comedy    |
|  8 | Freaks and Geeks      |          1999 | Comedy    |
|  6 | Curb Your Enthusiasm  |          2000 | Comedy    |
| 11 | Malcolm In The Middle |          2000 | Comedy    |
|  2 | Arrested Development  |          2003 | Comedy    |
| 12 | Pushing Daisies       |          2007 | Comedy    |
|  5 | Breaking Bad          |          2008 | Drama     |
|  1 | Archer                |          2009 | Animation |
|  3 | Bob's Burgers         |          2011 | Animation |
|  4 | Bojack Horseman       |          2014 | Animation |
|  7 | Fargo                 |          2014 | Drama     |
| 10 | Halt and Catch Fire   |          2014 | Drama     |
| 14 | Stranger Things       |          2016 | Drama     |
+----+-----------------------+---------------+-----------+


### And finally to delete a view:

DROP VIEW ordered_series;

### NOTE, this only deletes the virtual table, the data in our actual real table is unaffected
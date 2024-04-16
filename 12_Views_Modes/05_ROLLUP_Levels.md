# ROLLUP Levels 

SELECT released_year, AVG(rating) 
FROM full_reviews
GROUP BY released_year;

+---------------+-------------+
| released_year | AVG(rating) |
+---------------+-------------+
|          2009 |     8.12000 |
|          2003 |     8.08000 |
|          2011 |     7.52000 |
|          2014 |     8.55000 |
|          2008 |     9.36000 |
|          2000 |     8.12000 |
|          1999 |     8.60000 |
|          1963 |     5.38000 |
|          1989 |     7.60000 |
|          2016 |     8.76667 |
+---------------+-------------+


SELECT released_year, AVG(rating) 
FROM full_reviews
GROUP BY released_year WITH ROLLUP;

+---------------+-------------+
| released_year | AVG(rating) |
+---------------+-------------+
|          1963 |     5.38000 |
|          1989 |     7.60000 |
|          1999 |     8.60000 |
|          2000 |     8.12000 |
|          2003 |     8.08000 |
|          2008 |     9.36000 |
|          2009 |     8.12000 |
|          2011 |     7.52000 |
|          2014 |     8.55000 |
|          2016 |     8.76667 |
|          NULL |     8.02553 |
+---------------+-------------+

SELECT released_year, genre, AVG(rating) 
FROM full_reviews
GROUP BY released_year, genre WITH ROLLUP;

+---------------+-----------+-------------+
| released_year | genre     | AVG(rating) |
+---------------+-----------+-------------+
|          1963 | Drama     |     5.38000 |
|          1963 | NULL      |     5.38000 |
|          1989 | Comedy    |     7.60000 |
|          1989 | NULL      |     7.60000 |
|          1999 | Comedy    |     8.60000 |
|          1999 | NULL      |     8.60000 |
|          2000 | Comedy    |     8.12000 |
|          2000 | NULL      |     8.12000 |
|          2003 | Comedy    |     8.08000 |
|          2003 | NULL      |     8.08000 |
|          2008 | Drama     |     9.36000 |
|          2008 | NULL      |     9.36000 |
|          2009 | Animation |     8.12000 |
|          2009 | NULL      |     8.12000 |
|          2011 | Animation |     7.52000 |
|          2011 | NULL      |     7.52000 |
|          2014 | Animation |     7.94000 |
|          2014 | Drama     |     9.56667 |
|          2014 | NULL      |     8.55000 |
|          2016 | Drama     |     8.76667 |
|          2016 | NULL      |     8.76667 |
|          NULL | NULL      |     8.02553 |
+---------------+-----------+-------------+

What we see here is a lot of NULL values, each of which represent one of the summary statistic coming from ROLLUP

The data that returns from this rollup doesn't become interesting until we get to 2014, we get the avg of Animation, and Drama, then the 2014 NULL 8.55000 is the AVG between the two genres in 2014

SELECT 
    first_name, released_year, genre, AVG(rating)
FROM
    full_reviews
GROUP BY released_year , genre , first_name WITH ROLLUP;

+------------+---------------+-----------+-------------+
| first_name | released_year | genre     | AVG(rating) |
+------------+---------------+-----------+-------------+
| Colt       |          1963 | Drama     |     4.50000 |
| Domingo    |          1963 | Drama     |     5.80000 |
| Kimbra     |          1963 | Drama     |     6.80000 |
| Pinkie     |          1963 | Drama     |     4.30000 |
| Wyatt      |          1963 | Drama     |     5.50000 |
| NULL       |          1963 | Drama     |     5.38000 |
| NULL       |          1963 | NULL      |     5.38000 |
| Domingo    |          1989 | Comedy    |     7.20000 |
| Kimbra     |          1989 | Comedy    |     8.00000 |
| NULL       |          1989 | Comedy    |     7.60000 |
| NULL       |          1989 | NULL      |     7.60000 |
| Colt       |          1999 | Comedy    |     9.30000 |
| Domingo    |          1999 | Comedy    |     8.50000 |
| Pinkie     |          1999 | Comedy    |     8.80000 |
| Wyatt      |          1999 | Comedy    |     7.80000 |
| NULL       |          1999 | Comedy    |     8.60000 |
| NULL       |          1999 | NULL      |     8.60000 |
| Colt       |          2000 | Comedy    |     9.10000 |
| Domingo    |          2000 | Comedy    |     8.80000 |
| Kimbra     |          2000 | Comedy    |     7.80000 |
| Wyatt      |          2000 | Comedy    |     7.45000 |
| NULL       |          2000 | Comedy    |     8.12000 |
| NULL       |          2000 | NULL      |     8.12000 |
| Colt       |          2003 | Comedy    |     9.90000 |
| Domingo    |          2003 | Comedy    |     6.00000 |
| Kimbra     |          2003 | Comedy    |     8.00000 |
| Pinkie     |          2003 | Comedy    |     8.40000 |
| Thomas     |          2003 | Comedy    |     8.10000 |
| NULL       |          2003 | Comedy    |     8.08000 |
| NULL       |          2003 | NULL      |     8.08000 |
| Colt       |          2008 | Drama     |     9.90000 |
| Domingo    |          2008 | Drama     |     9.10000 |
| Kimbra     |          2008 | Drama     |     9.00000 |
| Thomas     |          2008 | Drama     |     9.50000 |
| Wyatt      |          2008 | Drama     |     9.30000 |
| NULL       |          2008 | Drama     |     9.36000 |
| NULL       |          2008 | NULL      |     9.36000 |
| Colt       |          2009 | Animation |     8.90000 |
| Domingo    |          2009 | Animation |     7.70000 |
| Kimbra     |          2009 | Animation |     8.50000 |
| Thomas     |          2009 | Animation |     8.00000 |
| Wyatt      |          2009 | Animation |     7.50000 |
| NULL       |          2009 | Animation |     8.12000 |
| NULL       |          2009 | NULL      |     8.12000 |
| Colt       |          2011 | Animation |     8.00000 |
| Domingo    |          2011 | Animation |     8.00000 |
| Kimbra     |          2011 | Animation |     7.10000 |
| Pinkie     |          2011 | Animation |     7.50000 |
| Thomas     |          2011 | Animation |     7.00000 |
| NULL       |          2011 | Animation |     7.52000 |
| NULL       |          2011 | NULL      |     7.52000 |
| Colt       |          2014 | Animation |     8.50000 |
| Domingo    |          2014 | Animation |     8.30000 |
| Kimbra     |          2014 | Animation |     7.80000 |
| Thomas     |          2014 | Animation |     7.50000 |
| Wyatt      |          2014 | Animation |     7.60000 |
| NULL       |          2014 | Animation |     7.94000 |
| Colt       |          2014 | Drama     |     9.80000 |
| Wyatt      |          2014 | Drama     |     9.10000 |
| NULL       |          2014 | Drama     |     9.56667 |
| NULL       |          2014 | NULL      |     8.55000 |
| Domingo    |          2016 | Drama     |     8.90000 |
| Kimbra     |          2016 | Drama     |     8.90000 |
| Wyatt      |          2016 | Drama     |     8.50000 |
| NULL       |          2016 | Drama     |     8.76667 |
| NULL       |          2016 | NULL      |     8.76667 |
| NULL       |          NULL | NULL      |     8.02553 |
+------------+---------------+-----------+-------------+

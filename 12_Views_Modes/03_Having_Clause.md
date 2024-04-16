# HAVING clause 

Let's take a look at the HAVING clause, which is used alongside GROUP BY to filter out certain data 

Let's take a look an example with our Virtual Table View full_reviews 

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

SELECT title, AVG(rating), COUNT(rating) FROM full_reviews GROUP BY title;

+----------------------+-------------+---------------+
| title                | AVG(rating) | COUNT(rating) |
+----------------------+-------------+---------------+
| Archer               |     8.12000 |             5 |
| Arrested Development |     8.08000 |             5 |
| Bob's Burgers        |     7.52000 |             5 |
| Bojack Horseman      |     7.94000 |             5 |
| Breaking Bad         |     9.36000 |             5 |
| Curb Your Enthusiasm |     8.12000 |             5 |
| Fargo                |     9.40000 |             2 |
| Freaks and Geeks     |     8.60000 |             4 |
| General Hospital     |     5.38000 |             5 |
| Halt and Catch Fire  |     9.90000 |             1 |
| Seinfeld             |     7.60000 |             2 |
| Stranger Things      |     8.76667 |             3 |
+----------------------+-------------+---------------+

Let's say we want to have this data, but only the ones that have greater than 1 review, we can't use the WHERE clause, but we can use HAVING 

SELECT 
    title,
    AVG(rating), 
    COUNT(rating)
FROM full_reviews
GROUP BY title HAVING COUNT(rating) > 1;

+----------------------+-------------+---------------+
| title                | AVG(rating) | COUNT(rating) |
+----------------------+-------------+---------------+
| Archer               |     8.12000 |             5 |
| Arrested Development |     8.08000 |             5 |
| Bob's Burgers        |     7.52000 |             5 |
| Bojack Horseman      |     7.94000 |             5 |
| Breaking Bad         |     9.36000 |             5 |
| Curb Your Enthusiasm |     8.12000 |             5 |
| Fargo                |     9.40000 |             2 |
| Freaks and Geeks     |     8.60000 |             4 |
| General Hospital     |     5.38000 |             5 |
| Seinfeld             |     7.60000 |             2 |
| Stranger Things      |     8.76667 |             3 |
+----------------------+-------------+---------------+


So we lose a show, we filtered out the shows that have only a single rating, and returned all shows with more than 1 rating 
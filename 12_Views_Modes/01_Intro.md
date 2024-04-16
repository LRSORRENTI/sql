# Introducing Views and Modes 

This section will be a mixed bag of important SQL concepts that aren't quite large enough to warrant their own section, but are necessary concepts and features widely used in SQL 

The first of which is 

## VIEWS 

A view is a named query we give a name to and store

Suppose you've written a query that fetches all the exact data you need, you can give that query a name and store it as a view. That way you don't have to write a long query over and over, we give it a name, and invoke it using the name we gave it

SELECT title, released_year, genre, rating, first_name, last_name FROM reviews 
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

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


The above query is pretty long to type out, but if we save it as a View, we can then reference and call the view instead of writing the long query over and over 

Let's create a View for this query 

## Creating the View 

The syntax looks like this, we call CREATE VIEW, a name for the view to create, then the AS keyword followed by our query

CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews 
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id
LIMIT 10;

**And this just created a ### VIRTUAL TABLE**

SHOW TABLES;

+---------------------------+
| Tables_in_tv_show_reviews |
+---------------------------+
| full_reviews              |
| reviewers                 |
| reviews                   |
| series                    |
+---------------------------+

See the View in there? We never created a table at the jump called full_reviews, but using the CREATE VIEW method created a virtual table, and now that it's a virtual table, is behaves similarly to a regular table, we can add LIMIT and GROUP BY if we want :

SELECT * FROM full_reviews LIMIT 10;

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
+----------------------+---------------+-----------+--------+------------+-----------+

SELECT * FROM full_reviews WHERE genre = 'Animation';

+-----------------+---------------+-----------+--------+------------+-----------+
| title           | released_year | genre     | rating | first_name | last_name |
+-----------------+---------------+-----------+--------+------------+-----------+
| Archer          |          2009 | Animation |    8.0 | Thomas     | Stoneman  |
| Archer          |          2009 | Animation |    7.5 | Wyatt      | Skaggs    |
| Archer          |          2009 | Animation |    8.5 | Kimbra     | Masters   |
| Archer          |          2009 | Animation |    7.7 | Domingo    | Cortes    |
| Archer          |          2009 | Animation |    8.9 | Colt       | Steele    |
| Bob's Burgers   |          2011 | Animation |    7.0 | Thomas     | Stoneman  |
| Bob's Burgers   |          2011 | Animation |    7.5 | Pinkie     | Petit     |
| Bob's Burgers   |          2011 | Animation |    8.0 | Domingo    | Cortes    |
| Bob's Burgers   |          2011 | Animation |    7.1 | Kimbra     | Masters   |
| Bob's Burgers   |          2011 | Animation |    8.0 | Colt       | Steele    |
| Bojack Horseman |          2014 | Animation |    7.5 | Thomas     | Stoneman  |
| Bojack Horseman |          2014 | Animation |    7.8 | Kimbra     | Masters   |
| Bojack Horseman |          2014 | Animation |    8.3 | Domingo    | Cortes    |
| Bojack Horseman |          2014 | Animation |    7.6 | Wyatt      | Skaggs    |
| Bojack Horseman |          2014 | Animation |    8.5 | Colt       | Steele    |
+-----------------+---------------+-----------+--------+------------+-----------+

SELECT genre, AVG(rating) FROM full_reviews GROUP BY genre;

+-----------+-------------+
| genre     | AVG(rating) |
+-----------+-------------+
| Animation |     7.86000 |
| Comedy    |     8.16250 |
| Drama     |     8.04375 |
+-----------+-------------+

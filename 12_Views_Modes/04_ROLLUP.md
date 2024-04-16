# ROLL UP

SELECT AVG(rating) FROM full_reviews;
+-------------+
| AVG(rating) |
+-------------+
|     8.02553 |
+-------------+

SELECT title, AVG(rating) FROM full_reviews GROUP BY title;

+----------------------+-------------+
| title                | AVG(rating) |
+----------------------+-------------+
| Archer               |     8.12000 |
| Arrested Development |     8.08000 |
| Bob's Burgers        |     7.52000 |
| Bojack Horseman      |     7.94000 |
| Breaking Bad         |     9.36000 |
| Curb Your Enthusiasm |     8.12000 |
| Fargo                |     9.40000 |
| Freaks and Geeks     |     8.60000 |
| General Hospital     |     5.38000 |
| Halt and Catch Fire  |     9.90000 |
| Seinfeld             |     7.60000 |
| Stranger Things      |     8.76667 |
+----------------------+-------------+

The distinction in the above two queries lies in the levels that AVG is performing, in the first query it's operating on every single show in the table, in the second query it's operating on groups of rows 

SELECT title, AVG(rating) FROM full_reviews GROUP BY title WITH ROLLUP;

Notice the WITH ROLLUP returns a very similar result to the previous query, with a notable addition NULL

+----------------------+-------------+
| title                | AVG(rating) |
+----------------------+-------------+
| Archer               |     8.12000 |
| Arrested Development |     8.08000 |
| Bob's Burgers        |     7.52000 |
| Bojack Horseman      |     7.94000 |
| Breaking Bad         |     9.36000 |
| Curb Your Enthusiasm |     8.12000 |
| Fargo                |     9.40000 |
| Freaks and Geeks     |     8.60000 |
| General Hospital     |     5.38000 |
| Halt and Catch Fire  |     9.90000 |
| Seinfeld             |     7.60000 |
| Stranger Things      |     8.76667 |
| NULL                 |     8.02553 |
+----------------------+-------------+

The last row is a summary average of all the rows, which if you notice is the exact same result number of our first query where we SELECT AVG(rating) FROM full_reviews;
+-------------+
| AVG(rating) |
+-------------+
|     8.02553 |
+-------------+

We could do the same for count

SELECT title, COUNT(rating) FROM full_reviews GROUP BY title;
+----------------------+---------------+
| title                | COUNT(rating) |
+----------------------+---------------+
| Archer               |             5 |
| Arrested Development |             5 |
| Bob's Burgers        |             5 |
| Bojack Horseman      |             5 |
| Breaking Bad         |             5 |
| Curb Your Enthusiasm |             5 |
| Fargo                |             2 |
| Freaks and Geeks     |             4 |
| General Hospital     |             5 |
| Halt and Catch Fire  |             1 |
| Seinfeld             |             2 |
| Stranger Things      |             3 |
+----------------------+---------------+


SELECT title, COUNT(rating) FROM full_reviews GROUP BY title WITH ROLLUP;

+----------------------+---------------+
| title                | COUNT(rating) |
+----------------------+---------------+
| Archer               |             5 |
| Arrested Development |             5 |
| Bob's Burgers        |             5 |
| Bojack Horseman      |             5 |
| Breaking Bad         |             5 |
| Curb Your Enthusiasm |             5 |
| Fargo                |             2 |
| Freaks and Geeks     |             4 |
| General Hospital     |             5 |
| Halt and Catch Fire  |             1 |
| Seinfeld             |             2 |
| Stranger Things      |             3 |
| NULL                 |            47 |
+----------------------+---------------+

We get a sum of all the ratings from our ROLLUP 
# Second Exercise 

Find the avg rating of all tv series, and rank them lowest to highest 

SELECT title, ROUND(AVG(rating), 2)AS avg_rating FROM series
JOIN reviews ON series.id = reviews.series_id
GROUP BY title ORDER BY avg_rating ASC;

+----------------------+------------+
| title                | avg_rating |
+----------------------+------------+
| General Hospital     |       5.38 |
| Bob's Burgers        |       7.52 |
| Seinfeld             |       7.60 |
| Bojack Horseman      |       7.94 |
| Arrested Development |       8.08 |
| Archer               |       8.12 |
| Curb Your Enthusiasm |       8.12 |
| Freaks and Geeks     |       8.60 |
| Stranger Things      |       8.77 |
| Breaking Bad         |       9.36 |
| Fargo                |       9.40 |
| Halt and Catch Fire  |       9.90 |
+----------------------+------------+

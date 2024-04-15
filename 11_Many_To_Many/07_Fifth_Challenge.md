# Fifth Challenge

SELECT genre,
ROUND(AVG(rating), 2) AS avg_rating 
FROM series
JOIN reviews ON series.id = reviews.series_id
GROUP BY genre;

+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Animation |       7.86 |
| Comedy    |       8.16 |
| Drama     |       8.04 |
+-----------+------------+

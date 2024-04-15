# Fourth Challenge 

Write a query that returns all the shows that haven't been reviwed yet, and call the column unreviewed

SELECT 
    series.id AS series_id,
    series.title AS unreviewed_series
FROM 
    series
LEFT JOIN 
    reviews ON series.id = reviews.series_id
WHERE 
    reviews.series_id IS NULL;

+-----------+-----------------------+
| series_id | unreviewed_series     |
+-----------+-----------------------+
|        11 | Malcolm In The Middle |
|        12 | Pushing Daisies       |
+-----------+-----------------------+


USING RIGHT JOIN:

SELECT title AS unreviewed_series FROM reviews
RIGHT JOIN series ON series.id = reviews.series_id
WHERE rating IS NULL;

+-----------------------+
| unreviewed_series     |
+-----------------------+
| Malcolm In The Middle |
| Pushing Daisies       |
+-----------------------+
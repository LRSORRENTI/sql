# Sixth Challenge

-- USING CASE 
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS count,
    IFNULL(MIN(rating), 0) AS min,
    IFNULL(MAX(rating), 0) AS max,
    ROUND(IFNULL(AVG(rating), 0), 2) AS average,
    CASE
        WHEN COUNT(rating) >= 10 THEN 'POWERUSER'
        WHEN COUNT(rating) > 0 THEN 'ACTIVE'
        ELSE 'INACTIVE'
    END AS status
FROM
    reviewers
        LEFT JOIN
    reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name , last_name;
 
+------------+-----------+-------+-----+-----+---------+-----------+
| first_name | last_name | count | min | max | average | status    |
+------------+-----------+-------+-----+-----+---------+-----------+
| Thomas     | Stoneman  |     5 | 7.0 | 9.5 |    8.02 | ACTIVE    |
| Wyatt      | Skaggs    |     9 | 5.5 | 9.3 |    7.80 | ACTIVE    |
| Kimbra     | Masters   |     9 | 6.8 | 9.0 |    7.99 | ACTIVE    |
| Domingo    | Cortes    |    10 | 5.8 | 9.1 |    7.83 | POWERUSER |
| Colt       | Steele    |    10 | 4.5 | 9.9 |    8.77 | POWERUSER |
| Pinkie     | Petit     |     4 | 4.3 | 8.8 |    7.25 | ACTIVE    |
| Marlon     | Crafford  |     0 | 0.0 | 0.0 |    0.00 | INACTIVE  |
+------------+-----------+-------+-----+-----+---------+-----------+


-- USING IF 
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS count,
    IFNULL(MIN(rating), 0) AS min,
    IFNULL(MAX(rating), 0) AS max,
    ROUND(IFNULL(AVG(rating), 0), 2) AS average,
    IF(COUNT(rating) > 0,
        'ACTIVE',
        'INACTIVE') AS status
FROM
    reviewers
        LEFT JOIN
    reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name , last_name;

+------------+-----------+-------+-----+-----+---------+----------+
| first_name | last_name | count | min | max | average | status   |
+------------+-----------+-------+-----+-----+---------+----------+
| Thomas     | Stoneman  |     5 | 7.0 | 9.5 |    8.02 | ACTIVE   |
| Wyatt      | Skaggs    |     9 | 5.5 | 9.3 |    7.80 | ACTIVE   |
| Kimbra     | Masters   |     9 | 6.8 | 9.0 |    7.99 | ACTIVE   |
| Domingo    | Cortes    |    10 | 5.8 | 9.1 |    7.83 | ACTIVE   |
| Colt       | Steele    |    10 | 4.5 | 9.9 |    8.77 | ACTIVE   |
| Pinkie     | Petit     |     4 | 4.3 | 8.8 |    7.25 | ACTIVE   |
| Marlon     | Crafford  |     0 | 0.0 | 0.0 |    0.00 | INACTIVE |
+------------+-----------+-------+-----+-----+---------+----------+

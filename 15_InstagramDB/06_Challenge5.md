# Challenge 5 

Write a query to find the average amount of times a user has posted

SELECT 
(SELECT COUNT(*) FROM photos)
/ 
(SELECT COUNT(*) FROM users) AS avg_posts;

+-----------+
| avg_posts |
+-----------+
|    2.5700 |
+-----------+
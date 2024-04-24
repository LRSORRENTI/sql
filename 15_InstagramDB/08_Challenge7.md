# Challenge 7

Write a query that finds users who've liked every photo in the database 

SELECT username, COUNT(*) as num_likes FROM users
INNER JOIN likes
ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);


+--------------------+-----------+
| username           | num_likes |
+--------------------+-----------+
| Aniya_Hackett      |       257 |
| Bethany20          |       257 |
| Duane60            |       257 |
| Jaclyn81           |       257 |
| Janelle.Nikolaus81 |       257 |
| Julien_Schmidt     |       257 |
| Leslie67           |       257 |
| Maxwell.Halvorson  |       257 |
| Mckenna17          |       257 |
| Mike.Auer39        |       257 |
| Nia_Haag           |       257 |
| Ollie_Ledner37     |       257 |
| Rocio33            |       257 |
+--------------------+-----------+

We use the having clause, combined with a SELECT COUNT subquery to identify users who've liked all of the photos
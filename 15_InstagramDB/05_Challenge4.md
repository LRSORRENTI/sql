# Challenge 4

Write a query to find and return the most liked photo in the database, and return the user who posted it

SELECT 
username,
photos.id, 
photos.image_url,
COUNT(*) AS most_likes
FROM photos
    INNER JOIN likes
    ON likes.photo_id = photos.id
    INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY most_likes 
DESC LIMIT 10;

+-----+------------------------+------------+
| id  | image_url              | most_likes |
+-----+------------------------+------------+
| 145 | https://jarret.name    |         48 |
| 182 | https://dorcas.biz     |         43 |
| 127 | https://celestine.name |         43 |
| 123 | http://shannon.org     |         42 |
|  30 | http://kenny.com       |         41 |
| 174 | https://delbert.net    |         41 |
| 192 | https://anahi.info     |         41 |
| 147 | https://adela.com      |         41 |
|  61 | https://dejon.name     |         41 |
|  52 | https://hershel.com    |         41 |
+-----+------------------------+------------+

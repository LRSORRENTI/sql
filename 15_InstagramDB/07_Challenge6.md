# Challenge 6

A brand wants to know the 5 most commonly used hashtags, write a query that returns this

SELECT tags.tag_name,
COUNT(*) as total
FROM photo_tags
JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total DESC 
LIMIT 5;

+----------+-------+
| tag_name | total |
+----------+-------+
| smile    |    59 |
| beach    |    42 |
| party    |    39 |
| fun      |    38 |
| concert  |    24 |
+----------+-------+

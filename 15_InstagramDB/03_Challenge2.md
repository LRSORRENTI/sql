# Challenge 2 

We want to find the average day of the week most users sign up on. What day of the week is our most popular signup day. 


SELECT DAYNAME(created_at) AS day, COUNT(*) AS total FROM users GROUP BY day ORDER BY total DESC LIMIT 1;
+----------+-------+
| day      | total |
+----------+-------+
| Thursday |    16 |
+----------+-------+

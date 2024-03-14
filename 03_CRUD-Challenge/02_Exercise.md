CREATE DATABASE shirts_db;

USE shirts_db;

CREATE TABLE shirts( 
    shirt_id INT AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(40),
    color VARCHAR(40),
    size VARCHAR(15),
    last_worn INT
);
DESC shirts;

+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| shirt_id  | int         | NO   | PRI | NULL    | auto_increment |
| article   | varchar(40) | YES  |     | NULL    |                |
| color     | varchar(40) | YES  |     | NULL    |                |
| size      | varchar(15) | YES  |     | NULL    |                |
| last_worn | int         | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+


INSERT INTO shirts (article, color, size, last_worn) VALUES 
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

DESC shirts;

 SELECT * FROM shirts;
+----------+------------+-------+------+-----------+
| shirt_id | article    | color | size | last_worn |
+----------+------------+-------+------+-----------+
|        1 | t-shirt    | white | S    |        10 |
|        2 | t-shirt    | green | S    |       200 |
|        3 | polo shirt | black | M    |        10 |
|        4 | tank top   | blue  | S    |        50 |
|        5 | t-shirt    | pink  | S    |         0 |
|        6 | polo shirt | red   | M    |         5 |
|        7 | tank top   | white | S    |       200 |
|        8 | tank top   | blue  | M    |        15 |
+----------+------------+-------+------+-----------+

INSERT INTO shirts (article, color, size, last_worn)
VALUES 
('polo', 'purple', 'M', '50');

SELECT * FROM shirts;
+----------+------------+--------+------+-----------+
| shirt_id | article    | color  | size | last_worn |
+----------+------------+--------+------+-----------+
|        1 | t-shirt    | white  | S    |        10 |
|        2 | t-shirt    | green  | S    |       200 |
|        3 | polo shirt | black  | M    |        10 |
|        4 | tank top   | blue   | S    |        50 |
|        5 | t-shirt    | pink   | S    |         0 |
|        6 | polo shirt | red    | M    |         5 |
|        7 | tank top   | white  | S    |       200 |
|        8 | tank top   | blue   | M    |        15 |
|        9 | polo       | purple | M    |        50 |
+----------+------------+--------+------+-----------+

UPDATE shirts SET article='polo shirt' WHERE article='polo';
Query OK, 1 row affected (0.14 sec)
Rows matched: 1  Changed: 1  Warnings: 0

(luke@localhost) [shirts_db]> SELECT * FROM shirts;
+----------+------------+--------+------+-----------+
| shirt_id | article    | color  | size | last_worn |
+----------+------------+--------+------+-----------+
|        1 | t-shirt    | white  | S    |        10 |
|        2 | t-shirt    | green  | S    |       200 |
|        3 | polo shirt | black  | M    |        10 |
|        4 | tank top   | blue   | S    |        50 |
|        5 | t-shirt    | pink   | S    |         0 |
|        6 | polo shirt | red    | M    |         5 |
|        7 | tank top   | white  | S    |       200 |
|        8 | tank top   | blue   | M    |        15 |
|        9 | polo shirt | purple | M    |        50 |
+----------+------------+--------+------+-----------+

SELECT article, color FROM shirts;
+------------+--------+
| article    | color  |
+------------+--------+
| t-shirt    | white  |
| t-shirt    | green  |
| polo shirt | black  |
| tank top   | blue   |
| t-shirt    | pink   |
| polo shirt | red    |
| tank top   | white  |
| tank top   | blue   |
| polo shirt | purple |
+------------+--------+

SELECT article, color, size, last_worn FROM shirts WHERE size='M';
+------------+--------+------+-----------+
| article    | color  | size | last_worn |
+------------+--------+------+-----------+
| polo shirt | black  | M    |        10 |
| polo shirt | red    | M    |         5 |
| tank top   | blue   | M    |        15 |
| polo shirt | purple | M    |        50 |
+------------+--------+------+-----------+

SELECT * FROM shirts WHERE article='polo shirt';
+----------+------------+--------+------+-----------+
| shirt_id | article    | color  | size | last_worn |
+----------+------------+--------+------+-----------+
|        3 | polo shirt | black  | M    |        10 |
|        6 | polo shirt | red    | M    |         5 |
|        9 | polo shirt | purple | M    |        50 |
+----------+------------+--------+------+-----------+
3 rows in set (0.00 sec)

(luke@localhost) [shirts_db]> UPDATE shirts SET size='L' WHERE article='Polo Shirt';
Query OK, 3 rows affected (0.12 sec)
Rows matched: 3  Changed: 3  Warnings: 0

(luke@localhost) [shirts_db]> SELECT * FROM shirts WHERE article='polo shirt';
+----------+------------+--------+------+-----------+
| shirt_id | article    | color  | size | last_worn |
+----------+------------+--------+------+-----------+
|        3 | polo shirt | black  | L    |        10 |
|        6 | polo shirt | red    | L    |         5 |
|        9 | polo shirt | purple | L    |        50 |
+----------+------------+--------+------+-----------+
3 rows in set (0.00 sec)

SELECT * FROM shirts;
+----------+------------+--------+------+-----------+
| shirt_id | article    | color  | size | last_worn |
+----------+------------+--------+------+-----------+
|        1 | t-shirt    | white  | S    |        10 |
|        2 | t-shirt    | green  | S    |       200 |
|        3 | polo shirt | black  | L    |        10 |
|        4 | tank top   | blue   | S    |        50 |
|        5 | t-shirt    | pink   | S    |         0 |
|        6 | polo shirt | red    | L    |         5 |
|        7 | tank top   | white  | S    |       200 |
|        8 | tank top   | blue   | M    |        15 |
|        9 | polo shirt | purple | L    |        50 |
+----------+------------+--------+------+-----------+
9 rows in set (0.00 sec)


UPDATE shirts SET last_worn=0 WHERE last_worn=15;

Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

(luke@localhost) [shirts_db]> SELECT * FROM shirts;
+----------+------------+--------+------+-----------+
| shirt_id | article    | color  | size | last_worn |
+----------+------------+--------+------+-----------+
|        1 | t-shirt    | white  | S    |        10 |
|        2 | t-shirt    | green  | S    |       200 |
|        3 | polo shirt | black  | L    |        10 |
|        4 | tank top   | blue   | S    |        50 |
|        5 | t-shirt    | pink   | S    |         0 |
|        6 | polo shirt | red    | L    |         5 |
|        7 | tank top   | white  | S    |       200 |
|        8 | tank top   | blue   | M    |         0 |
|        9 | polo shirt | purple | L    |        50 |
+----------+------------+--------+------+-----------+
9 rows in set (0.02 sec)

UPDATE shirts SET size='XS', color='off white' WHERE color='white';

(luke@localhost) [shirts_db]> SELECT * FROM shirts;
+----------+------------+-----------+------+-----------+
| shirt_id | article    | color     | size | last_worn |
+----------+------------+-----------+------+-----------+
|        1 | t-shirt    | off white | XS   |        10 |
|        2 | t-shirt    | green     | S    |       200 |
|        3 | polo shirt | black     | L    |        10 |
|        4 | tank top   | blue      | S    |        50 |
|        5 | t-shirt    | pink      | S    |         0 |
|        6 | polo shirt | red       | L    |         5 |
|        7 | tank top   | off white | XS   |       200 |
|        8 | tank top   | blue      | M    |         0 |
|        9 | polo shirt | purple    | L    |        50 |
+----------+------------+-----------+------+-----------+
9 rows in set (0.00 sec)

DELETE FROM shirts WHERE last_worn>=200;

SELECT * FROM shirts;
+----------+------------+-----------+------+-----------+
| shirt_id | article    | color     | size | last_worn |
+----------+------------+-----------+------+-----------+
|        1 | t-shirt    | off white | XS   |        10 |
|        3 | polo shirt | black     | L    |        10 |
|        4 | tank top   | blue      | S    |        50 |
|        5 | t-shirt    | pink      | S    |         0 |
|        6 | polo shirt | red       | L    |         5 |
|        8 | tank top   | blue      | M    |         0 |
|        9 | polo shirt | purple    | L    |        50 |
+----------+------------+-----------+------+-----------+

DELETE FROM shirts WHERE article='tank top';

SELECT * FROM shirts;
+----------+------------+-----------+------+-----------+
| shirt_id | article    | color     | size | last_worn |
+----------+------------+-----------+------+-----------+
|        1 | t-shirt    | off white | XS   |        10 |
|        3 | polo shirt | black     | L    |        10 |
|        5 | t-shirt    | pink      | S    |         0 |
|        6 | polo shirt | red       | L    |         5 |
|        9 | polo shirt | purple    | L    |        50 |
+----------+------------+-----------+------+-----------+


DELETE FROM shirts;
Query OK, 5 rows affected (0.12 sec)

(luke@localhost) [shirts_db]> SELECT * FROM shirts;
Empty set (0.00 sec)

DROP TABLE shirts;
Query OK, 0 rows affected (0.47 sec)

(luke@localhost) [shirts_db]> DESC shirts;
ERROR 1146 (42S02): Table 'shirts_db.shirts' doesn't exist


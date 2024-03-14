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
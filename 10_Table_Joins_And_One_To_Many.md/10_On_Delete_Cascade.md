# On Delete Cascade 

There's an important concept called On Delete Cascade, in our customers and orders tables, we have an id and in orders a foreign key called customer_id which links to the id in the customer table 

DESC customers;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int         | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(50) | YES  |     | NULL    |                |
| last_name  | varchar(50) | YES  |     | NULL    |                |
| email      | varchar(50) | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+


DESC orders;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int          | NO   | PRI | NULL    | auto_increment |
| order_date  | date         | YES  |     | NULL    |                |
| amount      | decimal(8,2) | YES  |     | NULL    |                |
| customer_id | int          | YES  | MUL | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+

Notice the MUL or Multiple Key 
(MUL): Allows duplicates and is often used for foreign keys.

What happens if a customer deletes their account? 

DELETE FROM customers WHERE last_name = 'George';

ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`one_to_many`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`))

We get an error, we could simultaneosly delete all orders from 'George' when he deletes his account 

## ON DELETE CASCADE 

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    post_date DATE,
    post_id INT,
    FORIEGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

With that ON DELETE CASCADE, when a user deletes their account from the users table, all posts will also be deleted where that user id matches

# Foreign Key

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

## The syntax to bridge the connection looks like below, it's kind've a long line but we pass in the customer_id INT, followed by the FOREIGN KEY (customer_id) which should match the customer_id INT, REFERENCES keyword which points to the table customers(id) passing in the id as a value in parentheses to the reference: 

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

Now we have a customer_id, which directly points to the id from the customers table

INSERT INTO customers (first_name, last_name, email)
VALUES  ('Boy', 'George', 'george@gmail.com'),
        ('George', 'Michael', 'gm@gmail.com'),
        ('David', 'Bowie', 'david@gmail.com'),
        ('Blue', 'Steele', 'blue@gmail.com'),
        ('Bette', 'Davis', 'bette@gmail.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES  ('2016-02-10', 99.99, 1),
        ('2017-11-11', 35.50, 1),
        ('2014-12-12', 800.67, 2),
        ('2015-01-03', 12.50, 2),
        ('1999-01-03', 458.25, 5);

### If we try to insert an order with a foreign key that doesn't exist:

NSERT INTO orders (order_date, amount, customer_id)
VALUES ('2022-11-11', 79.99, 54);

ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`one_to_many`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`))

The customer_id of 54 doesn't exist so the insert fails.
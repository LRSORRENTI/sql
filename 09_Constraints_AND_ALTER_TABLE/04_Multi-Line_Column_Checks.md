# Multi-Line Column Checks 

Let's say we have two values that have an identical constraint, maybe for a users table the address, and phone number must always be unique, instead of writing two separate constraints, which would work but it's nicer to group together constraints if they are identical 

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name, address)
);

INSERT INTO companies (name, address) 
VALUES (
    'Mikes Autoshop',
    '123 Spruce St'
);

INSERT INTO companies (name, address) 
VALUES (
    'Raymond Tires',
    '123 Spruce St'
);

Above works fine, we have two companies that share a building, they have the same address, works fine, but if we insert the same business name at the same location, we'll get an error 

INSERT INTO companies (name, address) 
    -> VALUES (
    ->     'Raymond Tires',
    ->     '123 Spruce St'
    -> );


ERROR 1062 (23000): Duplicate entry 'Raymond Tires-123 Spruce St' for key 'companies.name_address'

Let's look at another example:

CREATE TABLE houses (
    purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    CONSTRAINT sale_price_must_exceed_purchase_price CHECK (sale_price > purchase_price)
);

INSERT INTO houses (purchase_price, sale_price) 
VALUES (
    100000,
    200000
);
Query OK, 1 row affected (0.11 sec)

INSERT INTO houses (purchase_price, sale_price) 
VALUES (
    200000,
    150000
);

ERROR 3819 (HY000): Check constraint 'sale_price_must_exceed_purchase_price' is violated.

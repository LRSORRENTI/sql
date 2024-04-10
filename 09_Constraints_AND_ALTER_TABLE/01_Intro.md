# Constraints and ALTER TABLE 

There are many more constraints, or more specific types for our table data, things like NOT NULL, which we've gone over already, that is a type of constraint 

## UNIQUE 

The first new constraint we'll cover is UNIQUE, which is used on table creation just like NOT NULL:

CREATE TABLE companies (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id)
);

In the above example, any phone number we try to insert must be unique 

CREATE TABLE contacts (
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO contacts (name, phone) 
VALUES (
    'John smith', '5559995555'
);

SELECT * FROM contacts;
+------------+------------+
| name       | phone      |
+------------+------------+
| John smith | 5559995555 |
+------------+------------+

So we have a unique phone number in our contacts table, if we try to insert the same exact phone number notice the error: 

INSERT INTO contacts (name, phone) 
    -> VALUES (
    ->     'Jane smith', '5559995555'
    -> );

ERROR 1062 (23000): Duplicate entry '5559995555' for key 'contacts.phone'

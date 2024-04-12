# One To Many 

Up first is one to many, a classic example is Customers and Orders

Two tables customer table, and order table, and this is a one to many relationship, a given customer can have many different orders, but all of those many orders are only connected to one customer, one to many.

What would be stored in this example? 

CUSTOMER
- Customer first and last name
- Customer email
ORDER
- Date of purchase 
- Price of the order 

In a real db we'd want more data, but we'll keep it concise.

It's technically possible to store orders and customer info in a single table, but this approach tends towards many duplicated data sets

## How One To Many Works 

How this works is we have two separate tables, Customers and Orders:

Customers
- id
- first_name
- last_name
- email 

Orders
- order_id 
- order_date
- amount 
- customer_id 

And it's the customer_id that links these tables together, it's a reference to the Customers table from the Orders table, so every order will have a unique id, but also a unique customer_id that points to which customer placed that order

It's those unique id's that structure the connections without worry about incorrect references, in these situations where PRIMARY KEY AUTO-INCREMENT helps ensure each key for id and order_id remains unique 

### How to make the connection:

We use FOREIGN KEYS to bridge that connection, in our ORDERS table, the customer_id points to the id from the customers table that made the order, but it's a foreign key within that table
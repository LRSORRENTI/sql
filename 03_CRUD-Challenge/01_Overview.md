# CRUD Challenge Overview

We're going to create a spring cleaning database

1. Create a new database called shirts_db

2. Create a new table called shirts

3. The shirts table needs to have the following columns:
- Primary key auto-increment column called shirt_id
- article is the type of shirt ie polo, button etc and should be text
- color which is also text
- shirt size ie S, M, XL ...
- last_worn which is an integer, 5, 10 days 

Then once the table is created insert all of this in one go:
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15)
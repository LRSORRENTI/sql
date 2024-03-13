# CRUD (Create, Read, Update, Delete)

Oftentimes in real world scenarios, user's will want to edit things like choosing a new password, or editing a post they made, or updating email address, or even delete their account. This is all falls under the umbrella term CRUD. We've already seen some of the setup so far, creating tables, and inserting data, selecting data.

## CREATE: 

```
-- Create the new cats table:

CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 
-- Insert some cats:

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
        
```

## READ:

We've only used one kind of select statement thus far, SELECT * FROM tablename; It's one way to check the data after insertion. That comes from the '*' which is a wildcard for 'give me everything from the specified table'

### But we can easily select individual columns from a table, like
```
SELECT name FROM cats;
```

+----------------+
| name           |
+----------------+
| Ringo          |
| Cindy          |
| Dumbledore     |
| Egg            |
| Misty          |
| George Michael |
| Jackson        |
+----------------+
7 rows in set (0.00 sec)

## Or you can also specify which columns using comma separators:

SELECT name, age FROM cats;
+----------------+------+
| name           | age  |
+----------------+------+
| Ringo          |    4 |
| Cindy          |   10 |
| Dumbledore     |   11 |
| Egg            |    4 |
| Misty          |   13 |
| George Michael |    9 |
| Jackson        |    7 |
+----------------+------+
7 rows in set (0.00 sec)

SELECT cat_id, name, age FROM cats;
+--------+----------------+------+
| cat_id | name           | age  |
+--------+----------------+------+
|      1 | Ringo          |    4 |
|      2 | Cindy          |   10 |
|      3 | Dumbledore     |   11 |
|      4 | Egg            |    4 |
|      5 | Misty          |   13 |
|      6 | George Michael |    9 |
|      7 | Jackson        |    7 |
+--------+----------------+------+


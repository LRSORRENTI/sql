# Custom Contrant Names

We can specify a name for the constraint for better readability, which is a better practice in general, use as concise, and descriptive names as possible

CREATE TABLE club_entry (
    name VARCHAR(50),
    age INT,
    CONSTRAINT age_over_18 CHECK (age >= 18)
);

INSERT INTO club_entry (name, age) 
VALUES (
    'Trista',
    19
);
Query OK, 1 row affected (0.10 sec)

INSERT INTO club_entry (name, age) 
VALUES (
    'Stef',
    17
);

ERROR 3819 (HY000): Check constraint 'age_over_18' is violated.
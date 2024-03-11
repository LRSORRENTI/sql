# Inserting data

1. Select proper table 

2. Check names of columns for insert query ie, name, age etc

3. INSERT INTO cats (name, age) VALUES ('Oreo', 14);

4. Should say query complete, then check work with SELECT * FROM cats to double check the newly inserted data is inside.

## INSERTING MULTIPLE TIMES IN A SINGLE QUERY:

To insert multiple into a table use commas to separate them in capsules:

```
INSERT INTO cats (name, age)
VALUES ('Charlie', 10),
       ('Sadie', 3),
       ('Judd', '14');
```

```
-- Single insert (switching order of name and age)

INSERT INTO cats (age, name) 
VALUES 
  (2, 'Beth');


-- Multiple Insert:

INSERT INTO cats (name, age) 
VALUES 
  ('Meatball', 5), 
  ('Turkey', 1), 
  ('Potato Face', 15);

```

```
CREATE TABLE people
  (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
  );


INSERT INTO people(first_name, last_name, age)
VALUES ('Tina', 'Belcher', 13);


INSERT INTO people(age, last_name, first_name)
VALUES (42, 'Belcher', 'Bob');


INSERT INTO people(first_name, last_name, age)
VALUES
    ('Linda', 'Belcher', 45),
    ('Phillip', 'Frond', 38),
    ('Calvin', 'Fischoeder', 70);
   

DROP TABLE people;


```
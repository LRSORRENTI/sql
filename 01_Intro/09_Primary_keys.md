# Primary Keys 

In SQL, using primary keys to identify data is widely used. This way if you have identical data, like a cat database with two identically named, and breed / age cats, you can differentiate between them using a primary key setup

So a primary key is a unique identifier, which we denote on creation of the table:

```
CREATE TABLE unique_cats ( 
    cat_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    age INT
)
```

-- One way of specifying a PRIMARY KEY

```
CREATE TABLE unique_cats (
	cat_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);
```

-- Another option:


```
CREATE TABLE unique_cats2 (
	cat_id INT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);
```

AUTO INCREMENT: 

```
--  AUTO_INCREMENT
CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);
```
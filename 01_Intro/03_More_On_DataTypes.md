# More on datatypes 

Let's start with a few of the more common data types we'll use often:

1. INT - INT is a whole number with a max value of 2147483647 or negative -2147483647, some valid INT types are 12, 0, -9999, 1002345, -242345

2. VARCHAR (variable length string of characters), some example are 'coffee!', 'aasdsfsfr', you can also store numbers if you wrap them in quotes: -2345' And with VARCHAR, we can specify a max number of characters, like for a username, we can set the username to the VARCHAR type but max it out at 30 chars or however many chars we need

```
Headers:
username(VARCHAR(15)) | tweet(VARCHAR(140)) | numFavorites(INT)
----------------------|---------------------|------------------
user1234                'I enjoy posting!'      12
```
```

CREATE TABLE cats ( name VARCHAR(50), age INT);
CREATE TABLE dogs ( name VARHCAR(30), breed VARCHAR(40), age INT) 
(luke@localhost) [petshop]> show columns from dogs;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(30) | YES  |     | NULL    |       |
| breed | varchar(40) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
```
```
(luke@localhost) [petshop]> show columns from cats
    -> ;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(50) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)
```

There's a shorter way to display tables using the DESC or describe command:

```
(luke@localhost) [petshop]> desc dogs
    -> ;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(30) | YES  |     | NULL    |       |
| breed | varchar(40) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

(luke@localhost) [petshop]> desc cats;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(50) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

```

# ALTER TABLE 

Often times it's needed to change the types, names, or add columns to a table. ALTER TABLE is a command we can use to assist with these kinds of table changes.

ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);

DESC companies;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| name    | varchar(255) | NO   | PRI | NULL    |       |
| address | varchar(255) | NO   | PRI | NULL    |       |
| phone   | varchar(15)  | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+

ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL;

DESC companies;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| name           | varchar(255) | NO   | PRI | NULL    |       |
| address        | varchar(255) | NO   | PRI | NULL    |       |
| phone          | varchar(15)  | YES  |     | NULL    |       |
| employee_count | int          | NO   |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+

## DROP COLUMN

We can chain onto the ALTER TABLE statement, the DROP COLUMN statement

ALTER TABLE companies
DROP COLUMN employee_count;
Query OK, 0 rows affected (0.48 sec)

DESC companies;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| name    | varchar(255) | NO   | PRI | NULL    |       |
| address | varchar(255) | NO   | PRI | NULL    |       |
| phone   | varchar(15)  | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+


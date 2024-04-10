# Rename And Modify Columns 

DESC companies;

+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| name    | varchar(255) | NO   | PRI | NULL    |       |
| address | varchar(255) | NO   | PRI | NULL    |       |
| phone   | varchar(15)  | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+ 

ALTER TABLE companies 
RENAME COLUMN name TO biz_name;

DESC companies;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| biz_name | varchar(255) | NO   | PRI | NULL    |       |
| address  | varchar(255) | NO   | PRI | NULL    |       |
| phone    | varchar(15)  | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+

## To modify the type of a column, like change biz_name to VARCHAR(100)

ALTER TABLE companies 
MODIFY biz_name VARCHAR(100);

DESC companies;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| biz_name | varchar(100) | YES  | MUL | NULL    |       |
| address  | varchar(255) | NO   |     | NULL    |       |
| phone    | varchar(15)  | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+

## NOTE using this command requires caution, if you had a business name that's greater than 100 chars now, it gets cut off, this is known as Data Truncation, or if you change it from VARCHAR to INT or a different data type, be conscious and aware of the change being made, 

## Type Conversion: Similarly, changing the data type of a column (e.g., from VARCHAR to INT) can result in data loss or errors if the existing data cannot be converted to the new type

### Can also chain on default values: 

ALTER TABLE companies MODIFY biz_name VARCHAR(110) DEFAULT 'uknown';

DESC companies;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| biz_name | varchar(110) | YES  | MUL | uknown  |       |
| address  | varchar(255) | NO   |     | NULL    |       |
| phone    | varchar(15)  | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+

### Changing columns, and data types together using CHANGE 

ALTER TABLE companies CHANGE biz_name business_name VARCHAR(80);

+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| business_name | varchar(80)  | YES  | MUL | NULL    |       |
| address       | varchar(255) | NO   |     | NULL    |       |
| phone         | varchar(15)  | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+

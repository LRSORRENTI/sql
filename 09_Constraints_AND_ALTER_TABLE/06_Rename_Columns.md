# Rename Columns 

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


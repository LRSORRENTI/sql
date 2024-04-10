# ALTER TABLE Constraints

 DESC houses;
+----------------+------+------+-----+---------+-------+
| Field          | Type | Null | Key | Default | Extra |
+----------------+------+------+-----+---------+-------+
| purchase_price | int  | NO   |     | NULL    |       |
| sale_price     | int  | NO   |     | NULL    |       |
+----------------+------+------+-----+---------+-------+


ALTER TABLE houses ADD CONSTRAINT postive_pprice CHECK(purchase_price >= 0);

INSERT INTO houses (purchase_price, sale_price) VALUES (-10, 10000);

ERROR 3819 (HY000): Check constraint 'positive_pprice' is violated.

## You can drop constraints by passing the constraint name after the CONSTRAINT keyword:

ALTER TABLE houses DROP CONSTRAINT positive_pprice; 
Query OK, 0 rows affected (0.19 sec)

Now we could insert a negative value into the purchase_price if we wanted

INSERT INTO houses (purchase_price, sale_price) VALUES (-10, 10000);
Query OK, 1 row affected (0.11 sec)
# End of section exercise

1. What is a good use case for CHAR 

A good use case for CHAR would be for name abbreviations, or historical contexts, char takes up less memory so if we know we only need first and last initials, using CHAR(2) makes sense

2. Fill in the blanks below, what types would be most appropriate given the following fields? Assume price is always below 1 million, and will only have two decimals, and quantity can only ever be a whole number

CREATE TABLE inventory (
    item_name ____________,
    price ________________,
    quantity _____________
);

CREATE TABLE inventory (
    item_name VARCHAR(60),
    price DECIMAL(6,2),
    quantity INT
);


3. Explain the difference between DATETIME, and TIMESTAMP

DATETIME and TIMESTAMP are similar, but TIMESTAMP uses less memory than DATETIME, use DATETIME for very old dates, DATETIME does not store timezone info


4. Print out the current time

SELECT CURTIME();
+-----------+
| CURTIME() |
+-----------+
| 07:30:50  |
+-----------+


5. Print out the current date, but not the time

SELECT CURDATE();
+------------+
| CURDATE()  |
+------------+
| 2024-04-03 |
+------------+


6. Print out the current day of the week as a number, and return the day name, mon or tues etc.

SELECT WEEKDAY(CURDATE() + 1), DAYNAME(CURDATE()); 
+--------------------+--------------------+
| WEEKDAY(CURDATE()) | DAYNAME(CURDATE()) |
+--------------------+--------------------+
|                  2 | Wednesday          |
+--------------------+--------------------+



7. Print out the current date and time, and format it so it looks like mm/dd/yyyy

SELECT CONCAT(MONTH(CURDATE()), '/', DAYOFMONTH(CURDATE()), '/', YEAR(CURDATE())) AS curDate;
+----------+
| curDate  |
+----------+
| 4/3/2024 |
+----------+

SELECT CONCAT(LPAD(MONTH(CURDATE()), 2, '0'), '/', LPAD(DAYOFMONTH(CURDATE()), 2, '0'), '/', YEAR(CURDATE())) AS curDate;
+------------+
| curDate    |
+------------+
| 04/03/2024 |
+------------+


8. Print out the current date and time in this format: January 1st at 3:00

SELECT CONCAT(MONTHNAME(CURDATE()), ' ',  DATE_FORMAT(CURDATE(), ' ', '%D'), 'at 3:00' );


ELECT CONCAT(TIME_FORMAT(CURTIME(), '%k'),':' , TIME_FORMAT(CURTIME(), '%i'));
+-------------------------------------------------------------------------+
| CONCAT(TIME_FORMAT(CURTIME(), '%k'),':' , TIME_FORMAT(CURTIME(), '%i')) |
+-------------------------------------------------------------------------+
| 8:05                                                                    |
+-------------------------------------------------------------------------+
1 row in set (0.00 sec)

SELECT TIME_FORMAT(CURTIME(), '%k:%i');
+---------------------------------+
| TIME_FORMAT(CURTIME(), '%k:%i') |
+---------------------------------+
| 8:05                            |
+---------------------------------+
SELECT CONCAT(MONTHNAME(CURDATE()), ' ', DATE_FORMAT(CURDATE(), '%D'), ' at ', TIME_FORMAT(CURTIME(), '%k:%i')) AS time;
+-------------------+
| time              |
+-------------------+
| April 3rd at 8:09 |
+-------------------+



9. Create a tweets table that stores tweet/message text content, username, and time that post was created
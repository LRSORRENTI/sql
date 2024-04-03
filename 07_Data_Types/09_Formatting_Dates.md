# Formatting Dates 


SELECT CONCAT(name, ' ', MONTHNAME(birthdate), ' ', DAY(birthdate), ' ',  YEAR(birthdate)) AS birthdays FROM people;
+------------------------+
| birthdays              |
+------------------------+
| Elton December 25 2000 |
| Lulu April 11 1985     |
| Juan August 15 2020    |
| Dalton April 2 2024    |
| Tristan August 16 1993 |
+------------------------+

There's a way to concat the values together, like above but also a built in function called DATE_FORMAT

DATE_FORMAT specifically has these 'specifiers' that look like: '%a', '%b', '%c' and many others than have different functionality  

SELECT birthdate, DATE_FORMAT(birthdate, '%b') FROM people;
+------------+------------------------------+
| birthdate  | DATE_FORMAT(birthdate, '%b') |
+------------+------------------------------+
| 2000-12-25 | Dec                          |
| 1985-04-11 | Apr                          |
| 2020-08-15 | Aug                          |
| 2024-04-02 | Apr                          |
| 1993-08-16 | Aug                          |
+------------+------------------------------+

## ALSO NOTE YOU CAN CHAIN THESE MODIFIERS TOGETHER:

SELECT birthdate, DATE_FORMAT(birthdate, '%a, %b %d %Y') FROM people;
+------------+----------------------------------------+
| birthdate  | DATE_FORMAT(birthdate, '%a, %b %d %Y') |
+------------+----------------------------------------+
| 2000-12-25 | Mon, Dec 25 2000                       |
| 1985-04-11 | Thu, Apr 11 1985                       |
| 2020-08-15 | Sat, Aug 15 2020                       |
| 2024-04-02 | Tue, Apr 02 2024                       |
| 1993-08-16 | Mon, Aug 16 1993                       |
+------------+----------------------------------------+

SELECT birthdate, DATE_FORMAT(birthdate, '%a, %b %D %Y') FROM people;
+------------+----------------------------------------+
| birthdate  | DATE_FORMAT(birthdate, '%a, %b %D %Y') |
+------------+----------------------------------------+
| 2000-12-25 | Mon, Dec 25th 2000                     |
| 1985-04-11 | Thu, Apr 11th 1985                     |
| 2020-08-15 | Sat, Aug 15th 2020                     |
| 2024-04-02 | Tue, Apr 2nd 2024                      |
| 1993-08-16 | Mon, Aug 16th 1993                     |
+------------+----------------------------------------+

SELECT birthdate, DATE_FORMAT(birthdate, '%a, %b %D %Y'), DATE_FORMAT(birthdt, '%H:%i') FROM people;
+------------+----------------------------------------+-------------------------------+
| birthdate  | DATE_FORMAT(birthdate, '%a, %b %D %Y') | DATE_FORMAT(birthdt, '%H:%i') |
+------------+----------------------------------------+-------------------------------+
| 2000-12-25 | Mon, Dec 25th 2000                     | 21:01                         |
| 1985-04-11 | Thu, Apr 11th 1985                     | 09:45                         |
| 2020-08-15 | Sat, Aug 15th 2020                     | 23:59                         |
| 2024-04-02 | Tue, Apr 2nd 2024                      | 08:24                         |
| 1993-08-16 | Mon, Aug 16th 1993                     | 21:01                         |
+------------+----------------------------------------+-------------------------------+


SELECT birthdate, DATE_FORMAT(birthdate, '%a, %b %D %Y'), DATE_FORMAT(birthdt, '%r') FROM people;

+------------+----------------------------------------+----------------------------+
| birthdate  | DATE_FORMAT(birthdate, '%a, %b %D %Y') | DATE_FORMAT(birthdt, '%r') |
+------------+----------------------------------------+----------------------------+
| 2000-12-25 | Mon, Dec 25th 2000                     | 09:01:22 PM                |
| 1985-04-11 | Thu, Apr 11th 1985                     | 09:45:10 AM                |
| 2020-08-15 | Sat, Aug 15th 2020                     | 11:59:00 PM                |
| 2024-04-02 | Tue, Apr 2nd 2024                      | 08:24:28 AM                |
| 1993-08-16 | Mon, Aug 16th 1993                     | 09:01:22 PM                |
+------------+----------------------------------------+----------------------------+

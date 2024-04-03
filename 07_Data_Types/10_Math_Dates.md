# Date Math

There are functions for performing math calculations and dates. Things like DATEDIFF, DATE_ADD, DATE_SUB

SELECT birthdate FROM people;
+------------+
| birthdate  |
+------------+
| 2000-12-25 |
| 1985-04-11 |
| 2020-08-15 |
| 2024-04-02 |
| 1993-08-16 |
+------------+


SELECT CURDATE(), birthdate, DATEDIFF(CURDATE(), birthdate) AS date_diff FROM people;
+------------+------------+-----------+
| CURDATE()  | birthdate  | date_diff |
+------------+------------+-----------+
| 2024-04-03 | 2000-12-25 |      8500 |
| 2024-04-03 | 1985-04-11 |     14237 |
| 2024-04-03 | 2020-08-15 |      1327 |
| 2024-04-03 | 2024-04-02 |         1 |
| 2024-04-03 | 1993-08-16 |     11188 |
+------------+------------+-----------+

SELECT DATE_ADD(CURDATE(), INTERVAL 1 YEAR);
+--------------------------------------+
| DATE_ADD(CURDATE(), INTERVAL 1 YEAR) |
+--------------------------------------+
| 2025-04-03                           |
+--------------------------------------+

SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH);
+---------------------------------------+
| DATE_ADD(CURDATE(), INTERVAL 1 MONTH) |
+---------------------------------------+
| 2024-05-03                            |
+---------------------------------------+

SELECT DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
+--------------------------------------+
| DATE_SUB(CURDATE(), INTERVAL 1 YEAR) |
+--------------------------------------+
| 2023-04-03                           |
+--------------------------------------+

SELECT birthdate, DATE_FORMAT(DATE_ADD(birthdate, INTERVAL 18 YEAR), '%a, %b %D %Y') AS VotingAge FROM people; 
+------------+--------------------+
| birthdate  | VotingAge          |
+------------+--------------------+
| 2000-12-25 | Tue, Dec 25th 2018 |
| 1985-04-11 | Fri, Apr 11th 2003 |
| 2020-08-15 | Sun, Aug 15th 2038 |
| 2024-04-02 | Wed, Apr 2nd 2042  |
| 1993-08-16 | Tue, Aug 16th 2011 |
+------------+--------------------+

## TIMES 

To perform math on times, it's the same function names but Time instead ADD_TIME, TIMEDIFF, SUB_TIME

SELECT TIMEDIFF(CURTIME(), '04:30:00') AS timeSinceWaking;
+-----------------+
| timeSinceWaking |
+-----------------+
| 01:53:27        |
+-----------------+

SELECT NOW() - INTERVAL 18 YEAR;
+--------------------------+
| NOW() - INTERVAL 18 YEAR |
+--------------------------+
| 2006-04-03 06:25:18      |
+--------------------------+


SELECT name, birthdate, birthdate + INTERVAL 21 YEAR AS drinkingAge FROM people;
+---------+------------+-------------+
| name    | birthdate  | drinkingAge |
+---------+------------+-------------+
| Elton   | 2000-12-25 | 2021-12-25  |
| Lulu    | 1985-04-11 | 2006-04-11  |
| Juan    | 2020-08-15 | 2041-08-15  |
| Dalton  | 2024-04-02 | 2045-04-02  |
| Tristan | 1993-08-16 | 2014-08-16  |
+---------+------------+-------------+


SELECT name, birthdate, YEAR(birthdate + INTERVAL 21 YEAR) AS drinkingAge FROM people;
+---------+------------+-------------+
| name    | birthdate  | drinkingAge |
+---------+------------+-------------+
| Elton   | 2000-12-25 |        2021 |
| Lulu    | 1985-04-11 |        2006 |
| Juan    | 2020-08-15 |        2041 |
| Dalton  | 2024-04-02 |        2045 |
| Tristan | 1993-08-16 |        2014 |
+---------+------------+-------------+

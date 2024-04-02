# Date Functions 

There are additional functions to return more precise information about the date and time

SELECT birthdate, DAY(birthdate) FROM people;

SELECT birthdate, DAY(birthdate) FROM people;
+------------+----------------+
| birthdate  | DAY(birthdate) |
+------------+----------------+
| 2000-12-25 |             25 |
| 1985-04-11 |             11 |
| 2020-08-15 |             15 |
| 2024-04-02 |              2 |
+------------+----------------+


SELECT birthdate, DAY(birthdate), DAYOFWEEK(birthdate) FROM people;
+------------+----------------+----------------------+
| birthdate  | DAY(birthdate) | DAYOFWEEK(birthdate) |
+------------+----------------+----------------------+
| 2000-12-25 |             25 |                    2 |
| 1985-04-11 |             11 |                    5 |
| 2020-08-15 |             15 |                    7 |
| 2024-04-02 |              2 |                    3 |
+------------+----------------+----------------------+

SELECT birthdate, DAYNAME(birthdate), MONTHNAME(birthdate) FROM people;
+------------+--------------------+----------------------+
| birthdate  | DAYNAME(birthdate) | MONTHNAME(birthdate) |
+------------+--------------------+----------------------+
| 2000-12-25 | Monday             | December             |
| 1985-04-11 | Thursday           | April                |
| 2020-08-15 | Saturday           | August               |
| 2024-04-02 | Tuesday            | April                |
+------------+--------------------+----------------------+


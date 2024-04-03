# TIME functions

We can also get the hours, minutes, and seconds

SELECT name, birthtime,  SECOND(birthtime) FROM people;

+---------+-----------+-------------------+
| name    | birthtime | SECOND(birthtime) |
+---------+-----------+-------------------+
| Elton   | 21:01:22  |                22 |
| Lulu    | 09:45:10  |                10 |
| Juan    | 23:59:00  |                 0 |
| Dalton  | 08:24:28  |                28 |
| Tristan | 21:01:22  |                22 |
+---------+-----------+-------------------+

SELECT HOUR(birthdt), MINUTE(birthdt), SECOND(birthdt) FROM people;
+---------------+-----------------+-----------------+
| HOUR(birthdt) | MINUTE(birthdt) | SECOND(birthdt) |
+---------------+-----------------+-----------------+
|            21 |               1 |              22 |
|             9 |              45 |              10 |
|            23 |              59 |               0 |
|             8 |              24 |              28 |
|            21 |               1 |              22 |
+---------------+-----------------+-----------------+

SELECT birthdt, DATE(birthdt), TIME(birthdt) FROM people;
+---------------------+---------------+---------------+
| birthdt             | DATE(birthdt) | TIME(birthdt) |
+---------------------+---------------+---------------+
| 2000-12-25 21:01:22 | 2000-12-25    | 21:01:22      |
| 1985-04-11 09:45:10 | 1985-04-11    | 09:45:10      |
| 2020-08-15 23:59:00 | 2020-08-15    | 23:59:00      |
| 2024-04-02 08:24:28 | 2024-04-02    | 08:24:28      |
| 1993-08-16 21:01:22 | 1993-08-16    | 21:01:22      |
+---------------------+---------------+---------------+
# Dates and Times 

A critically important data type, these are used heavily in many different types of applications to track numerous different things like comments, posts, expirations etc.. 

## DATE 

The first is DATE, which is just the date, no time attached

'YYYY-MM-DD' format, 2024-04-01 which is April 1st 2024

## TIME 

The time data type is just the time, no date attached, and time is stored in:

'HH-MM-SS' format

But note it's not limited to 24 hours, if we're measuring something in a lab environment or anything really, maybe we need to store the length taken, 888 hours is the max for this format

## DATETIME

As the name suggests DATETIME is both of the above together in a single field: 

'YYYY-MM-DD HH:MM:SS' format

INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Elton', '2000-12-25', '21:01:22', '2000-12-25 21:01:22');

INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');

INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

SELECT * FROM people;
+-------+------------+-----------+---------------------+
| name  | birthdate  | birthtime | birthdt             |
+-------+------------+-----------+---------------------+
| Elton | 2000-12-25 | 21:01:22  | 2000-12-25 21:01:22 |
| Lulu  | 1985-04-11 | 09:45:10  | 1985-04-11 09:45:10 |
| Juan  | 2020-08-15 | 23:59:00  | 2020-08-15 23:59:00 |
+-------+------------+-----------+---------------------+

Note that when we inserted lulu, we did '9:45:10' and sql auto padded the zero for us 
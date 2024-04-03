# TIMESTAMPS 

Timestamps look very similar to DATETIME, but the main difference is that a TIMESTAMP consumes less memory, less storage space

TIMESTAMPS have a starting year of 1970, while DATETIME begins all the way back at the year 1000

When we create a table, 

CREATE TABLE captions (
    text VARCHAR(150),
    created_at TIMESTAMP default CURRENT_TIMESTAMP
);

INSERT INTO captions(text) VALUES ('time to exercise');

SELECT * FROM captions;
+------------------+---------------------+
| text             | created_at          |
+------------------+---------------------+
| out for a walk   | 2024-04-03 06:52:41 |
| time to exercise | 2024-04-03 06:53:00 |
+------------------+---------------------+

CREATE TABLE captionsLog (
    text VARCHAR(150),
    created_at TIMESTAMP default CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Above we pass in the ON UPDATE clause, which will update whenever a row changes inside that table

INSERT INTO captionsLog (text) VALUES ('breakfast time');

SELECT * FROM captionsLog;
+----------------+---------------------+------------+
| text           | created_at          | updated_at |
+----------------+---------------------+------------+
| breakfast time | 2024-04-03 06:59:00 | NULL       |
+----------------+---------------------+------------+

Now the user updates or edits the text comment, notice that updated_at will change from null to the timestamp

UPDATE captionsLog SET text='finished breakfast' WHERE text='breakfast time';

SELECT * FROM captionsLog;
+--------------------+---------------------+---------------------+
| text               | created_at          | updated_at          |
+--------------------+---------------------+---------------------+
| finished breakfast | 2024-04-03 06:59:00 | 2024-04-03 07:01:39 |
+--------------------+---------------------+---------------------+

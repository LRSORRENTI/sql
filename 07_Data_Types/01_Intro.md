# Revisiting Data Types 

So far we've mostly dealt with VARCHAR and INT, but it's important to expand on proper data typing.

Things like decimals, dates, times. 

We'll start with CHAR. How does CHAR differ from VARCHAR.

CREATE TABLE friends (name VARCHAR(10));

INSERT INTO FRIENDS (name) VALUES ('tom'), ('juan pablo'), ('james');

A good example of using CHAR is for state abbreviations like: 'WI', 'AL', 'MN'

Chars have a fixed length, 

CREATE TABLE states(stateAbrv CHAR(2));

INSERT INTO states (stateAbrv) VALUES ('WI'), ('FL');

SELECT * FROM states;
+-----------+
| stateAbrv |
+-----------+
| WI        |
| FL        |
+-----------+

## The reason using precise data types is valuable has to do with memory, behind the scenes if we can narrow down the data type, like the states example above, it will help consume less memory

## The main takeaway is that if you know the exact size a value should be, use CHAR() but if you need the length to be variable in size, use VARCHAR. 

## An example
 
If we have a Char(4) and store an empty string '', it uses 4 bytes of memory, since denoting CHAR(4) even if no value is passed in, will pad it with whitespace taking 4 bytes of memory

But if we use VARCHAR(4) and pass in an empty string, '', this only takes up 1 byte of memory, since there is no padding done with VARCHAR

But inversely, if we have a VARCHAR(4) it will take up 5 bytes, but a CHAR(4) only takes up 4 bytes of memory

So when using data types, really think about how the data will look, and how to best store that data, since optimizing data types will save memory long term, if you know for certain a string will always be 3 or however many chars long, use CHAR(3) or CHAR(however many chars) to save memory

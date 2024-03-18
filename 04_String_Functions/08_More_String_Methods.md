# More string methods 

The first we'll go over is string INSERT, we can use this method to replace characters from a string with new characters, for the example below, let's try to insert the 
word 'there' inbetween hello and bobby

When inserting we need to use four arguments, the first is the string itself, the second is the index of where to begin inserting, in the below example the index 6 is the space between hello and bobby

The third argument is how many characters we want to replace, since we're not replacing the space, just adding on, we pass in 0, then the fourth argument is the actual new string of chars we want to insert

```
SELECT INSERT('Hello bobby', 6, 0, ' there');
+---------------------------------------+
| INSERT('Hello bobby', 6, 0, ' there') |
+---------------------------------------+
| Hello there bobby                     |
+---------------------------------------+

```

Notice the third argument 0, if we're inserting between strings, that's important, for example below we pass in 5 which actually replaces the next 5 characters:

SELECT INSERT('Hello bobby', 6, 5, ' there');
+---------------------------------------+
| INSERT('Hello bobby', 6, 5, ' there') |
+---------------------------------------+
| Hello therey                          |
+---------------------------------------+

## LEFT and RIGHT 

LEFT is a method to return the left most chars, RIGHT is a method which returns the rightmost chars 

SELECT LEFT('abcdefghijklmnop', 4);

+-----------------------------+
| LEFT('abcdefghijklmnop', 4) |
+-----------------------------+
| abcd                        |
+-----------------------------+
1 row in set (0.00 sec)

SELECT RIGHT('tuvwxyz', 4);
+---------------------+
| RIGHT('tuvwxyz', 4) |
+---------------------+
| wxyz                |
+---------------------+
1 row in set (0.00 sec)

In our books example, we can grab the author initials:

 SELECT CONCAT(LEFT(author_fname, 1), LEFT(author_lname, 1)) AS author_intials FROM books;
+----------------+
| author_intials |
+----------------+
| JL             |
| NG             |
| NG             |
| JL             |
| DE             |
| DE             |
| MC             |
| PS             |
| DE             |
| NG             |
| RC             |
| RC             |
| DD             |
| JS             |
| DF             |
| DF             |
+----------------+

There's also REPEAT, which as the name suggests repeats a string a specified number of times

SELECT REPEAT('HA', 4);
+-----------------+
| REPEAT('HA', 4) |
+-----------------+
| HAHAHAHA        |
+-----------------+
1 row in set (0.02 sec)


## TRIM 

TRIM is a method usually used to remove trailing, and leading whitespaces

SELECT TRIM('    boston   ');

+-----------------------+
| TRIM('    boston   ') |
+-----------------------+
| boston                |
+-----------------------+

But as a note, it won't remove any spaces in the middle of the string:

SELECT TRIM('    new york   ');
+-------------------------+
| TRIM('    new york   ') |
+-------------------------+
| new york                |
+-------------------------+
1 row in set (0.00 sec)

But if for some reason we wanted to trim all whitespace, or any specified chars we can use remstr (remove string)

SELECT TRIM(BOTH' ' FROM '    new york   ');


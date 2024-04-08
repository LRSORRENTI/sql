# The IN operator

The IN operator helps us select values that are IN a specifed set of values, the IN operator must include the set which is ('value', 'value', 'value')

The syntax looks like this: 

### SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Namesake                                        | Lahiri       |
| Interpreter of Maladies                             | Lahiri       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where I'm Calling From: Selected Stories            | Carver       |
+-----------------------------------------------------+--------------+

## NOT IN 

There's also the inverse check, NOT IN 

### SELECT title, author_lname FROM books WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');

SELECT title, author_lname FROM books WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');
+-------------------------------------------+----------------+
| title                                     | author_lname   |
+-------------------------------------------+----------------+
| Norse Mythology                           | Gaiman         |
| American Gods                             | Gaiman         |
| A Hologram for the King: A Novel          | Eggers         |
| The Circle                                | Eggers         |
| The Amazing Adventures of Kavalier & Clay | Chabon         |
| A Heartbreaking Work of Staggering Genius | Eggers         |
| Coraline                                  | Gaiman         |
| White Noise                               | DeLillo        |
| Cannery Row                               | Steinbeck      |
| Oblivion: Stories                         | Foster Wallace |
| Consider the Lobster                      | Foster Wallace |
| 10% Happier                               | Harris         |
| fake_book                                 | Harris         |
| Lincoln In The Bardo                      | Saunders       |
+-------------------------------------------+----------------+

## MODULO

The % operator is the remainder operator, it can be used to check the remainder of two numbers 

firstnum % secondnum

What module does is check how many times does the first number, then return the remainder:

SELECT 17 % 6;
 +--------+
| 17 % 6 |
+--------+
|      5 |
+--------+

The remainder is 5, since  you can only added 6 together once to get 12, and 6 * 3 is 18 which exceeds the first number check, meaning we can add 6 together only twice and end up having a remainder of 5 

Which means an easy modulo check is any number and two,
18 % 2, or 20020 % 2; 

+-----------+
| 20020 % 2 |
+-----------+
|         0 |
+-----------+

If it's even it returns zero, and in the below zero we check the inverse, to get all odd number released_years

SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0;

+-------------------------------------------+---------------+
| title                                     | released_year |
+-------------------------------------------+---------------+
| The Namesake                              |          2003 |
| American Gods                             |          2001 |
| The Circle                                |          2013 |
| A Heartbreaking Work of Staggering Genius |          2001 |
| Coraline                                  |          2003 |
| Consider the Lobster                      |          2005 |
| fake_book                                 |          2001 |
| Lincoln In The Bardo                      |          2017 |
+-------------------------------------------+---------------+

# Greater than, Less than

Greater than operator '>' will check for values that exceed the checked value 

SELECT * FROM books WHERE released_year > 2005;
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                            | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
|       2 | Norse Mythology                  | Neil         | Gaiman       |          2016 |             43 |   304 |
|       5 | A Hologram for the King: A Novel | Dave         | Eggers       |          2012 |            154 |   352 |
|       6 | The Circle                       | Dave         | Eggers       |          2013 |             26 |   504 |
|       8 | Just Kids                        | Patti        | Smith        |          2010 |             55 |   304 |
|      17 | 10% Happier                      | Dan          | Harris       |          2014 |             29 |   256 |
|      19 | Lincoln In The Bardo             | George       | Saunders     |          2017 |           1000 |   367 |
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+

SELECT * FROM books WHERE pages > 500;
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       6 | The Circle                                | Dave         | Eggers       |          2013 |             26 |   504 |
|       7 | The Amazing Adventures of Kavalier & Clay | Michael      | Chabon       |          2000 |             68 |   634 |
|      12 | Where I'm Calling From: Selected Stories  | Raymond      | Carver       |          1989 |             12 |   526 |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+

## Boolean return values

In sql, when evaluating an expression, if it returns 1, it's true, if it returns 0, it's false

SELECT 99 > 1;
+--------+
| 99 > 1 |
+--------+
|      1 |
+--------+
1 row in set (0.00 sec)


+-------+
| 0 > 1 |
+-------+
|     0 |
+-------+
1 row in set (0.00 sec) 

SELECT 1 > NULL;
+----------+
| 1 > NULL |
+----------+
|     NULL |
+----------+


SELECT title, released_year FROM books WHERE released_year < 2000 ORDER BY released_year ASC;
+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| Cannery Row                                         |          1945 |
| What We Talk About When We Talk About Love: Stories |          1981 |
| White Noise                                         |          1985 |
| Where I'm Calling From: Selected Stories            |          1989 |
| Interpreter of Maladies                             |          1996 |
+-----------------------------------------------------+---------------+

SELECT title, released_year FROM books WHERE released_year >= 2010;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Norse Mythology                  |          2016 |
| A Hologram for the King: A Novel |          2012 |
| The Circle                       |          2013 |
| Just Kids                        |          2010 |
| 10% Happier                      |          2014 |
| Lincoln In The Bardo             |          2017 |
+----------------------------------+---------------+

SELECT title, released_year FROM books WHERE released_year <= 1985;

+-----------------------------------------------------+---------------+
| title                                               | released_year |
+-----------------------------------------------------+---------------+
| What We Talk About When We Talk About Love: Stories |          1981 |
| White Noise                                         |          1985 |
| Cannery Row                                         |          1945 |
+-----------------------------------------------------+---------------+
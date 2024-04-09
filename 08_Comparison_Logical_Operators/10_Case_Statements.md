# Case Statements 

CASE is a way to define additional values based on other values, in our books example we could catgorize an additonal column where the case for every book written before the year 2000 is 20th century lit, and written post 2000 is Modern lit, or if we had really old books like Summa Theologica by Thomas Aquinas, it would have 13th Century as a case 

The syntax looks like this:

SELECT title, released_year, 
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS GENRE
FROM books;

So we have our select, then the CASE keyword immediately followed by a WHEN statement which is the main value to check against, THEN is used to assign a column name to the values that satisfy then WHEN check, 'Modern Lit' or whatever column name needed

After the WHEN and THEN is an ELSE statement which is the default for the values that don't satisfy our selection criteria in the WHEN

Then finished with an END AS keyword phrase, and GENRE will be the name of the column added, this can be renamed to whatever, ERA, or BOOK_GENRE etc..

SELECT title, released_year,
    CASE         
    WHEN released_year >= 2000 
    THEN 'Modern Lit'
    ELSE '20th Century Lit'     
    END AS BOOK_GENRE 
FROM books;
+-----------------------------------------------------+---------------+------------------+
| title                                               | released_year | BOOK_GENRE       |
+-----------------------------------------------------+---------------+------------------+
| The Namesake                                        |          2003 | Modern Lit       |
| Norse Mythology                                     |          2016 | Modern Lit       |
| American Gods                                       |          2001 | Modern Lit       |
| Interpreter of Maladies                             |          1996 | 20th Century Lit |
| A Hologram for the King: A Novel                    |          2012 | Modern Lit       |
| The Circle                                          |          2013 | Modern Lit       |
| The Amazing Adventures of Kavalier & Clay           |          2000 | Modern Lit       |
| Just Kids                                           |          2010 | Modern Lit       |
| A Heartbreaking Work of Staggering Genius           |          2001 | Modern Lit       |
| Coraline                                            |          2003 | Modern Lit       |
| What We Talk About When We Talk About Love: Stories |          1981 | 20th Century Lit |
| Where I'm Calling From: Selected Stories            |          1989 | 20th Century Lit |
| White Noise                                         |          1985 | 20th Century Lit |
| Cannery Row                                         |          1945 | 20th Century Lit |
| Oblivion: Stories                                   |          2004 | Modern Lit       |
| Consider the Lobster                                |          2005 | Modern Lit       |
| 10% Happier                                         |          2014 | Modern Lit       |
| fake_book                                           |          2001 | Modern Lit       |
| Lincoln In The Bardo                                |          2017 | Modern Lit       |
+-----------------------------------------------------+---------------+------------------+


SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK_RATING
FROM books;

+-----------------------------------------------------+----------------+--------------+
| title                                               | stock_quantity | STOCK_RATING |
+-----------------------------------------------------+----------------+--------------+
| The Namesake                                        |             32 | *            |
| Norse Mythology                                     |             43 | *            |
| American Gods                                       |             12 | *            |
| Interpreter of Maladies                             |             97 | **           |
| A Hologram for the King: A Novel                    |            154 | ***          |
| The Circle                                          |             26 | *            |
| The Amazing Adventures of Kavalier & Clay           |             68 | **           |
| Just Kids                                           |             55 | **           |
| A Heartbreaking Work of Staggering Genius           |            104 | ***          |
| Coraline                                            |            100 | **           |
| What We Talk About When We Talk About Love: Stories |             23 | *            |
| Where I'm Calling From: Selected Stories            |             12 | *            |
| White Noise                                         |             49 | *            |
| Cannery Row                                         |             95 | **           |
| Oblivion: Stories                                   |            172 | ***          |
| Consider the Lobster                                |             92 | **           |
| 10% Happier                                         |             29 | *            |
| fake_book                                           |            287 | ***          |
| Lincoln In The Bardo                                |           1000 | ***          |
+-----------------------------------------------------+----------------+--------------+

SELECT title, released_year,
CASE
	WHEN released_year >= 2000 THEN 'modern lit'
    ELSE '20th century lit' 
END AS genre
FROM books;
 
 
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
 
 
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
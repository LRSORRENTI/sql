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


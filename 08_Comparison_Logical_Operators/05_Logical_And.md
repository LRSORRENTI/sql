# Logical AND &&

Pairing && with some of the other logic operators is a common thing in SQL, it can be paired with >, <= or any other operator to chain together nice filters for data 

SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' AND released_year >= 2010;

+----------------------------------+--------------+---------------+
| title                            | author_lname | released_year |
+----------------------------------+--------------+---------------+
| A Hologram for the King: A Novel | Eggers       |          2012 |
| The Circle                       | Eggers       |          2013 |
+----------------------------------+--------------+---------------+

SELECT * FROM books WHERE author_lname='Eggers' AND released_year > 2010 AND title LIKE '%novel%';
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                            | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
|       5 | A Hologram for the King: A Novel | Dave         | Eggers       |          2012 |            154 |   352 |
+---------+----------------------------------+--------------+--------------+---------------+----------------+-------+

SELECT title, pages FROM books WHERE CHAR_LENGTH(title) > 15 AND pages > 500;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
| Where I'm Calling From: Selected Stories  |   526 |
+-------------------------------------------+-------+
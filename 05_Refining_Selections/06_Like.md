# Like operator 

The Like operator assists us in searching, at the moment we know the WHERE clause can also help us locate specific things like: 

SELECT title, author_fname, author_lname FROM books WHERE author_fname='David';
+----------------------+--------------+----------------+
| title                | author_fname | author_lname   |
+----------------------+--------------+----------------+
| Oblivion: Stories    | David        | Foster Wallace |
| Consider the Lobster | David        | Foster Wallace |
+----------------------+--------------+----------------+

But the caveat is that the string has to be an exact match, if we did author_fname='dave'

Imagine there's a book we need, can't remember exactly the title, but we know the author's name is David or Dave, or Dan or something similar, we can use Like to search things like those values 

WHERE author_fname LIKE '%da%';

Above the two %% are wildcards, which means look for anything before da and after da, if it was just 'da%' it would be look for anything that starts with da, but not before 

SELECT title, author_fname, author_lname FROM books WHERE author_fname LIKE '%da%';

SELECT title, author_fname, author_lname FROM books WHERE author_fname LIKE '%da%';
+-------------------------------------------+--------------+----------------+
| title                                     | author_fname | author_lname   |
+-------------------------------------------+--------------+----------------+
| A Hologram for the King: A Novel          | Dave         | Eggers         |
| The Circle                                | Dave         | Eggers         |
| A Heartbreaking Work of Staggering Genius | Dave         | Eggers         |
| Oblivion: Stories                         | David        | Foster Wallace |
| Consider the Lobster                      | David        | Foster Wallace |
| 10% Happier                               | Dan          | Harris         |
| fake_book                                 | Freida       | Harris         |
+-------------------------------------------+--------------+----------------+

It returns any instance of da in the author column that matches da, before or after, but to modify it so that we search for author names that begin with da only:

SELECT title, author_fname, author_lname FROM books WHERE author_fname LIKE 'da%';
+-------------------------------------------+--------------+----------------+
| title                                     | author_fname | author_lname   |
+-------------------------------------------+--------------+----------------+
| A Hologram for the King: A Novel          | Dave         | Eggers         |
| The Circle                                | Dave         | Eggers         |
| A Heartbreaking Work of Staggering Genius | Dave         | Eggers         |
| Oblivion: Stories                         | David        | Foster Wallace |
| Consider the Lobster                      | David        | Foster Wallace |
| 10% Happier                               | Dan          | Harris         |
+-------------------------------------------+--------------+----------------+


SELECT title FROM books WHERE title LIKE '%:%';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| A Hologram for the King: A Novel                    |
| What We Talk About When We Talk About Love: Stories |
| Where I'm Calling From: Selected Stories            |
| Oblivion: Stories                                   |
+-----------------------------------------------------+


## UNDERSCORES

You can use underscores to search for character length matches, below query will return every author nane that's exactly 4 characters 


SELECT * FROM books WHERE author_fname LIKE '____';
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
| book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
|       2 | Norse Mythology                           | Neil         | Gaiman       |          2016 |             43 |   304 |
|       3 | American Gods                             | Neil         | Gaiman       |          2001 |             12 |   465 |
|       5 | A Hologram for the King: A Novel          | Dave         | Eggers       |          2012 |            154 |   352 |
|       6 | The Circle                                | Dave         | Eggers       |          2013 |             26 |   504 |
|       9 | A Heartbreaking Work of Staggering Genius | Dave         | Eggers       |          2001 |            104 |   437 |
|      10 | Coraline                                  | Neil         | Gaiman       |          2003 |            100 |   208 |
|      14 | Cannery Row                               | John         | Steinbeck    |          1945 |             95 |   181 |
+---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+

SELECT * FROM books WHERE author_fname LIKE '_____';
+---------+----------------------+--------------+----------------+---------------+----------------+-------+
| book_id | title                | author_fname | author_lname   | released_year | stock_quantity | pages |
+---------+----------------------+--------------+----------------+---------------+----------------+-------+
|       8 | Just Kids            | Patti        | Smith          |          2010 |             55 |   304 |
|      15 | Oblivion: Stories    | David        | Foster Wallace |          2004 |            172 |   329 |
|      16 | Consider the Lobster | David        | Foster Wallace |          2005 |             92 |   343 |
+---------+----------------------+--------------+----------------+---------------+----------------+-------+

SELECT * FROM books WHERE author_fname LIKE '_a_';
+---------+-------------+--------------+--------------+---------------+----------------+-------+
| book_id | title       | author_fname | author_lname | released_year | stock_quantity | pages |
+---------+-------------+--------------+--------------+---------------+----------------+-------+
|      17 | 10% Happier | Dan          | Harris       |          2014 |             29 |   256 |
+---------+-------------+--------------+--------------+---------------+----------------+-------+

# Between

Just as a note before we use between, there are ways to accomplish the same functionality as between using the comparison oprators:

SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;

+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| A Hologram for the King: A Novel |          2012 |
| The Circle                       |          2013 |
| Just Kids                        |          2010 |
| Oblivion: Stories                |          2004 |
| Consider the Lobster             |          2005 |
| 10% Happier                      |          2014 |
+----------------------------------+---------------+


BETWEEN VERSION:


SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| A Hologram for the King: A Novel |          2012 |
| The Circle                       |          2013 |
| Just Kids                        |          2010 |
| Oblivion: Stories                |          2004 |
| Consider the Lobster             |          2005 |
| 10% Happier                      |          2014 |
+----------------------------------+---------------+

So the between version is a little cleaner, there isn't a need to join together comparison checks, also note BETWEEN is inclusive, so the 2004, and 2015 will return books releaed in those years as well, not just between them 

SELECT title, pages FROM books WHERE pages BETWEEN 500 AND 1500;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Circle                                |   504 |
| The Amazing Adventures of Kavalier & Clay |   634 |
| Where I'm Calling From: Selected Stories  |   526 |
+-------------------------------------------+-------+

## NOT BETWEEN 

There's also an inverse check, NOT BETWEEN 

SELECT title, pages FROM books WHERE pages NOT BETWEEN 500 AND 1500;
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| The Namesake                                        |   291 |
| Norse Mythology                                     |   304 |
| American Gods                                       |   465 |
| Interpreter of Maladies                             |   198 |
| A Hologram for the King: A Novel                    |   352 |
| Just Kids                                           |   304 |
| A Heartbreaking Work of Staggering Genius           |   437 |
| Coraline                                            |   208 |
| What We Talk About When We Talk About Love: Stories |   176 |
| White Noise                                         |   320 |
| Cannery Row                                         |   181 |
| Oblivion: Stories                                   |   329 |
| Consider the Lobster                                |   343 |
| 10% Happier                                         |   256 |
| fake_book                                           |   428 |
| Lincoln In The Bardo                                |   367 |
+-----------------------------------------------------+-------+

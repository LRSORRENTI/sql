# CHAR_LENGTH

CHAR_LENGTH will count the CHARS in any passed in string:

SELECT CHAR_LENGTH('abcdefghijklmnopqrstuvwxyz') AS AlphabetLength;

+----------------+
| AlphabetLength |
+----------------+
|             26 |
+----------------+
1 row in set (0.00 sec)

SELECT title,  CHAR_LENGTH(title) AS TitleLength FROM books;
+-----------------------------------------------------+-------------+
| title                                               | TitleLength |
+-----------------------------------------------------+-------------+
| The Namesake                                        |          12 |
| Norse Mythology                                     |          15 |
| American Gods                                       |          13 |
| Interpreter of Maladies                             |          23 |
| A Hologram for the King: A Novel                    |          32 |
| The Circle                                          |          10 |
| The Amazing Adventures of Kavalier & Clay           |          41 |
| Just Kids                                           |           9 |
| A Heartbreaking Work of Staggering Genius           |          41 |
| Coraline                                            |           8 |
| What We Talk About When We Talk About Love: Stories |          51 |
| Where I'm Calling From: Selected Stories            |          40 |
| White Noise                                         |          11 |
| Cannery Row                                         |          11 |
| Oblivion: Stories                                   |          17 |
| Consider the Lobster                                |          20 |
+-----------------------------------------------------+-------------+
16 rows in set (0.00 sec)


## AN IMPORTANT NOTE 

CHAR_LENGTH returns the character length, but the LENGTH function returns the bytes amount


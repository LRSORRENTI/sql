# End of section exercise:

## Reverse and uppercase the following

'Why does my cat look at me this way?'

SELECT REVERSE(UPPER('Why does my cat look at me this way?'));
+--------------------------------------------------------+
| REVERSE(UPPER('Why does my cat look at me this way?')) |
+--------------------------------------------------------+
| ?YAW SIHT EM TA KOOL TAC YM SEOD YHW                   |
+--------------------------------------------------------+
1 row in set (0.00 sec)

## In books db replace any spaces in title with '->'

SELECT REPLACE(title, ' ', '->' ) FROM books;
+--------------------------------------------------------------+
| REPLACE(title, ' ', '->' )                                   |
+--------------------------------------------------------------+
| The->Namesake                                                |
| Norse->Mythology                                             |
| American->Gods                                               |
| Interpreter->of->Maladies                                    |
| A->Hologram->for->the->King:->A->Novel                       |
| The->Circle                                                  |
| The->Amazing->Adventures->of->Kavalier->&->Clay              |
| Just->Kids                                                   |
| A->Heartbreaking->Work->of->Staggering->Genius               |
| Coraline                                                     |
| What->We->Talk->About->When->We->Talk->About->Love:->Stories |
| Where->I'm->Calling->From:->Selected->Stories                |
| White->Noise                                                 |
| Cannery->Row                                                 |
| Oblivion:->Stories                                           |
| Consider->the->Lobster                                       |
+-------------------------------------------------------------

## Print out the last name of all authors, and the last name of all authors backwords in a single query, and name each column forwards and backwards 

SELECT (author_lname) AS forwards, REVERSE(author_lname) AS backwards FROM books;
+----------------+----------------+
| forwards       | backwards      |
+----------------+----------------+
| Lahiri         | irihaL         |
| Gaiman         | namiaG         |
| Gaiman         | namiaG         |
| Lahiri         | irihaL         |
| Eggers         | sreggE         |
| Eggers         | sreggE         |
| Chabon         | nobahC         |
| Smith          | htimS          |
| Eggers         | sreggE         |
| Gaiman         | namiaG         |
| Carver         | revraC         |
| Carver         | revraC         |
| DeLillo        | olliLeD        |
| Steinbeck      | kcebnietS      |
| Foster Wallace | ecallaW retsoF |
| Foster Wallace | ecallaW retsoF |
+----------------+----------------+

## Print out the author's first and last name together in uppercase 


SELECT CONCAT(UPPER(author_fname), ' ', UPPER(author_lname))AS  'full name in caps' FROM books;
+----------------------+
| full name in caps    |
+----------------------+
| JHUMPA LAHIRI        |
| NEIL GAIMAN          |
| NEIL GAIMAN          |
| JHUMPA LAHIRI        |
| DAVE EGGERS          |
| DAVE EGGERS          |
| MICHAEL CHABON       |
| PATTI SMITH          |
| DAVE EGGERS          |
| NEIL GAIMAN          |
| RAYMOND CARVER       |
| RAYMOND CARVER       |
| DON DELILLO          |
| JOHN STEINBECK       |
| DAVID FOSTER WALLACE |
| DAVID FOSTER WALLACE |
+----------------------+

## Blurb: take the title and release year of each book and combine them into a sentence like 'the namesake was released in 2003' but for all the books

SELECT CONCAT( title, ' was released in ', released_year) AS blurb FROM books;
+--------------------------------------------------------------------------+
| blurb                                                                    |
+--------------------------------------------------------------------------+
| The Namesake was released in 2003                                        |
| Norse Mythology was released in 2016                                     |
| American Gods was released in 2001                                       |
| Interpreter of Maladies was released in 1996                             |
| A Hologram for the King: A Novel was released in 2012                    |
| The Circle was released in 2013                                          |
| The Amazing Adventures of Kavalier & Clay was released in 2000           |
| Just Kids was released in 2010                                           |
| A Heartbreaking Work of Staggering Genius was released in 2001           |
| Coraline was released in 2003                                            |
| What We Talk About When We Talk About Love: Stories was released in 1981 |
| Where I'm Calling From: Selected Stories was released in 1989            |
| White Noise was released in 1985                                         |
| Cannery Row was released in 1945                                         |
| Oblivion: Stories was released in 2004                                   |
| Consider the Lobster was released in 2005                                |
+--------------------------------------------------------------------------+
16 rows in set (0.00 sec)

## Print book titles in one column, and the length of the title name in a column next to it


SELECT title, CHAR_LENGTH(title) AS character_count FROM books;
+-----------------------------------------------------+-----------------+
| title                                               | character_count |
+-----------------------------------------------------+-----------------+
| The Namesake                                        |              12 |
| Norse Mythology                                     |              15 |
| American Gods                                       |              13 |
| Interpreter of Maladies                             |              23 |
| A Hologram for the King: A Novel                    |              32 |
| The Circle                                          |              10 |
| The Amazing Adventures of Kavalier & Clay           |              41 |
| Just Kids                                           |               9 |
| A Heartbreaking Work of Staggering Genius           |              41 |
| Coraline                                            |               8 |
| What We Talk About When We Talk About Love: Stories |              51 |
| Where I'm Calling From: Selected Stories            |              40 |
| White Noise                                         |              11 |
| Cannery Row                                         |              11 |
| Oblivion: Stories                                   |              17 |
| Consider the Lobster                                |              20 |
+-----------------------------------------------------+-----------------+

## Print out the first 10 chars of each title, and append ... to the title, and name it as 'short title', then in the next column print the author lastname in the middle a ',' and the author firstname named as author, then in the final column the quantity of them in a format '12 in stock'

SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS 'short title'
FROM books  WHERE SUBSTR(title, 1, 1) = 'A' AND released_year < 2011;


AUTHOR IS DONE:

SELECT CONCAT(author_lname, ',' ,author_fname) AS author
FROM books  WHERE SUBSTR(title, 1, 1) = 'A' AND released_year < 2011;


QUANTITY IS DONE:

SELECT CONCAT(stock_quantity, ' in stock') AS quantity FROM books  WHERE SUBSTR(title, 1, 1) = 'A' AND released_year < 2011;

FINAL QUERY:

SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS 'short title',
CONCAT(author_lname, ',' ,author_fname) AS author,
CONCAT(stock_quantity, ' in stock') AS quantity
FROM books  WHERE SUBSTR(title, 1, 1) = 'A' AND released_year < 2011;
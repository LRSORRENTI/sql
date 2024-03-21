# Exercise 

1. Select all titles that contain the string 'stories'

SELECT title FROM books WHERE title LIKE '%stories%';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| What We Talk About When We Talk About Love: Stories |
| Where I'm Calling From: Selected Stories            |
| Oblivion: Stories                                   |
+-----------------------------------------------------+

2. Find the book with the longest page length and return the title and pages amount

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+

3. Print out the combined title, - , and release year for the three most recently released books

SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;
+-----------------------------+
| summary                     |
+-----------------------------+
| Lincoln In The Bardo - 2017 |
| Norse Mythology - 2016      |
| 10% Happier - 2014          |
+-----------------------------+


4. Find all author_lnames that contain a ' ' space, and also return the title for those books 

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %'; 
+----------------------+----------------+
| title                | author_lname   |
+----------------------+----------------+
| Oblivion: Stories    | Foster Wallace |
| Consider the Lobster | Foster Wallace |
+----------------------+----------------+


5. Find the thre books that have the lowest stock quantity, and return the title, and released year for them

6. Print title, author_lname both sorted alphabetically, so the books from each sorted author, are also sorted 

7. Return a table of all authors in caps: MY FAVORITE AUTHOR IS RAYMOND CARVER, all the way down to steinbeck
# Not like 

The not like operator which also helps refine searches, below is a query to check the inverse of the LIKE clause, return all book titles that don't contain any space characters 

```
SELECT title FROM books WHERE title NOT LIKE '% %';
```

+-----------+
| title     |
+-----------+
| Coraline  |
| fake_book |
+-----------+

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

Then we can use NOT LIKE to basically filter out and return authors names that don't begin with 'da':

SELECT title, author_fname, author_lname FROM books WHERE author_fname NOT LIKE 'da%';
+-----------------------------------------------------+--------------+--------------+
| title                                               | author_fname | author_lname |
+-----------------------------------------------------+--------------+--------------+
| The Namesake                                        | Jhumpa       | Lahiri       |
| Norse Mythology                                     | Neil         | Gaiman       |
| American Gods                                       | Neil         | Gaiman       |
| Interpreter of Maladies                             | Jhumpa       | Lahiri       |
| The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon       |
| Just Kids                                           | Patti        | Smith        |
| Coraline                                            | Neil         | Gaiman       |
| What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |
| Where I'm Calling From: Selected Stories            | Raymond      | Carver       |
| White Noise                                         | Don          | DeLillo      |
| Cannery Row                                         | John         | Steinbeck    |
| fake_book                                           | Freida       | Harris       |
| Lincoln In The Bardo                                | George       | Saunders     |
+-----------------------------------------------------+--------------+--------------+

SELECT title FROM books WHERE title NOT LIKE '%e%';
+-----------+
| title     |
+-----------+
| Just Kids |
+-----------+

Below query returns all titles that don't contain any "a"'s within the title

SELECT title FROM books WHERE title NOT LIKE '%a%';
+----------------------+
| title                |
+----------------------+
| Norse Mythology      |
| The Circle           |
| Just Kids            |
| White Noise          |
| Oblivion: Stories    |
| Consider the Lobster |
+----------------------+


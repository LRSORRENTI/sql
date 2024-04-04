# Not Equal 

We'll start with not equal or '!='

```
SELECT title FROM books WHERE released_year != 2017;
```
The above works as akin to a filter, we want all books except any book from 2017 

```
SELECT title, author_lname FROM books WHERE author_lname != 'Gaiman';
```
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| The Namesake                                        | Lahiri         |
| Interpreter of Maladies                             | Lahiri         |
| A Hologram for the King: A Novel                    | Eggers         |
| The Circle                                          | Eggers         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| Just Kids                                           | Smith          |
| A Heartbreaking Work of Staggering Genius           | Eggers         |
| What We Talk About When We Talk About Love: Stories | Carver         |
| Where I'm Calling From: Selected Stories            | Carver         |
| White Noise                                         | DeLillo        |
| Cannery Row                                         | Steinbeck      |
| Oblivion: Stories                                   | Foster Wallace |
| Consider the Lobster                                | Foster Wallace |
| 10% Happier                                         | Harris         |
| fake_book                                           | Harris         |
| Lincoln In The Bardo                                | Saunders       |
+-----------------------------------------------------+----------------+


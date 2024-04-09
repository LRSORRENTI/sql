# Exercise 

1. Evaluate the following and think about what they will return

SELECT 10 != 10;
Returns 0 or false

SELECT 15 > 14 AND 99 - 5 <= 94;
Returns 1 or true

SELECT 1 IN (5, 3) OR 9 BETWEEN 8 AND 10;
Returns 1 or true because an OR statement, only 1 side needs to be true to return 1

2. Write a select statement to return all the book titles, and released years before but not including 1980

SELECT title, released_year FROM books WHERE released_year < 1980;

+------------------+---------------+
| title            | released_year |
+------------------+---------------+
| Cannery Row      |          1945 |
| Summa Theologica |          1265 |
+------------------+---------------+

3. Write a query to select every book written by Eggers or by Chabon 

SELECT title, author_lname FROM books WHERE author_lname IN ('Eggers', 'Chabon');
+-------------------------------------------+--------------+
| title                                     | author_lname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Eggers       |
| The Circle                                | Eggers       |
| The Amazing Adventures of Kavalier & Clay | Chabon       |
| A Heartbreaking Work of Staggering Genius | Eggers       |
+-------------------------------------------+--------------+

4. Write a query to select all books written by Lahiri, but only the ones published after the year 2000

SELECT title, released_year, author_lname FROM books WHERE author_lname = 'Lahiri' && released_year > 2000;

+--------------+---------------+--------------+
| title        | released_year | author_lname |
+--------------+---------------+--------------+
| The Namesake |          2003 | Lahiri       |
+--------------+---------------+--------------+

5. Write a query to select all books with page counts between 100 and 200

SELECT title, pages FROM books WHERE pages BETWEEN 100 AND 200;

+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| Interpreter of Maladies                             |   198 |
| What We Talk About When We Talk About Love: Stories |   176 |
| Cannery Row                                         |   181 |
+-----------------------------------------------------+-------+

6. Write a query to select all books where the author_lname begins with either a 'C' or 'S'

SELECT author_lname FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

+--------------+
| author_lname |
+--------------+
| Chabon       |
| Smith        |
| Carver       |
| Carver       |
| Steinbeck    |
| Saunders     |
+--------------+

There is another way to get the above query using SUBSTR

SELECT author_lname
FROM books 
WHERE SUBSTR(author_lname, 1, 1) 
IN ('C', 'S');

+--------------+
| author_lname |
+--------------+
| Chabon       |
| Smith        |
| Carver       |
| Carver       |
| Steinbeck    |
| Saunders     |
+--------------+

7. Write a query that returns values where title has the string 'stories' somewhere within, and use a case to assign it a column TYPE of short stories, and the books 'just kids', and 'A heartbreaking work' are TYPE 'Memoir' case, and everything else defaults to CASE type of Novel

SELECT title, author_lname,
    CASE         
        WHEN title LIKE '%stories%'
        THEN 'Short Stories'
        WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' 
        THEN 'Memoir'
    ELSE 'Novel'     
    END AS TYPE 
FROM books;

+-----------------------------------------------------+----------------+---------------+
| title                                               | author_lname   | TYPE          |
+-----------------------------------------------------+----------------+---------------+
| The Namesake                                        | Lahiri         | Novel         |
| Norse Mythology                                     | Gaiman         | Novel         |
| American Gods                                       | Gaiman         | Novel         |
| Interpreter of Maladies                             | Lahiri         | Novel         |
| A Hologram for the King: A Novel                    | Eggers         | Novel         |
| The Circle                                          | Eggers         | Novel         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
| Just Kids                                           | Smith          | Memoir        |
| A Heartbreaking Work of Staggering Genius           | Eggers         | Memoir        |
| Coraline                                            | Gaiman         | Novel         |
| What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
| Where I'm Calling From: Selected Stories            | Carver         | Short Stories |
| White Noise                                         | DeLillo        | Novel         |
| Cannery Row                                         | Steinbeck      | Novel         |
| Oblivion: Stories                                   | Foster Wallace | Short Stories |
| Consider the Lobster                                | Foster Wallace | Novel         |
| 10% Happier                                         | Harris         | Novel         |
| fake_book                                           | Harris         | Novel         |
| Lincoln In The Bardo                                | Saunders       | Novel         |
| Summa Theologica                                    | Aquinas        | Novel         |
+-----------------------------------------------------+----------------+---------------+

8. Write a query that returns author_fname, author_lname, and a final column called COUNT which for each author '2 books', '3 books' or '1 book' singular if there's only 1 etc..

SELECT 
    author_fname,
    author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), ' book')
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM 
    books
GROUP BY 
    author_fname, author_lname;

+--------------+----------------+---------+
| author_fname | author_lname   | COUNT   |
+--------------+----------------+---------+
| Jhumpa       | Lahiri         | 2 books |
| Neil         | Gaiman         | 3 books |
| Dave         | Eggers         | 3 books |
| Michael      | Chabon         | 1 book  |
| Patti        | Smith          | 1 book  |
| Raymond      | Carver         | 2 books |
| Don          | DeLillo        | 1 book  |
| John         | Steinbeck      | 1 book  |
| David        | Foster Wallace | 2 books |
| Dan          | Harris         | 1 book  |
| Freida       | Harris         | 1 book  |
| George       | Saunders       | 1 book  |
| NULL         | Aquinas        | 1 book  |
+--------------+----------------+---------+

# Logical OR

OR will satisfy two comparisons, only one side of the OR check needs to return true for the OR check to return a value 

```
SELECT title, author_lname, released_year FROM books WHERE author_lname='Eggers' OR released_year > 2010 ORDER BY released_year ASC;
```

+-------------------------------------------+--------------+---------------+
| title                                     | author_lname | released_year |
+-------------------------------------------+--------------+---------------+
| A Heartbreaking Work of Staggering Genius | Eggers       |          2001 |
| A Hologram for the King: A Novel          | Eggers       |          2012 |
| The Circle                                | Eggers       |          2013 |
| 10% Happier                               | Harris       |          2014 |
| Norse Mythology                           | Gaiman       |          2016 |
| Lincoln In The Bardo                      | Saunders     |          2017 |
+-------------------------------------------+--------------+---------------+

SELECT 1 < 5 OR 4 = 5;

+----------------+
| 1 < 5 OR 4 = 5 |
+----------------+
|              1 |
+----------------+

Above we still get 1 for true, 4 isn't equal to 5 but with OR only one side needs to be true, and the entire evaluation returns true

+-----------------+
| 1 < 5 AND 4 = 5 |
+-----------------+
|               0 |
+-----------------+

Above returns false, since AND requires both sides to be True 

If we're going on a flight, and we want books that are less than 200 pages or are books containing short stories, we can use:

```
SELECT title, pages FROM books WHERE pages < 200 OR title LIKE '%stories%';
```

+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| Interpreter of Maladies                             |   198 |
| What We Talk About When We Talk About Love: Stories |   176 |
| Where I'm Calling From: Selected Stories            |   526 |
| Cannery Row                                         |   181 |
| Oblivion: Stories                                   |   329 |
+-----------------------------------------------------+-------+
# Combining SUBSTR and CONCAT

```
SELECT SUBSTR(title, 1, 10) FROM books;
```

SELECT SUBSTR(title, 1, 10) FROM books;
+----------------------+
| SUBSTR(title, 1, 10) |
+----------------------+
| The Namesa           |
| Norse Myth           |
| American G           |
| Interprete           |
| A Hologram           |
| The Circle           |
| The Amazin           |
| Just Kids            |
| A Heartbre           |
| Coraline             |
| What We Ta           |
| Where I'm            |
| White Nois           |
| Cannery Ro           |
| Oblivion:            |
| Consider t           |
+----------------------+

To append '...' to the long titles, we can use this command,
you pass in SUBSTR to CONCAT, then as a second arg pass in 
'...'

SELECT CONCAT(SUBSTR(title, 1, 10), '...') FROM books;
+-------------------------------------+
| CONCAT(SUBSTR(title, 1, 10), '...') |
+-------------------------------------+
| The Namesa...                       |
| Norse Myth...                       |
| American G...                       |
| Interprete...                       |
| A Hologram...                       |
| The Circle...                       |
| The Amazin...                       |
| Just Kids...                        |
| A Heartbre...                       |
| Coraline...                         |
| What We Ta...                       |
| Where I'm ...                       |
| White Nois...                       |
| Cannery Ro...                       |
| Oblivion: ...                       |
| Consider t...                       |
+-------------------------------------+

The reverse also works if for whatever reason you want to prepend any data with some string value:

SELECT CONCAT('...' , SUBSTR(title, 1, 10)) FROM books;
+--------------------------------------+
| CONCAT('...' , SUBSTR(title, 1, 10)) |
+--------------------------------------+
| ...The Namesa                        |
| ...Norse Myth                        |
| ...American G                        |
| ...Interprete                        |
| ...A Hologram                        |
| ...The Circle                        |
| ...The Amazin                        |
| ...Just Kids                         |
| ...A Heartbre                        |
| ...Coraline                          |
| ...What We Ta                        |
| ...Where I'm                         |
| ...White Nois                        |
| ...Cannery Ro                        |
| ...Oblivion:                         |
| ...Consider t                        |
+--------------------------------------+

Can also pass in AS keyword for a cleaner look:

SELECT CONCAT('...' , SUBSTR(title, 1, 10)) AS shortened_title FROM books;
+-----------------+
| shortened_title |
+-----------------+
| ...The Namesa   |
| ...Norse Myth   |
| ...American G   |
| ...Interprete   |
| ...A Hologram   |
| ...The Circle   |
| ...The Amazin   |
| ...Just Kids    |
| ...A Heartbre   |
| ...Coraline     |
| ...What We Ta   |
| ...Where I'm    |
| ...White Nois   |
| ...Cannery Ro   |
| ...Oblivion:    |
| ...Consider t   |
+-----------------+
16 rows in set (0.00 sec)

SELECT CONCAT(SUBSTR(author_fname, 1, 1), '.', SUBSTR(author_lname, 1, 1), '.') AS first_last_intial FROM books;
+-------------------+
| first_last_intial |
+-------------------+
| J.L.              |
| N.G.              |
| N.G.              |
| J.L.              |
| D.E.              |
| D.E.              |
| M.C.              |
| P.S.              |
| D.E.              |
| N.G.              |
| R.C.              |
| R.C.              |
| D.D.              |
| J.S.              |
| D.F.              |
| D.F.              |
+-------------------+
16 rows in set (0.00 sec)

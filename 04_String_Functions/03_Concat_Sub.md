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

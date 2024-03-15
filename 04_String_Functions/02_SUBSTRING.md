# SUBSTRING METHOD

The next method we'll look at is substring

It can be called with SUBSTRING or SUBSTR, they are identical


SELECT SUBSTRING('Hello world', 1, 5);
+--------------------------------+
| SUBSTRING('Hello world', 1, 5) |
+--------------------------------+
| Hello                          |
+--------------------------------+

OR provide a single value, it will be the starting point and return everything after:

SELECT SUBSTRING('Hello world', 6);
+-----------------------------+
| SUBSTRING('Hello world', 6) |
+-----------------------------+
|  world                      |
+-----------------------------+

You can also provide a negative index to achieve similar results:

SELECT SUBSTRING('Hello world', -5);
+------------------------------+
| SUBSTRING('Hello world', -5) |
+------------------------------+
| world                        |
+------------------------------+

SELECT SUBSTRING(title, 1, 15) FROM books;
+-------------------------+
| SUBSTRING(title, 1, 15) |
+-------------------------+
| The Namesake            |
| Norse Mythology         |
| American Gods           |
| Interpreter of          |
| A Hologram for          |
| The Circle              |
| The Amazing Adv         |
| Just Kids               |
| A Heartbreaking         |
| Coraline                |
| What We Talk Ab         |
| Where I'm Calli         |
| White Noise             |
| Cannery Row             |
| Oblivion: Stori         |
| Consider the Lo         |
+-------------------------+


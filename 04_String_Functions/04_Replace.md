# REPLACE 

Thus far we've only been reading data, displaying data, we have not updated any data that's already in place, all we've done so far is select data, and maybe change how it looks after we query it.


SELECT REPLACE ('Hello world', 'Hell', '@&$*') AS Swear_Word_Replace;
+--------------------+
| Swear_Word_Replace |
+--------------------+
| @&$*o world        |
+--------------------+
1 row in set (0.00 sec)



SELECT REPLACE('Spring Summer Autumn Winter', ' ', ' and ') AS Seasons;
+-----------------------------------------+
| Seasons                                 |
+-----------------------------------------+
| Spring and Summer and Autumn and Winter |
+-----------------------------------------+


SELECT REPLACE(title, ' ', '-') AS replace_space_w_hyphen FROM books;
+-----------------------------------------------------+
| replace_space_w_hyphen                              |
+-----------------------------------------------------+
| The-Namesake                                        |
| Norse-Mythology                                     |
| American-Gods                                       |
| Interpreter-of-Maladies                             |
| A-Hologram-for-the-King:-A-Novel                    |
| The-Circle                                          |
| The-Amazing-Adventures-of-Kavalier-&-Clay           |
| Just-Kids                                           |
| A-Heartbreaking-Work-of-Staggering-Genius           |
| Coraline                                            |
| What-We-Talk-About-When-We-Talk-About-Love:-Stories |
| Where-I'm-Calling-From:-Selected-Stories            |
| White-Noise                                         |
| Cannery-Row                                         |
| Oblivion:-Stories                                   |
| Consider-the-Lobster                                |
+-----------------------------------------------------+
16 rows in set (0.00 sec)

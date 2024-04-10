# Renaming Tables 

To rename a table, there are a few approaches

RENAME TABLE curr_table_name TO new_table_name; 

OR 

ALTER TABLE curr_table_name TO new_table_name; 


RENAME TABLE companies TO company_list;
Query OK, 0 rows affected (0.55 sec)

SHOW TABLES;
+---------------------------------------+
| Tables_in_constraints_and_alter_table |
+---------------------------------------+
| club_entry                            |
| company_list                          |
| contacts                              |
| houses                                |
| palindrome                            |
| users                                 |
+---------------------------------------+

Or use ALTER 

ALTER TABLE company_list RENAME  TO companies;

SHOW TABLES;

+---------------------------------------+
| Tables_in_constraints_and_alter_table |
+---------------------------------------+
| club_entry                            |
| companies                             |
| contacts                              |
| houses                                |
| palindrome                            |
| users                                 |
+---------------------------------------+


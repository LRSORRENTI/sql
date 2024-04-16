# SQL Modes 

SQL has different modes to operate on, we can view them using the below queries. And they are the default for a reason, often times it's only the SESSION mode you'd change for something, which when you close and reopen mysql the settings will revert back to the default 

SELECT @@GLOBAL.sql_mode;
----------------------------------------+
| @@GLOBAL.sql_mode                                                                                                     |
+-----------------------------------------------------------------------------------------------------------------------+
| ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION |
+-----------------------------------------------------------------------------------------------------------------------+

SELECT @@SESSION.sql_mode;

+-----------------------------------------------------------------------------------------------------------------------+
| @@SESSION.sql_mode                                                                                                    |
+-----------------------------------------------------------------------------------------------------------------------+
| ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION |
+-----------------------------------------------------------------------------------------------------------------------+

The above two queries return the same since we haven't modified our modes

## How do we change the modes?

Let's alter the session mode to remove division by zero, and to remove it we just omit it

SET SESSION sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION'

Now we can divide by zero without any errors 
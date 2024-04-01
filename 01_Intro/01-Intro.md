# Create database 

Initialize terminal SQL:

```
mysql -u root -p
```

### FOR THE COURSE:
```
mysql -u luke -p
```

TO SHOW DATABASES: 

SHOW DATABASES;

To create a database use the command: 

CREATE DATABASE soapdatabase;
or 
CREATE DATABASE databasename;

To delete a database run: 

DROP DATABASE soapdatabase;

To use a database, use this command:

USE <database name>;

USE soapdatabase;

```
(luke@localhost) [(none)]> USE chicken_coop
Database changed
(luke@localhost) [chicken_coop]>
```

To confirm, even though it has [database name] use the following command:

SELECT database();

```
(luke@localhost) [chicken_coop]> SELECT database();
+--------------+
| database()   |
+--------------+
| chicken_coop |
+--------------+
1 row in set (0.00 sec)

```
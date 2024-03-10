# MySQL Basics 

First we'll fire up mySQL in the terminal using this command 
```
mysql -u username -p
```
```
Enter password:
```

After successfully logging in press ctrl + l to clear the screen and you should see the following: (luke@localhost) [(none)]> 

Then type the command:

```
show databases;
```
```
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.02 sec)

```
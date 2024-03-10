# Tables 

So far we've created, and deleted empty databases, we now need to start adding things to them, tables are at the heart of SQL 

A relational database is made up of many tables, all SQL databases essentially use tables to help store data

Every table has headings, or columns, for example maybe it's three columns for a cat database, and the rows contain the data for each corresponding header or column:

Name Breed Age
Blue Tabby 7
Rocket Persian 10
Monty Scottish Fold 3 

## Tables Pt. 2 Data Types

When defining the structure of a table, you'll often denote the data type for said peice of data, boolean, string, integer etc.. 

For example, if a user enters a string for age above:

Rocket Persian Ten

This is going to cause some issues if that data needs to incremented or altered in any way that requires integer operations 

We can define the data types to be strict, name must be string, breed must be string, age must be an integer

But also note there are a lot of different datatypes under Numeric, String, and other data types. 

Don't memorize everything below, many of them you'll learn as you practice more SQL, just know for now that they exist.

### Numeric:
- INT 
- SMALLINT
- TINYINT
- MEDIUMINT
- BIGINT
- DECIMAL
- NUMERIC
- FLOAT 
- DOUBLE 
- BIT

### String:
- CHAR
- VARCHAR
- BINARY
- VARBINARY
- BLOB
- TINYBLOB 
- MEDIUMBLOB 
- LONGBLOB
- TEXT
- TINYTEXT 
- MEDIUMTEXT
- LONGTEXT 
- ENUM

### Date:
- DATE
- DATETIME
- TIMESTAMP
- TIME 
- YEAR
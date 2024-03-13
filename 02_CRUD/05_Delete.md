# Delete

The final piece of the CRUD 

Ensure specificity of deletion like:
```
DELETE FROM cats WHERE name='Egg';

```
Otherwise something like 
```
DELETE FROM cats;
```
That command will delete all the data in the cats table, the table basically resets to when you first created it without inserting any data, which usually you don't want to do.

-- Delete all cats with name of 'Egg':

DELETE FROM cats WHERE name='Egg';

-- Delete all rows in the cats table:

DELETE FROM cats;

-- Delete all 4 year old cats:

DELETE FROM cats WHERE age=4;
-- Delete cats where cat_id is the same as their age:

DELETE FROM cats WHERE cat_id=age;

-- Delete all cats:

DELETE FROM cats;
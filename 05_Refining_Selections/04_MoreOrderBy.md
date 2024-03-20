# More on order by 

Often you'll see a number included directly after the order by statement:

SELECT title, author_fname, author_lname FROM books ORDER BY 2;

It's basically a shorthand for order by the second column selected, if you had three our four columns, you pass in 3 for order by col 3 etc.. 

Often it's an easier way to sort, especially if column names are long, but passing in the name of the column to sort by instead is more direct and informative as a query


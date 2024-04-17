# Intro to Window Functions

Let's explain using an example

+---------------+-----+------------+--------+
| emp_no        | department       | salary |
+---------------+-----+------------+--------+
| 8             | sales            | 59000  |
| 12            | sales            | 60000  |
| 20            | customer service | 56000  |
| 21            | customer service | 55000  |
+---------------+------------------+--------+

We've seen average before, we could calculate the average salary for employees in the sales department, but window functions include some new keywords and syntax  

SELECT emp_no, department, salary,
       AVG(salary) OVER(PARTITION BY department)
       AS dept_avg 
       FROM emps;

We get OVER function, and the PARTITION keyword 

And what this does is give us two partitions or WINDOWS, we get a 'sales' window, and a 'customer service' window 

But when we execute that query 

+---------------+-----+------------+--------+------------+
| emp_no        | department       | salary | dept_avg   |
+---------------+-----+------------+--------+------------+
| 8             | sales            | 59000  | 55000.0000 |
| 12            | sales            | 60000  | 55000.0000 |
| 20            | customer service | 56000  | 59500.0000 |
| 21            | customer service | 55000  | 59500.0000 |
+---------------+------------------+--------+------------+

The main difference between this an GROUP BY, is that this returns the dept_avg for every row, if we used GROUP BY it would collapse each of the dept rows into 1 final avg for that dept
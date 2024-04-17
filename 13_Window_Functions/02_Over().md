# OVER()

The OVER() clause creates a window, and when it's empty parentheses() with no arguments after an aggregrate function like AVG or SUM, it will include all records 

SELECT department, AVG(salary) FROM employees
GROUP BY department;

+------------------+-------------+
| department       | AVG(salary) |
+------------------+-------------+
| engineering      |  81285.7143 |
| sales            |  77428.5714 |
| customer service |  46571.4286 |
+------------------+-------------+

The above is the quickest way to get a boiled down average salary for every department

But let's use OVER()

+------------------+--------------------+
| department       | AVG(salary) OVER() |
+------------------+--------------------+
| engineering      |         68428.5714 |
| engineering      |         68428.5714 |
| engineering      |         68428.5714 |
| engineering      |         68428.5714 |
| engineering      |         68428.5714 |
| engineering      |         68428.5714 |
| engineering      |         68428.5714 |
| sales            |         68428.5714 |
| sales            |         68428.5714 |
| sales            |         68428.5714 |
| sales            |         68428.5714 |
| sales            |         68428.5714 |
| sales            |         68428.5714 |
| sales            |         68428.5714 |
| customer service |         68428.5714 |
| customer service |         68428.5714 |
| customer service |         68428.5714 |
| customer service |         68428.5714 |
| customer service |         68428.5714 |
| customer service |         68428.5714 |
| customer service |         68428.5714 |
+------------------+--------------------+


Now using empty parentheses includes the average salary for all rows, but this is the average across all departments

SELECT emp_no, department, salary, AVG(salary) OVER()
FROM employees;

+--------+------------------+--------+--------------------+
| emp_no | department       | salary | AVG(salary) OVER() |
+--------+------------------+--------+--------------------+
|      1 | engineering      |  80000 |         68428.5714 |
|      2 | engineering      |  69000 |         68428.5714 |
|      3 | engineering      |  70000 |         68428.5714 |
|      4 | engineering      | 103000 |         68428.5714 |
|      5 | engineering      |  67000 |         68428.5714 |
|      6 | engineering      |  89000 |         68428.5714 |
|      7 | engineering      |  91000 |         68428.5714 |
|      8 | sales            |  59000 |         68428.5714 |
|      9 | sales            |  70000 |         68428.5714 |
|     10 | sales            | 159000 |         68428.5714 |
|     11 | sales            |  72000 |         68428.5714 |
|     12 | sales            |  60000 |         68428.5714 |
|     13 | sales            |  61000 |         68428.5714 |
|     14 | sales            |  61000 |         68428.5714 |
|     15 | customer service |  38000 |         68428.5714 |
|     16 | customer service |  45000 |         68428.5714 |
|     17 | customer service |  61000 |         68428.5714 |
|     18 | customer service |  40000 |         68428.5714 |
|     19 | customer service |  31000 |         68428.5714 |
|     20 | customer service |  56000 |         68428.5714 |
|     21 | customer service |  55000 |         68428.5714 |
+--------+------------------+--------+--------------------+

SELECT 
    emp_no,
    department,
    salary,
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;

+--------+------------------+--------+--------------------+--------------------+
| emp_no | department       | salary | MIN(salary) OVER() | MAX(salary) OVER() |
+--------+------------------+--------+--------------------+--------------------+
|      1 | engineering      |  80000 |              31000 |             159000 |
|      2 | engineering      |  69000 |              31000 |             159000 |
|      3 | engineering      |  70000 |              31000 |             159000 |
|      4 | engineering      | 103000 |              31000 |             159000 |
|      5 | engineering      |  67000 |              31000 |             159000 |
|      6 | engineering      |  89000 |              31000 |             159000 |
|      7 | engineering      |  91000 |              31000 |             159000 |
|      8 | sales            |  59000 |              31000 |             159000 |
|      9 | sales            |  70000 |              31000 |             159000 |
|     10 | sales            | 159000 |              31000 |             159000 |
|     11 | sales            |  72000 |              31000 |             159000 |
|     12 | sales            |  60000 |              31000 |             159000 |
|     13 | sales            |  61000 |              31000 |             159000 |
|     14 | sales            |  61000 |              31000 |             159000 |
|     15 | customer service |  38000 |              31000 |             159000 |
|     16 | customer service |  45000 |              31000 |             159000 |
|     17 | customer service |  61000 |              31000 |             159000 |
|     18 | customer service |  40000 |              31000 |             159000 |
|     19 | customer service |  31000 |              31000 |             159000 |
|     20 | customer service |  56000 |              31000 |             159000 |
|     21 | customer service |  55000 |              31000 |             159000 |
+--------+------------------+--------+--------------------+--------------------+

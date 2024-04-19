# LEAD and LAG

SELECT 
    emp_no,
    department,
    salary,
    LAG(salary) OVER(ORDER BY salary DESC)
FROM employees;

+--------+------------------+--------+----------------------------------------+
| emp_no | department       | salary | LAG(salary) OVER(ORDER BY salary DESC) |
+--------+------------------+--------+----------------------------------------+
|     10 | sales            | 159000 |                                   NULL |
|      4 | engineering      | 103000 |                                 159000 |
|      7 | engineering      |  91000 |                                 103000 |
|      6 | engineering      |  89000 |                                  91000 |
|      1 | engineering      |  80000 |                                  89000 |
|     11 | sales            |  72000 |                                  80000 |
|      3 | engineering      |  70000 |                                  72000 |
|      9 | sales            |  70000 |                                  70000 |
|      2 | engineering      |  69000 |                                  70000 |
|      5 | engineering      |  67000 |                                  69000 |
|     13 | sales            |  61000 |                                  67000 |
|     14 | sales            |  61000 |                                  61000 |
|     17 | customer service |  61000 |                                  61000 |
|     12 | sales            |  60000 |                                  61000 |
|      8 | sales            |  59000 |                                  60000 |
|     20 | customer service |  56000 |                                  59000 |
|     21 | customer service |  55000 |                                  56000 |
|     16 | customer service |  45000 |                                  55000 |
|     18 | customer service |  40000 |                                  45000 |
|     15 | customer service |  38000 |                                  40000 |
|     19 | customer service |  31000 |                                  38000 |
+--------+------------------+--------+----------------------------------------+

LAG will return the previous value specified in the expression, above we see null since 159000 is the highest, there is not a value higher than that, so we get null, but all the way down notice for each row the previous salary value is listed for each emp_no 

### Might not sound useful on it's own but we could calculate the difference 

SELECT 
    emp_no,
    department,
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as subtracted_salary_diff
FROM employees;

+--------+------------------+--------+------------------------+
| emp_no | department       | salary | subtracted_salary_diff |
+--------+------------------+--------+------------------------+
|     10 | sales            | 159000 |                   NULL |
|      4 | engineering      | 103000 |                 -56000 |
|      7 | engineering      |  91000 |                 -12000 |
|      6 | engineering      |  89000 |                  -2000 |
|      1 | engineering      |  80000 |                  -9000 |
|     11 | sales            |  72000 |                  -8000 |
|      3 | engineering      |  70000 |                  -2000 |
|      9 | sales            |  70000 |                      0 |
|      2 | engineering      |  69000 |                  -1000 |
|      5 | engineering      |  67000 |                  -2000 |
|     13 | sales            |  61000 |                  -6000 |
|     14 | sales            |  61000 |                      0 |
|     17 | customer service |  61000 |                      0 |
|     12 | sales            |  60000 |                  -1000 |
|      8 | sales            |  59000 |                  -1000 |
|     20 | customer service |  56000 |                  -3000 |
|     21 | customer service |  55000 |                  -1000 |
|     16 | customer service |  45000 |                 -10000 |
|     18 | customer service |  40000 |                  -5000 |
|     15 | customer service |  38000 |                  -2000 |
|     19 | customer service |  31000 |                  -7000 |
+--------+------------------+--------+------------------------+

Now we see that there's a 56000 difference between emp_no 10 from sales and emp_no 4 from engineering

## LEAD 

SELECT 
    emp_no,
    department,
    salary,
    salary - LEAD(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;

+--------+------------------+--------+------------------------+
| emp_no | department       | salary | salary_diff            |
+--------+------------------+--------+------------------------+
|     10 | sales            | 159000 |                  56000 |
|      4 | engineering      | 103000 |                  12000 |
|      7 | engineering      |  91000 |                   2000 |
|      6 | engineering      |  89000 |                   9000 |
|      1 | engineering      |  80000 |                   8000 |
|     11 | sales            |  72000 |                   2000 |
|      3 | engineering      |  70000 |                      0 |
|      9 | sales            |  70000 |                   1000 |
|      2 | engineering      |  69000 |                   2000 |
|      5 | engineering      |  67000 |                   6000 |
|     13 | sales            |  61000 |                      0 |
|     14 | sales            |  61000 |                      0 |
|     17 | customer service |  61000 |                   1000 |
|     12 | sales            |  60000 |                   1000 |
|      8 | sales            |  59000 |                   3000 |
|     20 | customer service |  56000 |                   1000 |
|     21 | customer service |  55000 |                  10000 |
|     16 | customer service |  45000 |                   5000 |
|     18 | customer service |  40000 |                   2000 |
|     15 | customer service |  38000 |                   7000 |
|     19 | customer service |  31000 |                   NULL |
+--------+------------------+--------+------------------------+

### With PARTITION:

SELECT 
    emp_no,
    department,
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dep_salary_diff
FROM employees;

+--------+------------------+--------+-----------------+
| emp_no | department       | salary | dep_salary_diff |
+--------+------------------+--------+-----------------+
|     17 | customer service |  61000 |            NULL |
|     20 | customer service |  56000 |           -5000 |
|     21 | customer service |  55000 |           -1000 |
|     16 | customer service |  45000 |          -10000 |
|     18 | customer service |  40000 |           -5000 |
|     15 | customer service |  38000 |           -2000 |
|     19 | customer service |  31000 |           -7000 |
|      4 | engineering      | 103000 |            NULL |
|      7 | engineering      |  91000 |          -12000 |
|      6 | engineering      |  89000 |           -2000 |
|      1 | engineering      |  80000 |           -9000 |
|      3 | engineering      |  70000 |          -10000 |
|      2 | engineering      |  69000 |           -1000 |
|      5 | engineering      |  67000 |           -2000 |
|     10 | sales            | 159000 |            NULL |
|     11 | sales            |  72000 |          -87000 |
|      9 | sales            |  70000 |           -2000 |
|     14 | sales            |  61000 |           -9000 |
|     13 | sales            |  61000 |               0 |
|     12 | sales            |  60000 |           -1000 |
|      8 | sales            |  59000 |           -1000 |
+--------+------------------+--------+-----------------+

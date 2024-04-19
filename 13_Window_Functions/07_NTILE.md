# NTILE 

NTILE is another window function used to divide salarie into quartiles, and look at where each salary falls 

NTILE(N) takes in a parameter N, which is the number of buckets the values will be sorted into

SELECT 
    emp_no,
    department,
    salary,
    NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees ORDER BY department, salary;

+--------+------------------+--------+-----------------+
| emp_no | department       | salary | salary_quartile |
+--------+------------------+--------+-----------------+
|     19 | customer service |  31000 |               4 |
|     15 | customer service |  38000 |               4 |
|     18 | customer service |  40000 |               4 |
|     16 | customer service |  45000 |               4 |
|     21 | customer service |  55000 |               4 |
|     20 | customer service |  56000 |               3 |
|     17 | customer service |  61000 |               3 |
|      5 | engineering      |  67000 |               2 |
|      2 | engineering      |  69000 |               2 |
|      3 | engineering      |  70000 |               2 |
|      1 | engineering      |  80000 |               1 |
|      6 | engineering      |  89000 |               1 |
|      7 | engineering      |  91000 |               1 |
|      4 | engineering      | 103000 |               1 |
|      8 | sales            |  59000 |               3 |
|     12 | sales            |  60000 |               3 |
|     14 | sales            |  61000 |               3 |
|     13 | sales            |  61000 |               2 |
|      9 | sales            |  70000 |               2 |
|     11 | sales            |  72000 |               1 |
|     10 | sales            | 159000 |               1 |
+--------+------------------+--------+-----------------+

## We can also partition:

SELECT 
    emp_no,
    department,
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
    NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees ORDER BY department, salary;

+--------+------------------+--------+----------------------+-----------------+
| emp_no | department       | salary | dept_salary_quartile | salary_quartile |
+--------+------------------+--------+----------------------+-----------------+
|     19 | customer service |  31000 |                    4 |               4 |
|     15 | customer service |  38000 |                    3 |               4 |
|     18 | customer service |  40000 |                    3 |               4 |
|     16 | customer service |  45000 |                    2 |               4 |
|     21 | customer service |  55000 |                    2 |               4 |
|     20 | customer service |  56000 |                    1 |               3 |
|     17 | customer service |  61000 |                    1 |               2 |
|      5 | engineering      |  67000 |                    4 |               2 |
|      2 | engineering      |  69000 |                    3 |               2 |
|      3 | engineering      |  70000 |                    3 |               2 |
|      1 | engineering      |  80000 |                    2 |               1 |
|      6 | engineering      |  89000 |                    2 |               1 |
|      7 | engineering      |  91000 |                    1 |               1 |
|      4 | engineering      | 103000 |                    1 |               1 |
|      8 | sales            |  59000 |                    4 |               3 |
|     12 | sales            |  60000 |                    3 |               3 |
|     13 | sales            |  61000 |                    3 |               3 |
|     14 | sales            |  61000 |                    2 |               3 |
|      9 | sales            |  70000 |                    2 |               2 |
|     11 | sales            |  72000 |                    1 |               1 |
|     10 | sales            | 159000 |                    1 |               1 |
+--------+------------------+--------+----------------------+-----------------+

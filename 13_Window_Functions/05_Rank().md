# RANK() Window Function 

Rank returns the rank of the current row within it's partition, it's a function that will only work with OVER


Let's look at an exampla

SELECT emp_no,
       department,
       salary,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_rank,
       RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees;

+--------+------------------+--------+------------------+---------------------+
| emp_no | department       | salary | dept_salary_rank | overall_salary_rank |
+--------+------------------+--------+------------------+---------------------+
|     10 | sales            | 159000 |                1 |                   1 |
|      4 | engineering      | 103000 |                1 |                   2 |
|      7 | engineering      |  91000 |                2 |                   3 |
|      6 | engineering      |  89000 |                3 |                   4 |
|      1 | engineering      |  80000 |                4 |                   5 |
|     11 | sales            |  72000 |                2 |                   6 |
|      9 | sales            |  70000 |                3 |                   7 |
|      3 | engineering      |  70000 |                5 |                   7 |
|      2 | engineering      |  69000 |                6 |                   9 |
|      5 | engineering      |  67000 |                7 |                  10 |
|     17 | customer service |  61000 |                1 |                  11 |
|     13 | sales            |  61000 |                4 |                  11 |
|     14 | sales            |  61000 |                4 |                  11 |
|     12 | sales            |  60000 |                6 |                  14 |
|      8 | sales            |  59000 |                7 |                  15 |
|     20 | customer service |  56000 |                2 |                  16 |
|     21 | customer service |  55000 |                3 |                  17 |
|     16 | customer service |  45000 |                4 |                  18 |
|     18 | customer service |  40000 |                5 |                  19 |
|     15 | customer service |  38000 |                6 |                  20 |
|     19 | customer service |  31000 |                7 |                  21 |
+--------+------------------+--------+------------------+---------------------+

## Above we now have ranks for each department, and overall salary rank


## With ORDER BY department as well:
SELECT emp_no,
       department,
       salary,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_rank,
       RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees ORDER BY department;

+--------+------------------+--------+------------------+---------------------+
| emp_no | department       | salary | dept_salary_rank | overall_salary_rank |
+--------+------------------+--------+------------------+---------------------+
|     17 | customer service |  61000 |                1 |                  11 |
|     19 | customer service |  31000 |                7 |                  21 |
|     15 | customer service |  38000 |                6 |                  20 |
|     18 | customer service |  40000 |                5 |                  19 |
|     16 | customer service |  45000 |                4 |                  18 |
|     21 | customer service |  55000 |                3 |                  17 |
|     20 | customer service |  56000 |                2 |                  16 |
|      3 | engineering      |  70000 |                5 |                   7 |
|      2 | engineering      |  69000 |                6 |                   9 |
|      5 | engineering      |  67000 |                7 |                  10 |
|      1 | engineering      |  80000 |                4 |                   5 |
|      6 | engineering      |  89000 |                3 |                   4 |
|      7 | engineering      |  91000 |                2 |                   3 |
|      4 | engineering      | 103000 |                1 |                   2 |
|     10 | sales            | 159000 |                1 |                   1 |
|     13 | sales            |  61000 |                4 |                  11 |
|     14 | sales            |  61000 |                4 |                  11 |
|     12 | sales            |  60000 |                6 |                  14 |
|      8 | sales            |  59000 |                7 |                  15 |
|      9 | sales            |  70000 |                3 |                   7 |
|     11 | sales            |  72000 |                2 |                   6 |
+--------+------------------+--------+------------------+---------------------+

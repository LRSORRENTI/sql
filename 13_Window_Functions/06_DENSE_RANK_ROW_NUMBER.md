# DENSE_RANK() and ROW_NUMBER()

When using RANK(), if multiple values are the same it results in a tie, meaning two salaries that match would have the same rank

## Let's try the query from last section, but use ROW_NUMBER

SELECT emp_no,
       department,
       salary,
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) as dept_row_number,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_rank,
       RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees ORDER BY department;

+--------+------------------+--------+-----------------+------------------+---------------------+
| emp_no | department       | salary | dept_row_number | dept_salary_rank | overall_salary_rank |
+--------+------------------+--------+-----------------+------------------+---------------------+
|     17 | customer service |  61000 |               1 |                1 |                  11 |
|     19 | customer service |  31000 |               7 |                7 |                  21 |
|     15 | customer service |  38000 |               6 |                6 |                  20 |
|     18 | customer service |  40000 |               5 |                5 |                  19 |
|     16 | customer service |  45000 |               4 |                4 |                  18 |
|     21 | customer service |  55000 |               3 |                3 |                  17 |
|     20 | customer service |  56000 |               2 |                2 |                  16 |
|      3 | engineering      |  70000 |               5 |                5 |                   7 |
|      2 | engineering      |  69000 |               6 |                6 |                   9 |
|      5 | engineering      |  67000 |               7 |                7 |                  10 |
|      1 | engineering      |  80000 |               4 |                4 |                   5 |
|      6 | engineering      |  89000 |               3 |                3 |                   4 |
|      7 | engineering      |  91000 |               2 |                2 |                   3 |
|      4 | engineering      | 103000 |               1 |                1 |                   2 |
|     10 | sales            | 159000 |               1 |                1 |                   1 |
|     13 | sales            |  61000 |               5 |                4 |                  11 |
|     14 | sales            |  61000 |               4 |                4 |                  11 |
|     12 | sales            |  60000 |               6 |                6 |                  14 |
|      8 | sales            |  59000 |               7 |                7 |                  15 |
|      9 | sales            |  70000 |               3 |                3 |                   7 |
|     11 | sales            |  72000 |               2 |                2 |                   6 |
+--------+------------------+--------+-----------------+------------------+---------------------+

### Now notice in the sales dept_row_number even though we have two employees that make 61000, they don't share a number like they do within dept_salary_rank


## DENSE RANK:

SELECT emp_no,
       department,
       salary,
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) as dept_row_number,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_rank,
       RANK() OVER(ORDER BY salary DESC) AS overall_rank,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS overall_dense_rank,
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS overall_num
FROM employees ORDER BY overall_rank;

+--------+------------------+--------+-----------------+------------------+--------------+--------------------+-------------+
| emp_no | department       | salary | dept_row_number | dept_salary_rank | overall_rank | overall_dense_rank | overall_num |
+--------+------------------+--------+-----------------+------------------+--------------+--------------------+-------------+
|     10 | sales            | 159000 |               1 |                1 |            1 |                  1 |           1 |
|      4 | engineering      | 103000 |               1 |                1 |            2 |                  2 |           2 |
|      7 | engineering      |  91000 |               2 |                2 |            3 |                  3 |           3 |
|      6 | engineering      |  89000 |               3 |                3 |            4 |                  4 |           4 |
|      1 | engineering      |  80000 |               4 |                4 |            5 |                  5 |           5 |
|     11 | sales            |  72000 |               2 |                2 |            6 |                  6 |           6 |
|      9 | sales            |  70000 |               3 |                3 |            7 |                  7 |           7 |
|      3 | engineering      |  70000 |               5 |                5 |            7 |                  7 |           8 |
|      2 | engineering      |  69000 |               6 |                6 |            9 |                  8 |           9 |
|      5 | engineering      |  67000 |               7 |                7 |           10 |                  9 |          10 |
|     17 | customer service |  61000 |               1 |                1 |           11 |                 10 |          11 |
|     14 | sales            |  61000 |               4 |                4 |           11 |                 10 |          13 |
|     13 | sales            |  61000 |               5 |                4 |           11 |                 10 |          12 |
|     12 | sales            |  60000 |               6 |                6 |           14 |                 11 |          14 |
|      8 | sales            |  59000 |               7 |                7 |           15 |                 12 |          15 |
|     20 | customer service |  56000 |               2 |                2 |           16 |                 13 |          16 |
|     21 | customer service |  55000 |               3 |                3 |           17 |                 14 |          17 |
|     16 | customer service |  45000 |               4 |                4 |           18 |                 15 |          18 |
|     18 | customer service |  40000 |               5 |                5 |           19 |                 16 |          19 |
|     15 | customer service |  38000 |               6 |                6 |           20 |                 17 |          20 |
|     19 | customer service |  31000 |               7 |                7 |           21 |                 18 |          21 |
+--------+------------------+--------+-----------------+------------------+--------------+--------------------+-------------+


### Above notice for our dense rank we get a tie at 7, and 10 so there are two 7 ranks, and three 10 ranks, but it doesn't skip to 9 like it does in overall_rank
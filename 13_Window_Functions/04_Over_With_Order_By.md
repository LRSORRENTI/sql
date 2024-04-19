# OVER and ORDER BY together

Use ORDER BY inside the OVER() clause to re-order rows within the window

OVER(ORDER BY salary DESC)

SELECT 
    emp_no,
    department,
    salary,
    SUM(salary) OVER(PARTITION BY department) AS dept_salary_total
FROM employees;

+--------+------------------+--------+-------------------+
| emp_no | department       | salary | dept_salary_total |
+--------+------------------+--------+-------------------+
|     21 | customer service |  55000 |            326000 |
|     20 | customer service |  56000 |            326000 |
|     19 | customer service |  31000 |            326000 |
|     18 | customer service |  40000 |            326000 |
|     17 | customer service |  61000 |            326000 |
|     16 | customer service |  45000 |            326000 |
|     15 | customer service |  38000 |            326000 |
|      2 | engineering      |  69000 |            569000 |
|      7 | engineering      |  91000 |            569000 |
|      6 | engineering      |  89000 |            569000 |
|      5 | engineering      |  67000 |            569000 |
|      4 | engineering      | 103000 |            569000 |
|      3 | engineering      |  70000 |            569000 |
|      1 | engineering      |  80000 |            569000 |
|      9 | sales            |  70000 |            542000 |
|     10 | sales            | 159000 |            542000 |
|     11 | sales            |  72000 |            542000 |
|     12 | sales            |  60000 |            542000 |
|     13 | sales            |  61000 |            542000 |
|     14 | sales            |  61000 |            542000 |
|      8 | sales            |  59000 |            542000 |
+--------+------------------+--------+-------------------+

SELECT 
    emp_no,
    department,
    salary,
    SUM(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS rolling_salary_total,
    SUM(salary) OVER(PARTITION BY department) AS dept_salary_total
FROM employees;

What tha above code does is break up the rows by department into three total windows because we have three unique departments within employees, then within each window it will order them by salary


+--------+------------------+--------+----------------------+-------------------+
| emp_no | department       | salary | rolling_salary_total | dept_salary_total |
+--------+------------------+--------+----------------------+-------------------+
|     20 | customer service |  56000 |               117000 |            326000 |
|     21 | customer service |  55000 |               172000 |            326000 |
|     16 | customer service |  45000 |               217000 |            326000 |
|     18 | customer service |  40000 |               257000 |            326000 |
|     15 | customer service |  38000 |               295000 |            326000 |
|     19 | customer service |  31000 |               326000 |            326000 |
|     17 | customer service |  61000 |                61000 |            326000 |
|      1 | engineering      |  80000 |               363000 |            569000 |
|      5 | engineering      |  67000 |               569000 |            569000 |
|      2 | engineering      |  69000 |               502000 |            569000 |
|      3 | engineering      |  70000 |               433000 |            569000 |
|      6 | engineering      |  89000 |               283000 |            569000 |
|      7 | engineering      |  91000 |               194000 |            569000 |
|      4 | engineering      | 103000 |               103000 |            569000 |
|     10 | sales            | 159000 |               159000 |            542000 |
|     11 | sales            |  72000 |               231000 |            542000 |
|      9 | sales            |  70000 |               301000 |            542000 |
|     14 | sales            |  61000 |               423000 |            542000 |
|     13 | sales            |  61000 |               423000 |            542000 |
|     12 | sales            |  60000 |               483000 |            542000 |
|      8 | sales            |  59000 |               542000 |            542000 |
+--------+------------------+--------+----------------------+-------------------+

WITHOUT DESC

+--------+------------------+--------+----------------------+-------------------+
| emp_no | department       | salary | rolling_salary_total | dept_salary_total |
+--------+------------------+--------+----------------------+-------------------+
|     15 | customer service |  38000 |                69000 |            326000 |
|     18 | customer service |  40000 |               109000 |            326000 |
|     16 | customer service |  45000 |               154000 |            326000 |
|     21 | customer service |  55000 |               209000 |            326000 |
|     20 | customer service |  56000 |               265000 |            326000 |
|     17 | customer service |  61000 |               326000 |            326000 |
|     19 | customer service |  31000 |                31000 |            326000 |
|      1 | engineering      |  80000 |               286000 |            569000 |
|      4 | engineering      | 103000 |               569000 |            569000 |
|      7 | engineering      |  91000 |               466000 |            569000 |
|      6 | engineering      |  89000 |               375000 |            569000 |
|      3 | engineering      |  70000 |               206000 |            569000 |
|      2 | engineering      |  69000 |               136000 |            569000 |
|      5 | engineering      |  67000 |                67000 |            569000 |
|      8 | sales            |  59000 |                59000 |            542000 |
|     12 | sales            |  60000 |               119000 |            542000 |
|     13 | sales            |  61000 |               241000 |            542000 |
|     14 | sales            |  61000 |               241000 |            542000 |
|      9 | sales            |  70000 |               311000 |            542000 |
|     11 | sales            |  72000 |               383000 |            542000 |
|     10 | sales            | 159000 |               542000 |            542000 |
+--------+------------------+--------+----------------------+-------------------+

SELECT
emp_no,
department,
salary,
MIN(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_min
FROM employees;

+--------+------------------+--------+-------------+
| emp_no | department       | salary | rolling_min |
+--------+------------------+--------+-------------+
|     19 | customer service |  31000 |       31000 |
|     15 | customer service |  38000 |       31000 |
|     18 | customer service |  40000 |       31000 |
|     16 | customer service |  45000 |       31000 |
|     21 | customer service |  55000 |       31000 |
|     20 | customer service |  56000 |       31000 |
|     17 | customer service |  61000 |       31000 |
|      5 | engineering      |  67000 |       67000 |
|      2 | engineering      |  69000 |       67000 |
|      3 | engineering      |  70000 |       67000 |
|      1 | engineering      |  80000 |       67000 |
|      6 | engineering      |  89000 |       67000 |
|      7 | engineering      |  91000 |       67000 |
|      4 | engineering      | 103000 |       67000 |
|      8 | sales            |  59000 |       59000 |
|     12 | sales            |  60000 |       59000 |
|     13 | sales            |  61000 |       59000 |
|     14 | sales            |  61000 |       59000 |
|      9 | sales            |  70000 |       59000 |
|     11 | sales            |  72000 |       59000 |
|     10 | sales            | 159000 |       59000 |
+--------+------------------+--------+-------------+
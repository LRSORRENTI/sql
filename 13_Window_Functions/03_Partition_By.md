# Partition By Clause

SELECT 
    emp_no,
    department,
    salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg
FROM employees
ORDER BY emp_no;

+--------+------------------+--------+------------+
| emp_no | department       | salary | dept_avg   |
+--------+------------------+--------+------------+
|      1 | engineering      |  80000 | 81285.7143 |
|      2 | engineering      |  69000 | 81285.7143 |
|      3 | engineering      |  70000 | 81285.7143 |
|      4 | engineering      | 103000 | 81285.7143 |
|      5 | engineering      |  67000 | 81285.7143 |
|      6 | engineering      |  89000 | 81285.7143 |
|      7 | engineering      |  91000 | 81285.7143 |
|      8 | sales            |  59000 | 77428.5714 |
|      9 | sales            |  70000 | 77428.5714 |
|     10 | sales            | 159000 | 77428.5714 |
|     11 | sales            |  72000 | 77428.5714 |
|     12 | sales            |  60000 | 77428.5714 |
|     13 | sales            |  61000 | 77428.5714 |
|     14 | sales            |  61000 | 77428.5714 |
|     15 | customer service |  38000 | 46571.4286 |
|     16 | customer service |  45000 | 46571.4286 |
|     17 | customer service |  61000 | 46571.4286 |
|     18 | customer service |  40000 | 46571.4286 |
|     19 | customer service |  31000 | 46571.4286 |
|     20 | customer service |  56000 | 46571.4286 |
|     21 | customer service |  55000 | 46571.4286 |
+--------+------------------+--------+------------+


Now we get the dept average for all of our employees 

SELECT 
    emp_no,
    department,
    salary,
    COUNT(*) OVER(PARTITION BY department) dept_emp_avg
FROM employees;

+--------+------------------+--------+--------------+
| emp_no | department       | salary | dept_emp_avg |
+--------+------------------+--------+--------------+
|     21 | customer service |  55000 |            7 |
|     20 | customer service |  56000 |            7 |
|     19 | customer service |  31000 |            7 |
|     18 | customer service |  40000 |            7 |
|     17 | customer service |  61000 |            7 |
|     16 | customer service |  45000 |            7 |
|     15 | customer service |  38000 |            7 |
|      2 | engineering      |  69000 |            7 |
|      7 | engineering      |  91000 |            7 |
|      6 | engineering      |  89000 |            7 |
|      5 | engineering      |  67000 |            7 |
|      4 | engineering      | 103000 |            7 |
|      3 | engineering      |  70000 |            7 |
|      1 | engineering      |  80000 |            7 |
|      9 | sales            |  70000 |            7 |
|     10 | sales            | 159000 |            7 |
|     11 | sales            |  72000 |            7 |
|     12 | sales            |  60000 |            7 |
|     13 | sales            |  61000 |            7 |
|     14 | sales            |  61000 |            7 |
|      8 | sales            |  59000 |            7 |
+--------+------------------+--------+--------------+

SELECT 
    emp_no,
    department,
    salary,
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;

+--------+------------------+--------+--------------+---------------+
| emp_no | department       | salary | dept_payroll | total_payroll |
+--------+------------------+--------+--------------+---------------+
|     21 | customer service |  55000 |       326000 |       1437000 |
|     20 | customer service |  56000 |       326000 |       1437000 |
|     19 | customer service |  31000 |       326000 |       1437000 |
|     18 | customer service |  40000 |       326000 |       1437000 |
|     17 | customer service |  61000 |       326000 |       1437000 |
|     16 | customer service |  45000 |       326000 |       1437000 |
|     15 | customer service |  38000 |       326000 |       1437000 |
|      2 | engineering      |  69000 |       569000 |       1437000 |
|      7 | engineering      |  91000 |       569000 |       1437000 |
|      6 | engineering      |  89000 |       569000 |       1437000 |
|      5 | engineering      |  67000 |       569000 |       1437000 |
|      4 | engineering      | 103000 |       569000 |       1437000 |
|      3 | engineering      |  70000 |       569000 |       1437000 |
|      1 | engineering      |  80000 |       569000 |       1437000 |
|      9 | sales            |  70000 |       542000 |       1437000 |
|     10 | sales            | 159000 |       542000 |       1437000 |
|     11 | sales            |  72000 |       542000 |       1437000 |
|     12 | sales            |  60000 |       542000 |       1437000 |
|     13 | sales            |  61000 |       542000 |       1437000 |
|     14 | sales            |  61000 |       542000 |       1437000 |
|      8 | sales            |  59000 |       542000 |       1437000 |
+--------+------------------+--------+--------------+---------------+

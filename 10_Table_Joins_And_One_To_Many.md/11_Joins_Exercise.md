# Joins Exercise 

1. Create two tables, students and papers. Students have an id and a first_name. Papers have a title, grade which is a number with a max of 100 for perfect grade, and student_id which is a foreign key linked to the id from students 

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50)
);

CREATE TABLE papers (
    title VARCHAR(50),
    grade INT CHECK (grade <= 110),
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id) 
);

Then insert the following data:

INSERT INTO students (first_name) 
VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade) 
VALUES
(1, 'My first book report', 60),
(1, 'My second book report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and the Art of Essay', 98),
(4, 'Borges and Magical Realism', 89);

Then print out the follwing, first_name, title, and grade joined together that has the first name, essay name and grade

SELECT first_name, title, grade FROM students
JOIN papers ON papers.student_id = students.id
ORDER BY first_name DESC, title ASC;

+------------+-----------------------------------+-------+
| first_name | title                             | grade |
+------------+-----------------------------------+-------+
| Samantha   | De Montaigne and the Art of Essay |    98 |
| Samantha   | Russian Lit Through The Ages      |    94 |
| Carlos     | Borges and Magical Realism        |    89 |
| Caleb      | My first book report              |    60 |
| Caleb      | My second book report             |    75 |
+------------+-----------------------------------+-------+

SELECT first_name, title, grade
FROM students 
LEFT JOIN papers ON papers.student_id = students.id;

+------------+-----------------------------------+-------+
| first_name | title                             | grade |
+------------+-----------------------------------+-------+
| Caleb      | My first book report              |    60 |
| Caleb      | My second book report             |    75 |
| Samantha   | Russian Lit Through The Ages      |    94 |
| Samantha   | De Montaigne and the Art of Essay |    98 |
| Raj        | NULL                              |  NULL |
| Carlos     | Borges and Magical Realism        |    89 |
| Lisa       | NULL                              |  NULL |
+------------+-----------------------------------+-------+

SELECT 
first_name,
IFNULL(title, 'MISSING') AS title,
IFNULL(grade, 0) AS grade
FROM students 
LEFT JOIN papers ON papers.student_id = students.id;

+------------+-----------------------------------+-------+
| first_name | title                             | grade |
+------------+-----------------------------------+-------+
| Caleb      | My first book report              |    60 |
| Caleb      | My second book report             |    75 |
| Samantha   | Russian Lit Through The Ages      |    94 |
| Samantha   | De Montaigne and the Art of Essay |    98 |
| Raj        | MISSING                           |     0 |
| Carlos     | Borges and Magical Realism        |    89 |
| Lisa       | MISSING                           |     0 |
+------------+-----------------------------------+-------+


SELECT 
students.first_name,
IFNULL(AVG(papers.grade), 0) AS average
FROM students
LEFT JOIN papers ON papers.student_id = students.id
GROUP BY students.first_name
ORDER BY average DESC;

+------------+---------+
| first_name | average |
+------------+---------+
| Samantha   | 96.0000 |
| Carlos     | 89.0000 |
| Caleb      | 67.5000 |
| Raj        |  0.0000 |
| Lisa       |  0.0000 |
+------------+---------+

SELECT students.first_name, 
    IFNULL(AVG(papers.grade), 0) AS average, 
    CASE 
        WHEN AVG(papers.grade) > 50 THEN 'PASSING'
        ELSE 'FAILING'
    END AS status
FROM students
LEFT JOIN papers ON papers.student_id = students.id
GROUP BY students.first_name
ORDER BY average DESC;

+------------+---------+---------+
| first_name | average | status  |
+------------+---------+---------+
| Samantha   | 96.0000 | PASSING |
| Carlos     | 89.0000 | PASSING |
| Caleb      | 67.5000 | PASSING |
| Raj        |  0.0000 | FAILING |
| Lisa       |  0.0000 | FAILING |
+------------+---------+---------+
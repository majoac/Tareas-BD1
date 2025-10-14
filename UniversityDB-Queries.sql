-- Query 1: Obtener el nombre y la identificación de todos los estudiantes en orden alfabético.
SELECT name, ID
FROM student
ORDER BY name;

-- Query 2: Obtener el nombre y DNI de los alumnos que tengan más de 59 créditos.
SELECT name, ID
FROM student
WHERE tot_cred > 59
ORDER BY tot_cred;

-- Query 3: Obtener el nombre y la identificación de los estudiantes del departamento de ciencias de la computación (Comp. Sci.) que tengan entre 50 y 100 créditos.
SELECT name, ID
FROM student
WHERE dept_name = 'Comp. Sci.' AND tot_cred BETWEEN 50 AND 100;

-- Query 4: Obtener todos los datos de los cursos ofrecidos en el departamento de biología.
SELECT *
FROM course
WHERE dept_name = 'Biology';

-- Query 5: Obtenga el nombre y la identificación de los cursos que tienen 4 créditos.
SELECT title, course_id
FROM course
WHERE credits = 4;

-- Query 6: Obtenga el nombre y la identificación de los cursos del departamento de biología o historia.
SELECT title, course_id
FROM course
WHERE dept_name IN ('Biology', 'History');

-- Query 7: Obtener los nombres de los departamentos que ofrecen cursos de 4 o 3 créditos.
SELECT DISTINCT dept_name
FROM course
WHERE credits IN (3, 4);

-- Query 8: Obtener los nombres de los departamentos que ofrecen cursos de 4 y 3 créditos.
SELECT dept_name
FROM course
WHERE credits IN (3, 4)
GROUP BY dept_name
HAVING COUNT(DISTINCT credits) = 2;

-- Query 9: Obtenga una lista de los cursos impartidos por cada instructor (nombre del instructor, ID del curso).
SELECT i.name, t.course_id
FROM instructor i
JOIN teaches t ON i.ID = t.ID;

-- Query 10: Obtenga una lista de los cursos, del semestre de otoño, impartidos por cada instructor (nombre del instructor, ID del curso).
SELECT i.name, t.course_id
FROM instructor i
JOIN teaches t ON i.ID = t.ID
WHERE t.semester = 'Fall';

-- Query 11: Obtenga una lista de cursos del semestre de primavera impartidos por instructores con un salario de menos de $80,000 (nombre del instructor, ID del curso).
SELECT i.name, t.course_id
FROM instructor i
JOIN teaches t ON i.ID = t.ID
WHERE t.semester = 'Spring' AND i.salary < 80000;

-- Query 12: Obtenga una lista de los cursos impartidos por cada instructor (nombre del instructor, nombre del curso), para instructores que tienen un salario entre $75,000 y $85,000.
SELECT i.name AS instructor_name, c.title AS course_name
FROM instructor i
JOIN teaches t ON i.ID = t.ID
JOIN course c ON t.course_id = c.course_id
WHERE i.salary BETWEEN 75000 AND 85000;

-- Query 13: Obtenga el nombre del estudiante y el nombre del curso de los estudiantes del departamento de ciencias de la computación que tomaron cursos en 2009.
SELECT s.name AS student_name, c.title AS course_name
FROM student s
JOIN takes t ON s.ID = t.ID
JOIN course c ON t.course_id = c.course_id
WHERE s.dept_name = 'Comp. Sci.' AND t.year = 2009;

-- Query 14: Obtenga una lista de los nombres de los estudiantes que tienen un asesor.
SELECT s.name
FROM student s
JOIN advisor a ON s.ID = a.s_ID;

-- Query 15: Obtenga una lista de los nombres de los estudiantes que no tienen un asesor.
SELECT s.name
FROM student s
LEFT JOIN advisor a ON s.ID = a.s_ID
WHERE a.i_ID IS NULL;

-- Query 16: Obtenga una lista con el nombre del estudiante y el nombre del asesor para estudiantes de biología.
SELECT s.name AS student_name, i.name AS advisor_name
FROM student s
JOIN advisor a ON s.ID = a.s_ID
JOIN instructor i ON a.i_ID = i.ID
WHERE s.dept_name = 'Biology';

-- Query 17: Mostrar las aulas asignadas al departamento de Biología.
SELECT building, room_number
FROM section
WHERE course_id IN (SELECT course_id FROM course WHERE dept_name = 'Biology');

-- Query 18: Obtener el número de cursos ofrecidos por cada departamento.
SELECT dept_name, COUNT(course_id) AS number_of_courses
FROM course
GROUP BY dept_name;

-- Query 19: Consigue el departamento con mayor presupuesto.
SELECT dept_name
FROM department
ORDER BY budget DESC
LIMIT 1;

-- Query 20: Obtener el salario promedio de los instructores.
SELECT AVG(salary) AS average_salary
FROM instructor;

-- Query 21: Obtenga instructores que tengan un salario superior al salario promedio.
SELECT name, salary
FROM instructor
WHERE salary > (SELECT AVG(salary) FROM instructor);

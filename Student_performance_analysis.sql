SELECT 
Students.first_name ,
Students.last_name ,
Courses.course_name ,
Grades.score 
FROM Grades
JOIN Students
ON Grades.student_id = Students.student_id 
JOIN Courses
ON Grades.course_id = Courses.course_id



SELECT
Students.first_name,
Students.last_name,
AVG (Grades.score) AS average_score
FROM Students
JOIN Grades
ON Students.student_id = Grades.student_id
GROUP BY 
Students.student_id,
Students.first_name,
students.last_name
ORDER BY average_score DESC



SELECT
Students.first_name,
Students.last_name,
AVG (Grades.score) AS average_score
FROM Students
JOIN Grades
ON Students.student_id = Grades.student_id
GROUP BY 
Students.student_id,
Students.first_name,
students.last_name
HAVING AVG(Grades.score) > 85
ORDER BY average_score DESC



SELECT 
Courses.course_name,
MAX(Grades.score) AS highest_score
FROM Courses
JOIN Grades 
ON Courses.course_id = Grades.course_id
GROUP BY Courses.course_id , Courses.course_name
ORDER BY highest_score DESC



SELECT
Courses.course_name,
AVG (Grades.score) AS average_score
FROM Courses
JOIN Grades
ON Courses.course_id = Grades.course_id
GROUP BY  Courses.course_id , Courses.course_name
ORDER BY average_score DESC



SELECT
Students.first_name,
Students.last_name,
ROUND(AVG(Grades.score), 2) AS average_score,
RANK() OVER (
ORDER BY AVG(Grades.score) DESC
) AS student_rank
FROM Students
JOIN Grades
ON Students.student_id = Grades.student_id
GROUP BY
Students.student_id,
Students.first_name,
Students.last_name
ORDER BY student_rank



SELECT
Students.first_name,
Students.last_name,
Courses.course_name,
Grades.score,
CASE
WHEN Grades.score >= 90 THEN 'Excellent'
WHEN Grades.score >= 80 THEN 'Good'
WHEN Grades.score >= 60 THEN 'Pass'
ELSE 'Needs Improvement'
END AS performance_level
FROM Grades
JOIN Students
ON Grades.student_id = Students.student_id
JOIN Courses
ON Grades.course_id = Courses.course_id
ORDER BY Grades.score DESC
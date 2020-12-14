--Find all students with a GPA above 3.50 for mailing list
SELECT CONCAT(Students.first_name,' ',Students.last_name) AS Student_name, Students.address, Students.city, Students.state, Students.zip, Students.country, Students.gpa
FROM Students
WHERE Students.gpa >= 3.50
ORDER BY Students.first_name;

--Find out who is an advisor
SELECT Employees.first_name, Employees.last_name, Employees.phone,Employees.email, College_Branchs.branch_name
FROM Employees
LEFT JOIN College_Branchs
ON Employees.branch_id = College_Branchs.branch_id
Where Employees.employee_id IN (
  SELECT Students.advisior_id
  FROM Students
);

--Find all of Tessa Rahilly's courses
SELECT Students.first_name, Students.last_name, All_Courses_Offered.course_id, All_Courses_Offered.section_id, Courses.course_name, Students_Courses.grade
FROM Students
INNER JOIN Students_Courses ON Students_Courses.student_id = Students.student_id
RIGHT JOIN All_Courses_Offered ON Students_Courses.offered_courses_id = All_Courses_Offered.offered_courses_id
INNER JOIN Courses ON All_Courses_Offered.course_id = Courses.course_id
WHERE Students.first_name = 'Tessa' AND Students.last_name = 'Rahilly';

--Find all of Tessa Rahilly's courses from 2013
SELECT Students.first_name, Students.last_name, All_Courses_Offered.course_id, All_Courses_Offered.section_id, Courses.course_name, Students_Courses.grade
FROM Students
INNER JOIN Students_Courses ON Students_Courses.student_id = Students.student_id
RIGHT JOIN All_Courses_Offered ON Students_Courses.offered_courses_id = All_Courses_Offered.offered_courses_id
INNER JOIN Courses ON All_Courses_Offered.course_id = Courses.course_id
WHERE Students.student_id = 1 AND All_Courses_Offered.term_year = 2013;

--Find all Employees that work for School of Art & Design
SELECT *
FROM Employees
WHERE branch_id = 2;

--Find all Open courses taught by Joe Galbreath
SELECT CONCAT(Employees.first_name,' ',Employees.last_name) AS professor_name, All_Courses_Offered.course_id, All_Courses_Offered.section_id, All_Courses_Offered.campus, All_Courses_Offered.building, All_Courses_Offered.room_number, All_Courses_Offered.days, All_Courses_Offered.start_time, All_Courses_Offered.end_time
FROM All_Courses_Offered
INNER JOIN Employees
ON All_Courses_Offered.employee_id = Employees.employee_id
Where Employees.employee_id = 9 AND All_Courses_Offered.status = 'Open';

--Find the All students taking a class from Joe Galbreath
SELECT Employees.first_name,Employees.last_name, All_Courses_Offered.offered_courses_id, All_Courses_Offered.course_id, All_Courses_Offered.section_id, Students.first_name, Students.last_name, Students.email
FROM All_Courses_Offered
INNER JOIN Employees
ON All_Courses_Offered.employee_id = Employees.employee_id
RIGHT JOIN Students_Courses
ON All_Courses_Offered.offered_courses_id = Students_Courses.offered_courses_id
INNER JOIN Students
ON Students_Courses.student_id = Students.student_id
Where Employees.employee_id = 9 AND All_Courses_Offered.status = 'Open'
ORDER BY All_Courses_Offered.course_id, Students.last_name;

--Find out how much money the college is paying for all its employees, seperate by sex
SELECT SUM(Employees.salary), Employees.sex
FROM Employees
GROUP BY Employees.sex;
--Find out the number of students that are taking or have taken the Graphic Design Major
SELECT COUNT(Students.student_id), Students.status
FROM Students
WHERE Students.major_id = 1
GROUP BY Students.status;
--Find all majors and minors for the School of Theatre & Dance
SELECT College_Branchs.branch_name, Majors.major_name, Minors.minor_name
FROM College_Branchs
LEFT JOIN Majors
ON College_Branchs.branch_id = Majors.branch_id
INNER JOIN Minors
ON College_Branchs.branch_id = Minors.branch_id
WHERE College_Branchs.branch_id = 4;

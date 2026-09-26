SELECT st.StudentName, co.CourseName, co.TeacherName, en.Progress, en.Grade
FROM Enrollments AS en
INNER JOIN Courses AS co ON en.CourseID = co.CourseID
INNER JOIN Students AS st ON en.StudentID = st.StudentID
WHERE co.Price >= 300.00
ORDER BY st.StudentName DESC

SELECT st.StudentName, co.CourseName, 100 - en.Progress AS [Remaining material],
en.Grade / 2 AS [Grade on a five-point system]
FROM Enrollments AS en
INNER JOIN Courses AS co ON en.CourseID = co.CourseID
INNER JOIN Students AS st ON en.StudentID = st.StudentID

SELECT st.StudentName, co.CourseName, en.Progress, en.Grade
FROM Students AS st
LEFT JOIN Enrollments AS en ON en.StudentID = st.StudentID
LEFT JOIN Courses AS co ON en.CourseID = co.CourseID

SELECT st.StudentName, co.CourseName, en.Progress, en.Grade
FROM Students AS st
LEFT JOIN Enrollments AS en ON en.StudentID = st.StudentID
RIGHT JOIN Courses AS co ON en.CourseID = co.CourseID

SELECT co.CourseName, COUNT(en. StudentID) AS StudentsCount
FROM Enrollments AS en
INNER JOIN Courses AS co ON en.CourseID = co.CourseID
GROUP BY co.CourseName
HAVING COUNT(en.StudentID) >= 2

INSERT INTO Courses VALUES ('Test', 'Test', 10 'Test', 10)

DELETE FROM Courses WHERE CourseName = 'Test'

UPDATE Courses
SET Price = Price * 2
WHERE Price < 100;

SELECT *
INTO NewStudents
FROM Students
WHERE RegistrationDate > '2026-03-01'

SELECT StudentName AS Name 'Student' AS Role
FROM Students
UNION
SELECT TeacherName AS Name 'Teacher' AS Role
FROM Courses

SELECT st.StudentName, st.Email
FROM Students AS st
WHERE st.StudentID IN (
	SELECT en.StudentID
	FROM Enrollments AS en
	WHERE en.CourseID = (
		SELECT TOP 1 co.CourseID
		FROM Courses AS co
		ORDER BY co.Price DESC
 	)
);


CREATE TABLE CourseCategories (
	CategoryID INT IDENTITY(1,1) PRIMARY KEY
	CategoryName NVARCHAR(100) NOT NULL UNIQUE,
	Description NVARCHAR(500),
	CreatedDate DATE DEFAULT GETDATE()
);


CREATE INDEX IX_Students_Email ON Students(Email);

CREATE VIEW vw_StudentCourses AS
SELECT
	st.StudentName,
	co.CourseName,
	en.EnrollmentDate,
	en.Progress
FROM Students AS st
INNER JOIN Enrollments AS en ON st.StudentID = en.StudentID
INNER JOIN Courses AS co ON en.CourseID = co.CourseID;
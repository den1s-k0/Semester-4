CREATE TABLE [Students] (
	[StudentID] int IDENTITY(1,1) NOT NULL UNIQUE,
	[StudentName] nvarchar(max) NOT NULL,
	[Email] nvarchar(max) NOT NULL UNIQUE,
	[TelegramName] nvarchar(max) UNIQUE,
	[PhoneNumber] nvarchar(max) NOT NULL UNIQUE,
	[RegistrationDate] date NOT NULL,
	PRIMARY KEY ([StudentID])
);

CREATE TABLE [Courses] (
	[CourseID] int IDENTITY(1,1) NOT NULL UNIQUE,
	[CourseName] nvarchar(max) NOT NULL,
	[TeacherName] nvarchar(max) NOT NULL,
	[Duration] int NOT NULL,
	[Subject] nvarchar(max) NOT NULL,
	[Price] int NOT NULL,
	PRIMARY KEY ([CourseID])
);

CREATE TABLE [Enrollments] (
	[EnrollmentID] int IDENTITY(1,1) NOT NULL UNIQUE,
	[StudentID] int NOT NULL,
	[CourseID] int NOT NULL,
	[EnrollmentDate] date NOT NULL,
	[Progress] int NOT NULL,
	[Grade] int,
	PRIMARY KEY ([EnrollmentID])
);



ALTER TABLE [Enrollments] ADD CONSTRAINT [Enrollments_fk1] FOREIGN KEY ([StudentID]) REFERENCES [Students]([StudentID]);

ALTER TABLE [Enrollments] ADD CONSTRAINT [Enrollments_fk2] FOREIGN KEY ([CourseID]) REFERENCES [Courses]([CourseID]);

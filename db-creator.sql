USE [testDB]
GO
/****** Object:  Table [dbo].[CourseRecords]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseRecords](
	[RecordID] [int] IDENTITY(100000,1) NOT NULL,
	[CourseID] [int] NULL,
	[StudentID] [int] NULL,
	[FacultyID] [int] NULL,
	[courseDate] [date] NULL,
	[studentGrade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(10000,10) NOT NULL,
	[CourseName] [varchar](255) NOT NULL,
	[CourseDesc] [varchar](max) NULL,
	[Credits] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[FacultyID] [int] IDENTITY(2000,1) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[birthDate] [date] NOT NULL,
	[emailAddress] [nvarchar](50) NOT NULL,
	[phoneNumber] [nvarchar](50) NOT NULL,
	[availableCourses] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[ID] [int] NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[FirstName] [varchar](255) NULL,
	[Age] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(5000,1) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[birthDate] [date] NOT NULL,
	[emailAddress] [nvarchar](50) NOT NULL,
	[phoneNumber] [nvarchar](50) NOT NULL,
	[availableCourses] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserActivation]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivation](
	[UserID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[AccessLevel] [int] NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[LastLoginDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddNewCourse]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewCourse] @name nvarchar(255), @desc nvarchar(max), @credits int
AS
BEGIN
INSERT INTO Courses(courseName, courseDesc, Credits)
VALUES (@name,@desc,@credits);
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewFaculty]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewFaculty] @fname nvarchar(50), @lname nvarchar(50), @dob date, @email nvarchar(50), @phone nvarchar(50)
AS
BEGIN
INSERT INTO Faculty(firstName, lastName, birthDate, emailAddress, phoneNumber)
VALUES (@fname,@lname,@dob,@email,@phone);
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewRecord]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewRecord] @cid int, @sid int, @fid int, @cdate date, @cgrade int
AS
BEGIN
INSERT INTO CourseRecords(CourseID,StudentID,FacultyID,courseDate,StudentGrade)
VALUES (@cid,@sid,@fid,@cdate,@cgrade);
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewStudent]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewStudent] @fname nvarchar(50), @lname nvarchar(50), @dob date, @email nvarchar(50), @phone nvarchar(50)  
AS
BEGIN
INSERT INTO Students(firstName, lastName, birthDate, emailAddress, phoneNumber)
VALUES (@fname,@lname,@dob,@email,@phone);
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewUser] @id int, @u nvarchar(20), @pw nvarchar(20), @a int, @e nvarchar(30), @cdate date
AS
BEGIN
INSERT INTO Users(UserID, Username, Password, AccessLevel, Email, CreatedDate)
VALUES (@id,@u,@pw,@a,@e,@cdate);
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCourseByID]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCourseByID] @id int
AS
BEGIN
DELETE FROM Courses WHERE CourseID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFacultyByID]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteFacultyByID] @id int
AS
BEGIN
DELETE FROM Faculty WHERE FacultyID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRecordByID]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRecordByID] @id int
AS
BEGIN
DELETE FROM CourseRecords WHERE RecordID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserByID]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUserByID] @id int
AS
BEGIN
DELETE FROM Users WHERE UserID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[getAccessLevel]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAccessLevel]
      @Username NVARCHAR(20)
AS
BEGIN
      SET NOCOUNT ON;
      SELECT AccessLevel
      FROM Users WHERE Username= @Username
     
END
GO
/****** Object:  StoredProcedure [dbo].[getUserID]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUserID]
      @Username NVARCHAR(20)
AS
BEGIN
      SET NOCOUNT ON;
      SELECT UserID
      FROM Users WHERE Username= @Username
     
END
GO
/****** Object:  StoredProcedure [dbo].[SelectCourseByID]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectCourseByID]

@ID int
AS
	BEGIN
	SELECT * FROM [dbo].[Courses]
	WHERE courseID = @ID
	END
GO
/****** Object:  StoredProcedure [dbo].[SelectFacultyByID]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectFacultyByID]

@facID nvarchar(50)
AS
	BEGIN
	SELECT * FROM [dbo].[Faculty]
	WHERE facultyID = @facID
	END
GO
/****** Object:  StoredProcedure [dbo].[selectRecordById]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectRecordById] @id int
AS
BEGIN


SELECT CourseRecords.RecordID, Courses.CourseID, Courses.CourseName, CourseRecords.CourseDate, CourseRecords.studentGrade, Students.StudentID, Students.firstName, Students.LastName, Faculty.FacultyID, Faculty.firstName AS FFirstName, Faculty.lastName AS FLastName
FROM CourseRecords
RIGHT JOIN Students ON CourseRecords.StudentID = Students.StudentID
RIGHT JOIN Courses ON CourseRecords.CourseID = Courses.CourseID
RIGHT JOIN Faculty ON CourseRecords.FacultyID = Faculty.FacultyID
WHERE CourseRecords.RecordID = @id



END
GO
/****** Object:  StoredProcedure [dbo].[SelectStudentByID]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectStudentByID]

@ID nvarchar(50)
AS
	BEGIN
	SELECT * FROM [dbo].[Students]
	WHERE studentID = @ID
	END
GO
/****** Object:  StoredProcedure [dbo].[SelectUserByID]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectUserByID]

@ID int
AS
	BEGIN
	SELECT * FROM [dbo].[Users]
	WHERE UserID = @ID
	END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCourse]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCourse]
@id int, @name nvarchar(255), @desc nvarchar(max), @credits int
AS
BEGIN
UPDATE Courses
SET courseName = @name, courseDesc = @desc, Credits = @credits
WHERE CourseID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateFaculty]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFaculty]
@id int, @fname nvarchar(50), @lname nvarchar(50), @dob date, @email nvarchar(50), @phone nvarchar(50)
AS
BEGIN
UPDATE Faculty
SET firstName = @fname, lastName = @lname, birthDate = @dob, emailAddress = @email, phoneNumber = @phone
WHERE FacultyID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRecord]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRecord]
@id int, @cid int, @sid int, @fid int, @cdate date, @cgrade int
AS
BEGIN
UPDATE CourseRecords
SET CourseID = @cid, StudentID = @sid, FacultyID = @fid, courseDate = @cdate, studentGrade = @cgrade
WHERE RecordID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStudent]
@id int, @fname nvarchar(50), @lname nvarchar(50), @dob date, @email nvarchar(50), @phone nvarchar(50)
AS
BEGIN
UPDATE Students
SET firstName = @fname, lastName = @lname, birthDate = @dob, emailAddress = @email, phoneNumber = @phone
WHERE StudentID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser]
@id int, @name nvarchar(20), @a int, @email nvarchar(30)
AS
BEGIN
UPDATE Users
SET Username = @name, AccessLevel = @a, Email = @email
WHERE UserID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserpassword]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUserpassword]
@id int, @pw nvarchar(20)
AS
BEGIN
UPDATE Users
SET Password = @pw
WHERE UserID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[Validate_Login]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Validate_Login]
      @Username NVARCHAR(20),
      @Password NVARCHAR(20)
AS
BEGIN
      SET NOCOUNT ON;
      DECLARE @UserId INT
     
      SELECT @UserId = UserId 
      FROM Users WHERE Username = @Username AND [Password] = @Password
     
      IF @UserId IS NOT NULL
      BEGIN
            SELECT @UserId [UserId] -- User Valid
      END
      ELSE
      BEGIN
            SELECT -1 -- User invalid.
      END
END
GO
/****** Object:  StoredProcedure [dbo].[Validate_User]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Validate_User]
      @Username NVARCHAR(20),
      @Password NVARCHAR(20)
AS
BEGIN
      SET NOCOUNT ON;
      DECLARE @UserId INT, @LastLoginDate DATETIME
     
      SELECT @UserId = 417, @LastLoginDate = LastLoginDate
      FROM Users WHERE Username = @Username AND [Password] = @Password
     
      IF @UserId IS NOT NULL
      BEGIN
            IF NOT EXISTS(SELECT UserId FROM UserActivation WHERE UserId = @UserId)
            BEGIN
                  UPDATE Users
                  SET LastLoginDate = GETDATE()
                  WHERE UserId = @UserId
                  SELECT @UserId [UserId] -- User Valid
            END
            ELSE
            BEGIN
                  SELECT -2 -- User not activated.
            END
      END
      ELSE
      BEGIN
            SELECT -1 -- User invalid.
      END
END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllCourses]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ViewAllCourses]
AS
BEGIN
Select * FROM Courses
END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllFaculty]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewAllFaculty]
AS
SELECT * FROM Faculty
GO
/****** Object:  StoredProcedure [dbo].[ViewAllRecords]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewAllRecords]
AS
BEGIN

SELECT CourseRecords.RecordID, CourseRecords.CourseID, Courses.CourseName, CourseRecords.StudentID, Students.FirstName AS FirstName, Students.LastName AS LastName, CourseRecords.FacultyID, Faculty.FirstName AS FFirstName, Faculty.LastName AS FLastName, CourseRecords.courseDate, CourseRecords.studentGrade

FROM CourseRecords, Courses, Students, Faculty

WHERE CourseRecords.StudentID = Students.StudentID AND CourseRecords.FacultyID = Faculty.FacultyID AND CourseRecords.CourseID = Courses.CourseID;

END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllStudents]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ViewAllStudents]
AS
BEGIN
Select * FROM Students
END
GO
/****** Object:  StoredProcedure [dbo].[ViewAllUsers]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ViewAllUsers]
AS
BEGIN
Select UserID, Username, AccessLevel, Email, CreatedDate, LastLoginDate FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[ViewRecordsByFacultyID]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ViewRecordsByFacultyID] @id int
AS
BEGIN
SELECT CourseRecords.RecordID, Courses.CourseID, Courses.CourseName, CourseRecords.CourseDate, CourseRecords.studentGrade, Students.StudentID, Students.firstName, Students.LastName, Faculty.FacultyID, Faculty.firstName AS FFirstName, Faculty.lastName AS FLastName
FROM CourseRecords
RIGHT JOIN Students ON CourseRecords.StudentID = Students.StudentID
RIGHT JOIN Courses ON CourseRecords.CourseID = Courses.CourseID
RIGHT JOIN Faculty ON CourseRecords.FacultyID = Faculty.FacultyID
WHERE CourseRecords.FacultyID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[ViewRecordsByStudentID]    Script Date: 5/10/2020 10:12:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewRecordsByStudentID] @sid int
AS
BEGIN

SELECT CourseRecords.RecordID, Courses.CourseID, Courses.CourseName, CourseRecords.CourseDate, CourseRecords.studentGrade, Students.StudentID, Students.firstName, Students.LastName, Faculty.FacultyID, Faculty.firstName AS FFirstName, Faculty.lastName AS FLastName
FROM CourseRecords
RIGHT JOIN Students ON CourseRecords.StudentID = Students.StudentID
RIGHT JOIN Courses ON CourseRecords.CourseID = Courses.CourseID
RIGHT JOIN Faculty ON CourseRecords.FacultyID = Faculty.FacultyID
WHERE CourseRecords.StudentID = @sid

END
GO

-- ---------------------------------------------- Database Queries -----------------------------------------------

-- create a database
CREATE DATABASE E_Learning_Platform;

-- to work on it, you need to use it first
USE E_Learning_Platform;

-- delete database
-- DROP DATABASE E_Learning_Platform;

-- ---------------------------------------- Database Analysis ----------------------------------------

/*
T1 : Students(StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID)

T2 : Teachers(TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status)

T3 : Courses(CourseID, CourseName, Description, Credits, Category, DurationWeeks, TeacherID, Level, Language, Status)

T4 : Enrollments(EnrollmentID, StudentID, CourseID, EnrollmentDate, Progress, CompletionDate, Grade, Feedback, Status, PaymentStatus)

T5 : Classes(ClassID, ClassName, Schedule, RoomNumber, Capacity, CourseID, TeacherID, Semester, StartDate, EndDate)

T6 : Assignments(AssignmentID, Title, Description, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status, AttachmentLink)

T7 : Submissions(SubmissionID, AssignmentID, StudentID, SubmissionDate, MarksObtained, Feedback, Status, FileLink, PlagiarismScore, LateSubmission)

T8 : Exams(ExamID, ExamName, Date, DurationMinutes, TotalMarks, CourseID, ClassID, Type, Status, ResultPublished)

T9 : Payments(PaymentID, StudentID, Amount, PaymentDate, PaymentMethod, Status, TransactionID, PaymentFor, ReceiptLink, Comments)

T10: DiscussionForum(PostID, StudentID, CourseID, Title, Content, PostDate, ReplyCount, LastReplyDate, Status, AttachmentLink)

*/

-- --------------------------------------- Table Related Queries ---------------------------------

-- Table 1: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    DateOfBirth DATE,
    Address VARCHAR(255),
    EnrollmentDate DATE,
    Status VARCHAR(20),
    ClassID INT
);

-- Insert 10 records into Students table
INSERT INTO Students (StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID) VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '9876543210', '2005-05-10', 'Delhi, India', '2023-06-01', 'Active', 101),
(2, 'Saanvi', 'Verma', 'saanvi.verma@example.com', '9876543211', '2004-11-23', 'Mumbai, India', '2023-06-02', 'Active', 101),
(3, 'Vivaan', 'Patel', 'vivaan.patel@example.com', '9876543212', '2006-01-15', 'Ahmedabad, India', '2023-06-03', 'Active', 102),
(4, 'Ananya', 'Singh', 'ananya.singh@example.com', '9876543213', '2005-08-30', 'Lucknow, India', '2023-06-04', 'Active', 102),
(5, 'Arjun', 'Rao', 'arjun.rao@example.com', '9876543214', '2005-03-18', 'Hyderabad, India', '2023-06-05', 'Active', 103),
(6, 'Ishaan', 'Nair', 'ishaan.nair@example.com', '9876543215', '2006-12-11', 'Kochi, India', '2023-06-06', 'Active', 103),
(7, 'Diya', 'Mishra', 'diya.mishra@example.com', '9876543216', '2004-07-09', 'Pune, India', '2023-06-07', 'Active', 104),
(8, 'Kabir', 'Joshi', 'kabir.joshi@example.com', '9876543217', '2005-02-20', 'Bengaluru, India', '2023-06-08', 'Active', 104),
(9, 'Myra', 'Kaur', 'myra.kaur@example.com', '9876543218', '2006-04-14', 'Chandigarh, India', '2023-06-09', 'Active', 105),
(10, 'Ayaan', 'Yadav', 'ayaan.yadav@example.com', '9876543219', '2005-09-25', 'Jaipur, India', '2023-06-10', 'Active', 105);

-- to display/retrieve table data
SELECT * FROM Students;

-- Select Queries 

-- 1. Select specific columns 
select StudentID, FirstName, LastName from Students;

-- 2. Select specific name from table 
select * from students where Firstname = 'Diya';

-- 3. Select students with containing specfic location 
select * from students where address LIKE '%Mumbai%';

-- 4. Count the number of students 
select count(*) AS total_students from Students;


-- Alter Queries

-- 1. add a new column
ALTER TABLE Students
ADD COLUMN marks int;

-- 2. Change the datatye of a existing column 
ALTER TABLE Students
MODIFY COLUMN EnrollmentDate datetime;

-- 3. Set the default value for a column 
ALTER TABLE Students
ALTER column status SET DEFAULT 'Active';

-- 4. Drop a column 
ALTER TABLE Students
DROP COLUMN Email;

-- 5. Rename a column 
ALTER TABLE Students
CHANGE COLUMN DateOfBirth DoB date;



-- Delete Queries 
SET SQL_SAFE_updates = 0;

-- 1. Delete a specific name
DELETE FROM Students
WHERE FIRSTNAME = 'Kabir';

-- 2. Delete records based on condition 
DELETE FROM Students
WHERE DoB > '2005-01-01';

-- 3. Delete records with specific names
DELETE FROM Students
WHERE Address = 'Mumbai, India';

-- 4. Delete all records 
DELETE from Students;

select * from Students;


drop table Students;


-- Rename Queries
-- 1. Rename the table name 
ALTER TABLE Students RENAME TO Student_Records;

-- 2. Rename the email cloumn 
ALTER TABLE Student_records RENAME COLUMN phone to phone_number;

-- 3. Rename the address column
ALTER TABLE Student_records rename column address to Student_address;

-- Update Queries 

-- 1. Update the phone number of a student
UPDATE Student_records
set phone_number = 9654128745
where FirstName = 'Ayaan';

-- 2. Update the address of a student
Update Student_records
SET Student_address = 'Rajasthan, India'
where firstname = 'Myra';

-- 3. Update the DoB of a student
UPDATE Student_records
set DoB = '2005-06-02'
where lastname = 'Joshi';

-- 4. Update the lastname of a student 
UPDATE Student_records
SET lastname = 'Dube'
where firstname = 'Aarav';

Select * from Student_records;


-- Table 2: Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Specialization VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2),
    Experience INT,
    Status VARCHAR(20)
);

INSERT INTO Teachers (TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status) VALUES
(1, 'Rajesh', 'Kumar', 'rajesh.kumar@example.com', '9998887770', 'Mathematics', '2015-01-15', 75000.00, 10, 'Active'),
(2, 'Anita', 'Desai', 'anita.desai@example.com', '9998887771', 'Science', '2016-02-20', 70000.00, 9, 'Active'),
(3, 'Sanjay', 'Gupta', 'sanjay.gupta@example.com', '9998887772', 'English', '2014-03-25', 80000.00, 11, 'Active'),
(4, 'Priya', 'Sharma', 'priya.sharma@example.com', '9998887773', 'History', '2017-04-30', 68000.00, 8, 'Active'),
(5, 'Rakesh', 'Mehta', 'rakesh.mehta@example.com', '9998887774', 'Geography', '2013-05-10', 85000.00, 12, 'Active'),
(6, 'Kavita', 'Singh', 'kavita.singh@example.com', '9998887775', 'Computer Science', '2018-06-15', 72000.00, 6, 'Active'),
(7, 'Ajay', 'Patel', 'ajay.patel@example.com', '9998887776', 'Physics', '2012-07-20', 90000.00, 13, 'Active'),
(8, 'Sunita', 'Nair', 'sunita.nair@example.com', '9998887777', 'Chemistry', '2019-08-25', 71000.00, 5, 'Active'),
(9, 'Vikram', 'Rao', 'vikram.rao@example.com', '9998887778', 'Economics', '2011-09-30', 95000.00, 14, 'Active'),
(10, 'Meena', 'Joshi', 'meena.joshi@example.com', '9998887779', 'Biology', '2020-10-05', 68000.00, 4, 'Active');

select * from teachers;

-- Select Queries 

-- 1. Select specific columns 
select TeacherID, FirstName, LastName from teachers;

-- 2. Select specific name from table 
select * from teachers where Firstname = 'Sanjay';

-- 3. Select teachers with containing specfic location 
select * from teachers where Specialization LIKE '%History%';

-- 4. Count the number of teachers 
select count(*) AS total_teachers from teachers;


-- ALTER QUERIES

-- 1. add a new column
ALTER TABLE teachers
ADD COLUMN Address varchar(100);

-- 2. Change the datatye of a existing column 
ALTER TABLE teachers
MODIFY COLUMN Salary DECIMAL(15,2) ;

-- 3. Set the default value for a column 
ALTER TABLE teachers
ALTER column status SET DEFAULT 'Active';

-- 4. Drop a column 
ALTER TABLE teachers
DROP COLUMN Phone;

-- 5. Rename a column 
ALTER TABLE teachers
CHANGE COLUMN HireDate Joining_date date;


-- Delete Queries 

-- 1. Delete a specific name
DELETE FROM teachers
WHERE FIRSTNAME = 'Anita';

-- 2. Delete records based on condition 
DELETE FROM teachers
WHERE Salary > 80000;

-- 3. Delete records with specific names
DELETE FROM teachers
WHERE Specialization = 'Geography';

-- 4. Delete all records 
DELETE from teachers;

drop table teachers;


-- Rename Queries
-- 1. Rename the table name 
ALTER TABLE teachers RENAME TO teacher_details;

-- 2. Rename the email cloumn 
ALTER TABLE teacher_details RENAME COLUMN email to email_id;

-- 3. Rename the address column
ALTER TABLE teacher_details rename column Specialization to expertise;


-- Update Queries 

-- 1. Update the email_id of a teacher
UPDATE teacher_details
set email_id = 'rajeshkumar@gmail.com'
where FirstName = 'Rajesh';

-- 2. Update the expertise of a tecaher
Update teacher_details
SET expertise = 'Drawing'
where firstname = 'Anita';

-- 3. Update the DoB of a teacher
UPDATE teacher_details
set Salary = 65000
where lastname = 'Gupta';

-- 4. Update the lastname of a teacher 
UPDATE teacher_details
SET lastname = 'Patil'
where firstname = 'Priya';


-- Table 3: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Description TEXT,
    Credits INT,
    Category VARCHAR(50),
    DurationWeeks INT,
    TeacherID INT,
    Level VARCHAR(20),
    Language VARCHAR(30),
    Status VARCHAR(20),
    FOREIGN KEY (TeacherID) REFERENCES teacher_details(TeacherID)
);

INSERT INTO Courses (CourseID, CourseName, Description, Credits, Category, DurationWeeks, TeacherID, Level, Language, Status) VALUES
(1, 'Mathematics 101', 'Introductory math course', 4, 'STEM', 12, 1, 'Beginner', 'English', 'Active'),
(2, 'Science Basics', 'Foundation in science', 3, 'STEM', 10, 2, 'Beginner', 'English', 'Active'),
(3, 'English Grammar', 'Grammar essentials', 2, 'Languages', 8, 3, 'Intermediate', 'English', 'Active'),
(4, 'World History', 'Global historical events', 3, 'Social Studies', 10, 4, 'Intermediate', 'English', 'Active'),
(5, 'Physical Geography', 'Earth’s features', 3, 'Social Studies', 10, 5, 'Intermediate', 'English', 'Active'),
(6, 'Python Programming', 'Basics of Python', 4, 'Computer Science', 12, 6, 'Beginner', 'English', 'Active'),
(7, 'Physics Concepts', 'Mechanics and waves', 4, 'STEM', 12, 7, 'Intermediate', 'English', 'Active'),
(8, 'Organic Chemistry', 'Carbon compounds', 4, 'STEM', 12, 8, 'Advanced', 'English', 'Active'),
(9, 'Macroeconomics', 'National economy', 3, 'Commerce', 10, 9, 'Advanced', 'English', 'Active'),
(10, 'Botany Basics', 'Plant biology', 3, 'Science', 10, 10, 'Beginner', 'English', 'Active');

select * from Courses;

-- Select Queries 

-- 1. Select specific columns 
select CourseID, CourseName from Courses;

-- 2. Select specific name from table 
select * from Courses where CourseName = 'English Grammar';

-- 3. Select courses with containing specfic location 
select * from Courses where Category LIKE '%Social Studies%';

-- 4. Count the number of courses 
select count(*) AS total_courses from Courses;


-- ALTER QUERIES

-- 1. add a new column
ALTER TABLE Courses
ADD COLUMN Teacher_name varchar(100);

-- 2. Change the datatye of a existing column 
ALTER TABLE Courses
MODIFY COLUMN description varchar(350) ;

-- 3. Set the default value for a column 
ALTER TABLE Courses
ALTER column level SET DEFAULT 'Beginner';

-- 4. Drop a column 
ALTER TABLE Courses
DROP COLUMN Credits;

-- 5. Rename a column 
ALTER TABLE Courses
CHANGE COLUMN Category Course_category varchar(25);


-- Delete Queries 

-- 1. Delete a specific name
DELETE FROM Courses
WHERE CourseName = 'Python Programming';

-- 2. Delete records based on condition 
DELETE FROM Courses
WHERE level = 'Intermediate';

-- 3. Delete records with specific names
DELETE FROM Courses
WHERE CourseName = 'Global Historical Events';

-- 4. Delete all records 
DELETE from Courses;

drop table Courses;


-- Rename Queries
-- 1. Rename the table name 
ALTER TABLE Courses RENAME TO Course_details;

-- 2. Rename the email cloumn 
ALTER TABLE Course_details RENAME COLUMN description to context;

-- 3. Rename the address column
ALTER TABLE Course_details rename column CourseName to Name_of_Course;


-- Update Queries 

-- 1. Update the name of a course
UPDATE Course_details
set context = 'Python full course'
where Name_of_Course = 'Python Programming';

-- 2. Update the duration of a course
Update Course_details
SET DurationWeeks = '10'
where Name_of_Course = 'Physical Geography';

-- 3. Update the TeacherID of a course
UPDATE Course_details
set TeacherID = 4
where Name_of_Course = 'Organic Chemistry';

-- 4. Update the Level of a course 
UPDATE Course_details
SET Level = 'Beginner'
where Name_of_Course = 'Science Basics';


-- Table 4: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Progress INT,
    CompletionDate DATE,
    Grade VARCHAR(5),
    Feedback TEXT,
    Status VARCHAR(20),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Student_records(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course_details(CourseID)
);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate, Progress, CompletionDate, Grade, Feedback, Status, PaymentStatus) VALUES
(1, 1, 1, '2023-06-01', 50, NULL, NULL, 'Doing well', 'In Progress', 'Paid'),
(2, 2, 1, '2023-06-02', 60, NULL, NULL, 'Excellent', 'In Progress', 'Paid'),
(3, 3, 2, '2023-06-03', 45, NULL, NULL, 'Needs improvement', 'In Progress', 'Pending'),
(4, 4, 3, '2023-06-04', 70, NULL, NULL, 'Great participation', 'In Progress', 'Paid'),
(5, 5, 4, '2023-06-05', 40, NULL, NULL, 'Struggling', 'In Progress', 'Paid'),
(6, 6, 5, '2023-06-06', 55, NULL, NULL, 'Average', 'In Progress', 'Paid'),
(7, 7, 6, '2023-06-07', 65, NULL, NULL, 'Above average', 'In Progress', 'Paid'),
(8, 8, 7, '2023-06-08', 35, NULL, NULL, 'Needs assistance', 'In Progress', 'Pending'),
(9, 9, 8, '2023-06-09', 80, NULL, NULL, 'Outstanding', 'In Progress', 'Paid'),
(10, 10, 9, '2023-06-10', 50, NULL, NULL, 'Good effort', 'In Progress', 'Paid');

select * from Enrollments;

-- Select Queries 

-- 1. Select specific Enrollments 
select EnrollmentID, StudentID, CourseID, EnrollmentDate from Enrollments;

-- 2. Select EnrollmentDate  from table 
select * from Enrollments where EnrollmentDate = '2023-06-03';

-- 3. Select enrollments with containing specfic word
select * from Enrollments where PaymentStatus LIKE '%Pending%';

-- 4. Count the number of Enrollments 
select count(*) AS total_enrollments from Enrollments;


-- ALTER QUERIES

-- 1. add a new column
ALTER TABLE Enrollments
ADD COLUMN clerk varchar(100);

-- 2. Change the datatype of a existing column 
ALTER TABLE Enrollments
MODIFY COLUMN  CompletionDate datetime;


-- 3. Set the default value for a column 
ALTER TABLE Enrollments
ALTER column Status SET DEFAULT 'In Progress';

-- 4. Drop a column 
ALTER TABLE Enrollments
DROP COLUMN CompletionDate;

-- 5. Rename a column 
ALTER TABLE Enrollments
CHANGE COLUMN EnrollmentDate addmission_date date;


-- Delete Queries 

-- 1. Delete a specific grade
DELETE FROM Enrollments
WHERE grade = 40;

-- 2. Delete records based on condition 
DELETE FROM Enrollments
WHERE StudentID = 5;

-- 3. Delete records with specific names
DELETE FROM Enrollments
WHERE Feedback = 'Struggling';

-- 4. Delete all records 
DELETE from Enrollments	;


drop table Enrollments;


-- Rename Queries
-- 1. Rename the table name 
ALTER TABLE Enrollments RENAME TO Enrollment_records;

-- 2. Rename the feedback cloumn 
ALTER TABLE Enrollment_records RENAME COLUMN Feedback to Opinion;

-- 3. Rename the payment_status column
ALTER TABLE Enrollment_records rename column paymentstatus to payment_details;


-- Update Queries 

-- 1. Update the student_id 
UPDATE Enrollment_records
set StudentID = 5
where  EnrollmentID = 4;

-- 2. Update the opinion 
Update Enrollment_records
SET opinion = 'excellent'
where EnrollmentID = 1;

-- 3. Update the payment_details 
UPDATE Enrollment_records
set payment_details = 'Paid'
where EnrollmentID = 8;

-- 4. Update the progress
UPDATE Enrollment_records
SET progress = 80
where EnrollmentID = 6;



-- Table 5: Classes
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    Schedule VARCHAR(50),
    RoomNumber VARCHAR(20),
    Capacity INT,
    CourseID INT,
    TeacherID INT,
    Semester VARCHAR(10),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CourseID) REFERENCES Course_details(CourseID),
    FOREIGN KEY (TeacherID) REFERENCES teacher_details(TeacherID)
);


INSERT INTO Classes (ClassID, ClassName, Schedule, RoomNumber, Capacity, CourseID, TeacherID, Semester, StartDate, EndDate) VALUES
(101, 'Math A', 'Mon-Wed 10am', 'R101', 30, 1, 1, '2023S1', '2023-06-01', '2023-08-31'),
(102, 'Science B', 'Tue-Thu 11am', 'R102', 25, 2, 2, '2023S1', '2023-06-01', '2023-08-31'),
(103, 'English C', 'Mon-Wed 2pm', 'R103', 20, 3, 3, '2023S1', '2023-06-01', '2023-08-31'),
(104, 'History D', 'Tue-Thu 1pm', 'R104', 30, 4, 4, '2023S1', '2023-06-01', '2023-08-31'),
(105, 'Geography E', 'Fri 9am', 'R105', 15, 5, 5, '2023S1', '2023-06-01', '2023-08-31'),
(106, 'Python F', 'Mon 3pm', 'R106', 20, 6, 6, '2023S1', '2023-06-01', '2023-08-31'),
(107, 'Physics G', 'Wed 10am', 'R107', 25, 7, 7, '2023S1', '2023-06-01', '2023-08-31'),
(108, 'Chemistry H', 'Thu 2pm', 'R108', 20, 8, 8, '2023S1', '2023-06-01', '2023-08-31'),
(109, 'Economics I', 'Fri 11am', 'R109', 30, 9, 9, '2023S1', '2023-06-01', '2023-08-31'),
(110, 'Botany J', 'Tue 4pm', 'R110', 15, 10, 10, '2023S1', '2023-06-01', '2023-08-31');

select * from Classes;


-- Select Queries 

-- 1. Select specific Classes 
select  ClassID, ClassName from Classes;

-- 2. Select   from table 
select * from Classes where ClassName = 'Science B';

-- 3. Select  with containing specfic word
select * from Classes where Capacity > 20;

-- 4. Count the number of classes 
select count(*) AS total_classes from Classes;


-- ALTER QUERIES

-- 1. add a new column
ALTER TABLE Classes
ADD COLUMN class_leader varchar(100);

-- 2. Change the datatype of a existing column 
ALTER TABLE Classes
MODIFY COLUMN StartDate datetime;


-- 3. Set the default value for a column 
ALTER TABLE Classes
ALTER column Capacity SET DEFAULT 15;

-- 4. Drop a column 
ALTER TABLE Classes
DROP COLUMN Semester;

-- 5. Rename a column 
ALTER TABLE Classes
CHANGE COLUMN RoomNumber Room_no varchar(10);


-- Delete Queries 

-- 1. Delete a class name
DELETE FROM Classes
WHERE ClassName = 'Science B';

-- 2. Delete records based on condition 
DELETE FROM Classes
WHERE Room_no = 'R104';

-- 3. Delete records with specific capacity
DELETE FROM Classes
WHERE Capacity = 30;

-- 4. Delete all records 
DELETE from Classes	;


drop table Classes;

-- Rename Queries
-- 1. Rename the table name 
ALTER TABLE Classes RENAME TO Class_details;

-- 2. Rename the feedback cloumn 
ALTER TABLE Class_details RENAME COLUMN Schedule to TimeTable;

-- 3. Rename the payment_status column
ALTER TABLE Class_details rename column Capacity to volume;


-- Update Queries 

-- 1. Update the ClassName 
UPDATE Class_details
set ClassName = 'English D'
where  ClassName = 'English C';

-- 2. Update the  volume
Update Class_details
SET volume = 20
where ClassName = 'Python F';

-- 3. Update the TeacherID
UPDATE Class_details
set TeacherID = 3
where ClassID = 104;

-- 4. Update the RoomNumber
UPDATE Class_details
SET Room_no= 'R109'
WHERE ClassID = 106;


-- Table 6: Assignments
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    Title VARCHAR(100),
    Description TEXT,
    DueDate DATE,
    CourseID INT,
    ClassID INT,
    MaxMarks INT,
    AssignedDate DATE,
    Status VARCHAR(20),
    AttachmentLink VARCHAR(255),
    FOREIGN KEY (CourseID) REFERENCES Course_details(CourseID),
    FOREIGN KEY (ClassID) REFERENCES Class_details(ClassID)
);

INSERT INTO Assignments (AssignmentID, Title, Description, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status, AttachmentLink) VALUES
(1, 'Algebra HW', 'Practice algebra problems', '2023-07-15', 1, 101, 100, '2023-06-15', 'Open', 'link1'),
(2, 'Physics Quiz', 'Concepts of motion', '2023-07-20', 7, 107, 50, '2023-06-18', 'Open', 'link2'),
(3, 'Essay', 'Write on World Wars', '2023-07-25', 4, 104, 100, '2023-06-20', 'Open', 'link3'),
(4, 'Python Project', 'Basic calculator app', '2023-07-30', 6, 106, 100, '2023-06-22', 'Open', 'link4'),
(5, 'Grammar Test', 'Tenses exercise', '2023-07-10', 3, 103, 50, '2023-06-10', 'Open', 'link5'),
(6, 'Botany Diagram', 'Label plant parts', '2023-07-12', 10, 110, 30, '2023-06-12', 'Open', 'link6'),
(7, 'Chemistry Lab', 'Acid-base reactions', '2023-07-28', 8, 108, 70, '2023-06-25', 'Open', 'link7'),
(8, 'Economic Report', 'Indian GDP growth', '2023-07-22', 9, 109, 80, '2023-06-19', 'Open', 'link8'),
(9, 'Geography Map', 'Continents labeling', '2023-07-17', 5, 105, 60, '2023-06-16', 'Open', 'link9'),
(10, 'Science Experiment', 'Simple circuits', '2023-07-18', 2, 102, 90, '2023-06-14', 'Open', 'link10');


select * from Assignments;

-- Select Queries 

-- 1. Select specific Assignments 
select AssignmentID, Title from Assignments;

-- 2. Select  specific title 
select * from Assignments where Title = ' Physics Quiz';

-- 3. Select  with containing specfic word
select * from Assignments where Description LIKE '%Indian%';

-- 4. Count the number of Assignments 
select count(*) AS total_Assignments from Assignments;






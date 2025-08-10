-- Single line comment
/*
Multi-line 
comment
*/

-- ------------------------------------------------------------------ Database Queries ---------------------------------------------------
-- create a dataabse to work on it 
CREATE DATABASE University;

-- to work on that database use it first 
use University;

-- ----------------------------------------------------------------- Table Analysis -----------------------------------------------------
/*
Table-1: Students(student_id, first_name, last_name, dob, gender, email, phone_number, address, department_id, enrollment_year)
Table-2: Departments(department_id, department_name, head_of_department, office_phone, office_email, faculty_count, student_count, established_year, location, building_name)
Table-3: Courses(course_id, course_name, department_id, credits, semester, instructor_id, course_type, max_enrollment, classroom, schedule)
Table-4: Instructors(instructor_id, first_name, last_name, department_id, hire_date, email, phone_number, office_number, designation, salary)
Table-5: Enrollments(enrollment_id, student_id, course_id, semester, year, grade, status, enrolled_on, attendance_percentage, remarks)
Table-6: Exams(exam_id, course_id, exam_type, date, duration, max_marks, venue, invigilator_id, passing_marks, results_declared)
Table-7: Results(result_id, student_id, course_id, exam_id, marks_obtained, grade, status, remarks, result_date, evaluator_id)
Table-8: Library(library_id, book_title, author, isbn, department_id, publish_year, category, available_copies, total_copies, shelf_number)
Table-9: Hostel(hostel_id, name, type, capacity, warden_name, contact_number, location, rooms_available, gender, established_year)
Table-10: Fees(fees_id, student_id, amount, due_date, paid_date, status, mode_of_payment, semester, year, remarks)



*/

-- ---------------------------------------------------------------- Database Queries -----------------------------------------------------

-- Table-1: Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255),
    department_id INT,
    enrollment_year INT
);

INSERT INTO Students VALUES 
(101, 'Ravi', 'Kumar', '2002-04-15', 'Male', 'ravi.kumar@example.com', '9876543210', 'Delhi', 201, 2020),
(102, 'Sneha', 'Sharma', '2003-01-10', 'Female', 'sneha.sharma@example.com', '9876543211', 'Mumbai', 202, 2021),
(103, 'Amit', 'Verma', '2002-08-23', 'Male', 'amit.verma@example.com', '9876543212', 'Chennai', 203, 2020),
(104, 'Pooja', 'Rao', '2003-05-12', 'Female', 'pooja.rao@example.com', '9876543213', 'Bangalore', 201, 2021),
(105, 'Raj', 'Patel', '2001-11-30', 'Male', 'raj.patel@example.com', '9876543214', 'Ahmedabad', 204, 2019);

-- to remove the data of the table 
TRUNCATE TABLE Students;

-- to delete the entire table 
DROP TABLE Students;


-- Table-2: Departments
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    head_of_department VARCHAR(100),
    office_phone VARCHAR(15),
    office_email VARCHAR(100),
    faculty_count INT,
    student_count INT,
    established_year INT,
    location VARCHAR(100),
    building_name VARCHAR(100)
);

INSERT INTO Departments VALUES 
(201, 'Computer Science', 'Dr. Mehta', '0221234567', 'cs@university.edu', 25, 300, 2000, 'North Wing', 'Tech Block'),
(202, 'Mechanical Engineering', 'Dr. Sharma', '0221234568', 'mech@university.edu', 20, 250, 1995, 'East Wing', 'Engg Block'),
(203, 'Electrical Engineering', 'Dr. Rao', '0221234569', 'ee@university.edu', 18, 220, 1990, 'South Wing', 'Power Block'),
(204, 'Civil Engineering', 'Dr. Iyer', '0221234570', 'civil@university.edu', 15, 200, 1985, 'West Wing', 'Structure Block'),
(205, 'Electronics', 'Dr. Das', '0221234571', 'ece@university.edu', 22, 270, 2002, 'Main Campus', 'Signal Block');

-- to remove the data of the table 
TRUNCATE TABLE Departments;

-- to delete the entire table 
DROP TABLE Departments;


-- Table-3: Courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department_id INT,
    credits INT,
    semester INT,
    instructor_id INT,
    course_type VARCHAR(50),
    max_enrollment INT,
    classroom VARCHAR(20),
    schedule VARCHAR(100)
);

INSERT INTO Courses VALUES 
(301, 'Data Structures', 201, 4, 3, 401, 'Core', 60, 'C101', 'Mon-Wed-Fri 10:00 AM'),
(302, 'Thermodynamics', 202, 3, 4, 402, 'Core', 50, 'M201', 'Tue-Thu 2:00 PM'),
(303, 'Circuit Analysis', 203, 4, 3, 403, 'Core', 55, 'E301', 'Mon-Wed 9:00 AM'),
(304, 'Fluid Mechanics', 204, 4, 5, 404, 'Core', 45, 'C401', 'Tue-Thu 11:00 AM'),
(305, 'Digital Systems', 205, 3, 2, 405, 'Elective', 40, 'D501', 'Wed-Fri 3:00 PM');

-- to remove the data of the table 
TRUNCATE TABLE Courses;

-- to delete the entire table 
DROP TABLE Courses;


-- Table-4: Instructors
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    office_number VARCHAR(10),
    designation VARCHAR(50),
    salary INT
);

INSERT INTO Instructors VALUES 
(401, 'Manish', 'Mehta', 201, '2015-06-01', 'mehta@university.edu', '9988776655', 'CS101', 'Professor', 95000),
(402, 'Sunita', 'Sharma', 202, '2012-07-12', 'sharma@university.edu', '9988776656', 'ME202', 'Associate Prof', 85000),
(403, 'Ramesh', 'Rao', 203, '2010-01-25', 'rao@university.edu', '9988776657', 'EE303', 'Professor', 92000),
(404, 'Geeta', 'Iyer', 204, '2013-09-10', 'iyer@university.edu', '9988776658', 'CE404', 'Lecturer', 70000),
(405, 'Anil', 'Das', 205, '2016-03-15', 'das@university.edu', '9988776659', 'EC505', 'Associate Prof', 87000);

-- to remove the data of the table 
TRUNCATE TABLE Instructors;

-- to delete the entire table 
DROP TABLE Instructors;


-- Table-5: Enrollments
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester INT,
    year INT,
    grade VARCHAR(2),
    status VARCHAR(20),
    enrolled_on DATE,
    attendance_percentage DECIMAL(5,2),
    remarks VARCHAR(100)
);

INSERT INTO Enrollments VALUES 
(501, 101, 301, 3, 2022, 'A', 'Completed', '2022-07-15', 95.50, 'Excellent'),
(502, 102, 302, 4, 2022, 'B+', 'Completed', '2022-07-18', 89.00, 'Good'),
(503, 103, 303, 3, 2022, 'B', 'Completed', '2022-07-20', 85.00, 'Good'),
(504, 104, 304, 5, 2022, 'A-', 'Completed', '2022-07-22', 92.30, 'Very Good'),
(505, 105, 305, 2, 2022, 'B', 'Completed', '2022-07-25', 88.75, 'Good');

-- to remove the data of the table 
TRUNCATE TABLE Enrollments;

-- to delete the entire table 
DROP TABLE Enrollments;


-- Table-6: Exams
CREATE TABLE Exams (
    exam_id INT PRIMARY KEY,
    course_id INT,
    exam_type VARCHAR(50),
    date DATE,
    duration INT,
    max_marks INT,
    venue VARCHAR(100),
    invigilator_id INT,
    passing_marks INT,
    results_declared VARCHAR(5)
);

INSERT INTO Exams VALUES 
(601, 301, 'Midterm', '2022-08-10', 90, 100, 'Auditorium A', 401, 40, 'Yes'),
(602, 302, 'Final', '2022-09-15', 120, 100, 'Hall B', 402, 40, 'Yes'),
(603, 303, 'Midterm', '2022-08-12', 90, 100, 'Room E303', 403, 40, 'Yes'),
(604, 304, 'Final', '2022-09-20', 120, 100, 'CE Block', 404, 40, 'Yes'),
(605, 305, 'Midterm', '2022-08-18', 90, 100, 'Lab D', 405, 40, 'Yes');

-- to remove the data of the table 
TRUNCATE TABLE Exams;

-- to delete the entire table 
DROP TABLE Exams;


-- Table-7: Results
CREATE TABLE Results (
    result_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    exam_id INT,
    marks_obtained INT,
    grade VARCHAR(2),
    status VARCHAR(20),
    remarks VARCHAR(100),
    result_date DATE,
    evaluator_id INT
);

INSERT INTO Results VALUES 
(701, 101, 301, 601, 92, 'A', 'Pass', 'Topper', '2022-08-20', 401),
(702, 102, 302, 602, 81, 'B+', 'Pass', 'Good', '2022-09-25', 402),
(703, 103, 303, 603, 78, 'B', 'Pass', 'Average', '2022-08-22', 403),
(704, 104, 304, 604, 88, 'A-', 'Pass', 'Very Good', '2022-09-27', 404),
(705, 105, 305, 605, 80, 'B', 'Pass', 'Consistent', '2022-08-28', 405);

-- to remove the data of the table 
TRUNCATE TABLE Results;

-- to delete the entire table 
DROP TABLE Results;


-- Table-8: Library
CREATE TABLE Library (
    library_id INT PRIMARY KEY,
    book_title VARCHAR(100),
    author VARCHAR(100),
    isbn VARCHAR(20),
    department_id INT,
    publish_year INT,
    category VARCHAR(50),
    available_copies INT,
    total_copies INT,
    shelf_number VARCHAR(10)
);

INSERT INTO Library VALUES 
(801, 'Introduction to Algorithms', 'Cormen', '9780262033848', 201, 2009, 'Textbook', 5, 10, 'S1A'),
(802, 'Heat Transfer', 'J.P. Holman', '9780070702539', 202, 2008, 'Reference', 3, 5, 'S2B'),
(803, 'Basic Electronics', 'Sedra Smith', '9780199770508', 205, 2010, 'Textbook', 4, 6, 'S3C'),
(804, 'Structural Analysis', 'R.C. Hibbeler', '9780136020608', 204, 2011, 'Textbook', 2, 4, 'S4D'),
(805, 'Power Systems', 'Ashfaq Hussain', '9788121924962', 203, 2012, 'Reference', 3, 5, 'S5E');

-- to remove the data of the table 
TRUNCATE TABLE Library;

-- to delete the entire table 
DROP TABLE Library;


-- Table-9: Hostel
CREATE TABLE Hostel (
    hostel_id INT PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(20),
    capacity INT,
    warden_name VARCHAR(100),
    contact_number VARCHAR(15),
    location VARCHAR(100),
    rooms_available INT,
    gender VARCHAR(10),
    established_year INT
);

INSERT INTO Hostel VALUES 
(901, 'Aakash', 'Boys', 100, 'Mr. Raj', '9000011111', 'Campus North', 10, 'Male', 2005),
(902, 'Triveni', 'Girls', 120, 'Ms. Neeta', '9000011112', 'Campus East', 15, 'Female', 2007),
(903, 'Ganga', 'Boys', 90, 'Mr. Aman', '9000011113', 'Campus South', 8, 'Male', 2004),
(904, 'Yamuna', 'Girls', 110, 'Ms. Ritu', '9000011114', 'Campus West', 12, 'Female', 2006),
(905, 'Krishna', 'Boys', 80, 'Mr. Vinay', '9000011115', 'Main Campus', 9, 'Male', 2008);

-- to remove the data of the table 
TRUNCATE TABLE Hostel;

-- to delete the entire table 
DROP TABLE Hostel;


-- Table-10: Fees
CREATE TABLE Fees (
    fees_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2),
    due_date DATE,
    paid_date DATE,
    status VARCHAR(20),
    mode_of_payment VARCHAR(20),
    semester INT,
    year INT,
    remarks VARCHAR(100)
);

INSERT INTO Fees VALUES 
(1001, 101, 45000.00, '2022-06-30', '2022-06-28', 'Paid', 'Online', 3, 2022, 'Paid in full'),
(1002, 102, 46000.00, '2022-06-30', '2022-06-29', 'Paid', 'UPI', 4, 2022, 'On time'),
(1003, 103, 47000.00, '2022-06-30', '2022-07-01', 'Late Paid', 'Cash', 3, 2022, 'Late payment'),
(1004, 104, 48000.00, '2022-06-30', NULL, 'Pending', 'Online', 5, 2022, 'Awaiting payment'),
(1005, 105, 49000.00, '2022-06-30', '2022-06-27', 'Paid', 'Card', 2, 2022, 'Paid early');

-- to remove the data of the table 
TRUNCATE TABLE Fees;

-- to delete the entire table 
DROP TABLE Fees;

-- Single line comment
/*
Multi-line 
comment
*/

-- ------------------------------------------------------------------ Database Queries ---------------------------------------------------
-- create a dataabse to work on it 
CREATE DATABASE Company;

-- to work on that database use it first 
use Company;

drop database Company;
-- ----------------------------------------------------------------- Table Analysis -----------------------------------------------------
/*
Table-1  : Employees(employee_id, first_name, last_name, department_id, position, hire_date, email, phone_number, salary, status)
Table-2  : Departments(department_id, department_name, manager_id, location, budget, extension_number, established_year, headcount, floor, status)
Table-3  : Projects(project_id, project_name, department_id, start_date, end_date, project_lead, budget, status, client_name, remarks)
Table-4  : Clients(client_id, client_name, industry, contact_person, phone_number, email, address, city, country, status)
Table-5  : Attendance(attendance_id, employee_id, date, check_in, check_out, status, total_hours, late_minutes, early_minutes, remarks)
Table-6  : Salaries(salary_id, employee_id, base_salary, bonus, tax_deduction, net_salary, payment_date, payment_mode, bank_account, remarks)
Table-7  : Meetings(meeting_id, title, organizer_id, date, start_time, end_time, location, participants, agenda, status)
Table-8  : Assets(asset_id, item_name, category, purchase_date, cost, assigned_to, condition, location, warranty_years, status)
Table-9  : Trainings(training_id, training_name, trainer_name, start_date, end_date, department_id, participants, training_type, duration_hours, remarks)
Table-10 : Leaves(leave_id, employee_id, leave_type, start_date, end_date, reason, approved_by, status, application_date, remarks)

*/

-- ---------------------------------------------------------------- Database Queries -----------------------------------------------------

-- Table-1: Employees
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    position VARCHAR(50),
    hire_date DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    salary DECIMAL(10,2),
    status VARCHAR(20)
);

INSERT INTO Employees VALUES
(101, 'Raj', 'Kumar', 201, 'Manager', '2020-01-15', 'raj.kumar@company.com', '9876543210', 75000.00, 'Active'),
(102, 'Sneha', 'Mehta', 202, 'Analyst', '2021-06-10', 'sneha.mehta@company.com', '9876543211', 55000.00, 'Active'),
(103, 'Arjun', 'Patel', 203, 'Developer', '2019-09-20', 'arjun.patel@company.com', '9876543212', 60000.00, 'Active'),
(104, 'Priya', 'Sharma', 201, 'HR Executive', '2022-02-05', 'priya.sharma@company.com', '9876543213', 48000.00, 'On Leave'),
(105, 'Nikhil', 'Verma', 204, 'Technician', '2018-11-30', 'nikhil.verma@company.com', '9876543214', 42000.00, 'Active');

-- To remove all data from Employees
TRUNCATE TABLE Employees;

-- To delete the Employees table
DROP TABLE Employees;

-- Table-2: Departments
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    manager_id INT,
    location VARCHAR(50),
    budget DECIMAL(12,2),
    extension_number VARCHAR(10),
    established_year INT,
    headcount INT,
    floor INT,
    status VARCHAR(20)
);

INSERT INTO Departments VALUES
(201, 'HR', 101, 'Mumbai', 500000.00, '1001', 2015, 10, 2, 'Active'),
(202, 'Finance', 102, 'Pune', 700000.00, '1002', 2016, 8, 3, 'Active'),
(203, 'IT', 103, 'Delhi', 900000.00, '1003', 2014, 15, 4, 'Active'),
(204, 'Maintenance', 104, 'Chennai', 300000.00, '1004', 2018, 5, 1, 'Active'),
(205, 'Logistics', 105, 'Hyderabad', 400000.00, '1005', 2017, 7, 2, 'Active');

-- To remove all data from Departments
TRUNCATE TABLE Departments;

-- To delete the Departments table
DROP TABLE Departments;

-- Table-3: Projects
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    start_date DATE,
    end_date DATE,
    project_lead VARCHAR(50),
    budget DECIMAL(10,2),
    status VARCHAR(20),
    client_name VARCHAR(100),
    remarks VARCHAR(200)
);

INSERT INTO Projects VALUES
(301, 'HRMS Upgrade', 201, '2023-01-01', '2023-06-30', 'Raj Kumar', 250000.00, 'Ongoing', 'Tech Solutions', 'Important upgrade'),
(302, 'Payroll Automation', 202, '2023-03-15', '2023-09-15', 'Sneha Mehta', 300000.00, 'Ongoing', 'FinCorp', 'Automating salary process'),
(303, 'Website Revamp', 203, '2022-11-01', '2023-04-30', 'Arjun Patel', 450000.00, 'Completed', 'MediaX', 'Design overhaul'),
(304, 'Facility Upgrade', 204, '2022-10-10', '2023-03-10', 'Nikhil Verma', 200000.00, 'Completed', 'InfraBuild', 'Office improvements'),
(305, 'Delivery Tracker', 205, '2023-05-01', '2023-12-31', 'Priya Sharma', 350000.00, 'Ongoing', 'QuickMove', 'Tracking system');

-- To remove all data from Projects
TRUNCATE TABLE Projects;

-- To delete the Projects table
DROP TABLE Projects;

-- Table-4: Clients
CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(100),
    industry VARCHAR(50),
    contact_person VARCHAR(50),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200),
    city VARCHAR(50),
    country VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO Clients VALUES
(401, 'Tech Solutions', 'IT', 'Ramesh Nair', '9123456789', 'ramesh@techsolutions.com', '123 MG Road', 'Mumbai', 'India', 'Active'),
(402, 'FinCorp', 'Finance', 'Neha Jain', '9123456790', 'neha@fincorp.com', '456 FC Lane', 'Delhi', 'India', 'Active'),
(403, 'MediaX', 'Media', 'Anil Roy', '9123456791', 'anil@mediax.com', '789 MX Street', 'Bangalore', 'India', 'Inactive'),
(404, 'InfraBuild', 'Construction', 'Sunita Rao', '9123456792', 'sunita@infrabuild.com', '321 IB Road', 'Chennai', 'India', 'Active'),
(405, 'QuickMove', 'Logistics', 'Vikram Singh', '9123456793', 'vikram@quickmove.com', '654 QM Nagar', 'Hyderabad', 'India', 'Active');

-- To remove all data from Clients
TRUNCATE TABLE Clients;

-- To delete the Clients table
DROP TABLE Clients;

-- Table-5: Attendance
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    date DATE,
    check_in TIME,
    check_out TIME,
    status VARCHAR(20),
    total_hours DECIMAL(4,2),
    late_minutes INT,
    early_minutes INT,
    remarks VARCHAR(100)
);

INSERT INTO Attendance VALUES
(501, 101, '2023-08-01', '09:00:00', '17:00:00', 'Present', 8.00, 0, 0, 'On time'),
(502, 102, '2023-08-01', '09:15:00', '17:00:00', 'Late', 7.75, 15, 0, 'Late arrival'),
(503, 103, '2023-08-01', '08:45:00', '16:45:00', 'Present', 8.00, 0, 15, 'Left early'),
(504, 104, '2023-08-01', NULL, NULL, 'Leave', 0.00, 0, 0, 'On leave'),
(505, 105, '2023-08-01', '09:00:00', '17:00:00', 'Present', 8.00, 0, 0, 'Regular day');

-- To remove all data from Attendance
TRUNCATE TABLE Attendance;

-- To delete the Attendance table
DROP TABLE Attendance;


-- Table-6: Salaries
CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    base_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    tax_deduction DECIMAL(10,2),
    net_salary DECIMAL(10,2),
    payment_date DATE,
    payment_mode VARCHAR(50),
    bank_account VARCHAR(50),
    remarks TEXT
);

INSERT INTO Salaries VALUES
(601, 101, 50000, 5000, 2000, 53000, '2025-07-31', 'Bank Transfer', 'HDFC00123', 'Monthly payout'),
(602, 102, 55000, 4000, 2500, 56500, '2025-07-31', 'Bank Transfer', 'ICICI00234', 'Monthly payout'),
(603, 103, 60000, 7000, 3000, 64000, '2025-07-31', 'Cheque', 'SBI00345', 'Bonus included'),
(604, 104, 65000, 6000, 3500, 67500, '2025-07-31', 'Bank Transfer', 'AXIS00456', 'Monthly payout'),
(605, 105, 48000, 3000, 1800, 49200, '2025-07-31', 'Cash', 'HDFC00567', 'On-site incentive');

-- To remove the data of the table
TRUNCATE TABLE Salaries;

-- To delete the entire table
DROP TABLE Salaries;


-- Table-7: Meetings
CREATE TABLE Meetings (
    meeting_id INT PRIMARY KEY,
    title VARCHAR(100),
    organizer_id INT,
    date DATE,
    start_time TIME,
    end_time TIME,
    location VARCHAR(100),
    participants TEXT,
    agenda TEXT,
    status VARCHAR(20)
);

INSERT INTO Meetings VALUES
(701, 'Monthly Review', 101, '2025-08-05', '10:00:00', '11:00:00', 'Conference Room A', '101,102,103', 'Review project progress', 'Scheduled'),
(702, 'Client Discussion', 102, '2025-08-06', '14:00:00', '15:00:00', 'Meeting Room 2', '102,105', 'Client feedback session', 'Scheduled'),
(703, 'HR Policy Update', 104, '2025-08-07', '11:00:00', '12:00:00', 'Board Room', '101,104,105', 'Discuss new policies', 'Scheduled'),
(704, 'Training Plan', 103, '2025-08-08', '09:00:00', '10:00:00', 'Conference Room B', '103,105', 'Plan upcoming training', 'Scheduled'),
(705, 'Project Kickoff', 105, '2025-08-09', '15:00:00', '16:00:00', 'Online', '102,103', 'Start new client project', 'Scheduled');

-- To remove the data of the table
TRUNCATE TABLE Meetings;

-- To delete the entire table
DROP TABLE Meetings;


-- Table-8: Assets
CREATE TABLE Assets (
    asset_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    purchase_date DATE,
    cost DECIMAL(10,2),
    assigned_to INT,
    state VARCHAR(50),
    location VARCHAR(100),
    warranty_years INT,
    status VARCHAR(20)
);

INSERT INTO Assets VALUES
(801, 'Dell Laptop', 'Electronics', '2023-01-10', 55000, 101, 'Good', 'IT Room', 3, 'Active'),
(802, 'HP Printer', 'Electronics', '2023-02-15', 12000, 102, 'Fair', 'Admin Room', 2, 'Active'),
(803, 'Office Chair', 'Furniture', '2023-03-20', 4000, 103, 'New', 'HR Cabin', 5, 'Active'),
(804, 'Projector', 'Electronics', '2023-04-25', 35000, 104, 'Good', 'Meeting Room', 4, 'Inactive'),
(805, 'Air Conditioner', 'Electronics', '2023-05-30', 45000, 105, 'Excellent', 'Main Hall', 5, 'Active');

-- To remove the data of the table
TRUNCATE TABLE Assets;

-- To delete the entire table
DROP TABLE Assets;

-- Table-9: Trainings
CREATE TABLE Trainings (
    training_id INT PRIMARY KEY,
    training_name VARCHAR(100),
    trainer_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    department_id INT,
    participants TEXT,
    training_type VARCHAR(50),
    duration_hours INT,
    remarks TEXT
);

INSERT INTO Trainings VALUES
(901, 'Leadership Skills', 'Mr. Raj', '2025-08-01', '2025-08-03', 201, '101,102', 'Soft Skills', 12, 'Managerial training'),
(902, 'Data Analysis', 'Ms. Anita', '2025-08-04', '2025-08-06', 202, '103,104', 'Technical', 15, 'Using Power BI'),
(903, 'Cyber Security', 'Mr. Kiran', '2025-08-07', '2025-08-08', 203, '105,101', 'IT Training', 10, 'Network security basics'),
(904, 'Communication Skills', 'Ms. Meera', '2025-08-09', '2025-08-10', 204, '102,103', 'Soft Skills', 8, 'Presentation and public speaking'),
(905, 'Scrum Basics', 'Mr. Arjun', '2025-08-11', '2025-08-12', 205, '104,105', 'Agile', 10, 'Agile project framework');

-- To remove the data of the table
TRUNCATE TABLE Trainings;

-- To delete the entire table
DROP TABLE Trainings;


-- Table-10: Leaves
CREATE TABLE Leaves (
    leave_id INT PRIMARY KEY,
    employee_id INT,
    leave_type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    reason TEXT,
    approved_by INT,
    status VARCHAR(20),
    application_date DATE,
    remarks TEXT
);

INSERT INTO Leaves VALUES
(1001, 101, 'Sick Leave', '2025-08-01', '2025-08-03', 'Fever and rest', 104, 'Approved', '2025-07-31', 'Medical certificate provided'),
(1002, 102, 'Casual Leave', '2025-08-04', '2025-08-05', 'Family event', 103, 'Pending', '2025-08-02', 'Awaiting approval'),
(1003, 103, 'Earned Leave', '2025-08-06', '2025-08-08', 'Vacation', 105, 'Approved', '2025-08-03', 'Annual trip'),
(1004, 104, 'Maternity Leave', '2025-08-09', '2025-09-09', 'Childbirth', 101, 'Approved', '2025-08-05', 'HR approved'),
(1005, 105, 'Comp Off', '2025-08-10', '2025-08-10', 'Worked on weekend', 102, 'Approved', '2025-08-08', 'As per HR policy');

-- To remove the data of the table
TRUNCATE TABLE Leaves;

-- To delete the entire table
DROP TABLE Leaves;


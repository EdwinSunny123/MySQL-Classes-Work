-- single line comment

/*
Multi lines
commments
*/

-- ---------------------------------------------------Database queries------------------------------------------------------------------
-- create a database to work on it 
create database company;

-- to work on it we need to use it first
use company;

drop database company;

-- ------------------------------------------------------Database Analysis--------------------------------------------------------------

/*
Table-1: Employees(emp_id,emp_name,email,phone,salary,joined_date,designation,DOB,years_of_experience,location)
Table-2: Departments(department_id,dept_name,hod,emp_id,year_established,no_of_employees,location,email,location,finance_allocated)
Table-3: Projects(project_id,dept_id,location,project_name,no_of_emp,team_leader,project_duration,cost_of_project,description,dead_line)
Table-4: Salaries(salary_id,empp_id,salary,position,payment_date,basic_pay,bonus,deductions,HRA,overtime_pay)
Table-5: Clients(client_id,client_name,project_id,email,phone_no,location,industry_type,account_status,company_name,registration_date)
*/

-- ----------------------------------------------------Table Analysis-------------------------------------------------------

-- create Table-1
create table Employees(
emp_id int primary key,
emp_name varchar(100),
email varchar(100),
phone varchar(20),
salary int,
joined_date date,
designation varchar(50),
DOB date,
years_of_experience int,
location varchar(150)
);


-- to display table data 
select * from  Employees;

-- insert records to table-1
insert into Employees(emp_id,emp_name,email,phone,salary,joined_date,designation,DOB,years_of_experience,location)
values
(101,'Prakash Raj','prakash10@gmail.com','9658471200',50000,'2024-10-03','Senior Engineer','1983-05-12',5,'Mumbai'),
(102,'Rahul Pandey','rahul1996@gmail.com','9655842206',30000,'2025-02-12','Fresher','1996-06-20',0,'Kolkata'),
(103,'Karthik Nair','karthiknair@gmail.com','912036290',90000,'2010-10-09','HOD','1975-06-13',20,'Mumbai'),
(104,'Jitesh Sharma','jitershsharma10@gmail.com','950646200',65000,'2022-10-03','Senior Engineer','1992-05-12',5,'Bangalore'),
(105,'Karun Nair','karunnair@gmail.com','965856200',40000,'2024-11-03','Product Engineer','1992-12-05',5,'Cochin'),
(106,'Rohit Sharma','rohit45@gmail.com','9658471200',30000,'2023-10-03','Senior Engineer','2001-09-02',2,'Mumbai'),
(107,'Shubman Gill','Shubman78@gmail.com','9658471200',50000,'2024-06-09','Manager','1983-08-22',1,'Mumbai'),
(108,'Vedant Ghag','vedant@gmail.com','9658471290',100000,'2010-10-15','HR','1987-07-13',15,'Delhi'),
(109,'Sanjay Menon','sanjay67@gmail.com','912545200',50000,'2024-02-20','HR','1983-06-12',4,'Mumbai'),
(110,'Siddhant Dube','siddhantdube@gmail.com','965141252',1500000,'2024-10-03','Manager','1987-02-06',20,'Mumbai');

-- to remove values from table 
truncate table Employees;

-- to delete table 
drop table Employees;

-- SELECT QUERIES:

-- 1. select columns from Employees
select * from Employees;

-- 2. select specific columns from employees
select emp_name, email from Employees;

-- 3. select specific name from Employees
select * from Employees WHERE emp_name = 'Rahul Pandey';

-- 4. select specific designation from Employees
select * from Employees WHERE designation = 'Senior Engineer';

-- 5. Count the number of Employees
select count(*) AS total_employees from Employees;

-- 6.  Select Employees with a location containing a specific word  
select * from Employees WHERE location LIKE '%Mumbai%';

-- 7. Select Employees with more 25 characters in email
select * from Employees WHERE char_length(email) > 25;

-- 8.  Select Employees with a emp_name starting with 'R'
select * from Employees WHERE emp_name LIKE 'R%';

-- 9. Select Employees ordered by name
select * from employees ORDER BY emp_name;

-- 10. Select the first 5 Employees
select * from Employees LIMIT 5;

-- 11. Select Employees with less than 12 characters in emp_name
SELECT * FROM Employees WHERE char_length(emp_name) < 12;

-- 12. Select Employees with a location that does not contain 'MUMBAI'
select * from Employees WHERE location NOT LIKE '%MUMBAI%';

-- 13. Select the total number of unique phone
SELECT count(DISTINCT phone) AS unique_phone from Employees;

-- 14. select employee where designation is not null
select * from Employees WHERE designation IS NOT  NULL;

-- 15. SELECT employee with the longest name
select * from Employees ORDER BY char_length(emp_name) DESC LIMIT 3;

-- 16. Select Employees with a location that is not 'Mumbai'
select * from Employees WHERE location != 'Mumbai';

-- 17. Order employyes by DOB
select * from Employees ORDER BY DOB;

-- 18. Select the first 3 Employees
select * from Employees LIMIT 3;

-- 19. select specific name from Employees
select * from Employees WHERE emp_name = 'Shubman Gill';

-- 20. select specific columns from employees
select emp_id, designation from Employees;




-- create table-2
create table Departments(
department_id  int primary key,
dept_name varchar(100),
hod varchar(50),
emp_id int,
year_established date,
no_of_employees int,
location varchar(50),
email varchar(100),
floor int,
finance_allocated int,
Foreign key (emp_id) references employees(emp_id)
);

-- to display table data 
select * from  Departments;

-- insert records into table-2
insert into Departments(department_id,dept_name,hod,emp_id,year_established,no_of_employees,location,email,floor,finance_allocated)
values
(201,'Mechanical','Prakash',101,'1985-05-12',150,'Mumbai','mechanical150@gmail.com',5,2500000),
(202,'Electrical','Virat',103,'1990-10-22',150,'Mumbai','electrical12@gmail.com',7,3000000),
(203,'IT','Rahul',106,'2000-06-12',100,'Mumbai','itrahul@gmail.com',4,2500000),
(204,'HR','Soham',105,'2002-05-12',160,'Mumbai','hrsoham0@gmail.com',5,2000000),
(205,'Civil','Prathamesh',108,'2006-09-12',200,'Mumbai','civilprath@gmail.com',3,1000000),
(206,'Instrumentation','Karun',101,'1-08-12',50,'Mumbai','karun10@gmail.com',1,2500000),
(207,'CyberSecurity','Joel',null,'1985-07-12',40,'Mumbai','cyberjoel@gmail.com',3,2500000),
(208,'Accounts','Rushikesh',102,'1985-11-12',160,'Mumbai','rushikesh54@gmail.com',6,2500000),
(209,'Sales','Aman',103,'2000-06-12',70,'Mumbai','salesaman@gmail.com',4,4000000),
(210,'Administration','Karthik',104,'2012-05-12',100,'Mumbai','karthik86@gmail.com',4,5000000);

-- to remove values from table 
truncate table Departments;

-- to delete table 
drop table Departments;

-- SELECT QUERIES

-- 1. select columns from Departments
select * from Departments;

-- 2. select specific columns from Departments
select department_id, dept_name from Departments;

-- 3. select specific dept_name from Departments
select * from Departments WHERE dept_name = 'Electrical';

-- 4. select specific designation from Departments
select * from Departments WHERE hod = 'Rahul';

-- 5. Count the number of Departments
select count(*) AS total_departments from Departments;

-- 6.  select specific columns from Departments
select department_id, hod, no_of_employees from Departments;

-- 7. Select Departments with more 18 characters in email
select * from Departments WHERE char_length(email) > 18;

-- 8.  Select Departments with a dept_name starting with 'C'
select * from Departments WHERE dept_name LIKE 'C%';

-- 9. Select Departments ordered by dept_name
select * from Departments ORDER BY dept_name;

-- 10. Select the first 5 Departments
select * from Departments LIMIT 5;

-- 11. Select Departments with less than 12 characters in dept_name
SELECT * FROM Departments WHERE char_length(dept_name) < 12;

-- 12. Select Departments with a location that does not contain 'MUMBAI'
select * from Departments WHERE location NOT LIKE '%MUMBAI%';

-- 13. Select the total number of unique email
SELECT count(DISTINCT email) AS unique_email from Departments;

-- 14. select Department where finance_allocated is not null
select * from Departments WHERE finance_allocated IS NOT  NULL;

-- 15. SELECT Department with the longest name
select * from Departments ORDER BY char_length(dept_name) DESC LIMIT 3;

-- 16. Select Departments with a location that is not 'Mumbai'
select * from Departments WHERE location != 'Mumbai';

-- 17. Order Departments by no_of_employees
select * from Departments ORDER BY no_of_employees;

-- 18. Select the first 3 Departments
select * from Departments LIMIT 3;

-- 19. select specific name from Departments
select * from Departments WHERE dept_name = 'Instrumentation';

-- 20. select specific columns from Departments
select dept_name, hod from Departments;


-- create table-3
create table Projects(
project_id int primary key,
dept_id int,
location varchar(100),
project_name varchar(100),
no_of_emp int,
team_leader varchar(100),
project_duration varchar(20),
cost_of_project int,
description varchar(150),
dead_line date,
foreign key (dept_id) references departments (department_id)
);

-- to display table data 
select * from  Projects;



-- insert records in table-3
insert into Projects(project_id,dept_id,location,project_name,no_of_emp,team_leader,project_duration,cost_of_project,description,dead_line)
values
(301,202,'Mumbai','Power Plant',40,'Vivek','6 months',100000,'A massive power plant which is built near mumbai region','2025-10-01'),
(302,203,'Mumbai','Company Software Updation',60,'Rahul','4 months',50000,'Updating the existing company software with talented engineers','2025-11-12'),
(303,201,'Banglore','Railway Bridge',50,'Roshan','2 years', 5000000,'A bridge connecting two cities over railway tracks','2026-10-02'),
(304,207,'Kolkata','New Metro Line',150,'Shantanu','5 years',100000,'A new metro line which will connect the new towns of kolkata city','2027-08-01'),
(305,206,'Delhi','Railway Bridge',40,'Jashwith','2 years',6500000,'A bridge connecting two cities over railway tracks','2025-12-25'),
(306,203,'Mumbai','Underwater Metro',100,'Rohan','3 years',5400000,'A under water metro which will connect the most of the western mumbai','2028-05-01'),
(307,201,'Bangalore','Bridge',150,'Karthik','9 months',2600000,'A massive 5 km bridge with 6 lanes will be built in banagalore in next few moths','2026-03-02'),
(308,202,'Cochin','New Port',40,'Abin','3 years',4500000,'A new port for kerala which will be having more capacity than existing ports','2027-10-03'),
(309,206,'Delhi','National Highway',65,'Ishan','1 year',1260000,'A massive highway with 8 lanes will be deleiverd for Indian citizens within few months','2025-10-10'),
(310,203,'Mumbai','Software Updation',80,'Sachin','5 months',100000,'Updating the existing company software with talented engineers','2025-11-14');

-- to remove values from table 
truncate table Projects;

-- to delete table 
drop table Projects;


-- SELECT QUERIES

-- 1. select columns from Projects
select * from Projects;

-- 2. select specific columns from Projects
select project_id, project_name from Projects;

-- 3. select specific team_leader from Projects
select * from Projects WHERE team_leader = 'Shantanu';

-- 4. select specific location from Projects
select * from Projects WHERE location = 'Mumbai';

-- 5. Count the number of Projects
select count(*) AS total_projects from Projects;

-- 6.  select specific columns from Projects
select  project_name, project_duration, cost_of_project from Projects;

-- 7. Select Projects with more 50 charcters  in description
select * from Projects WHERE char_length(description) > 50;

-- 8.  Select Projects with a project_name starting with 'R'
select * from Projects WHERE project_name LIKE 'R%';

-- 9. Select Projects ordered by project_name
select * from Projects ORDER BY project_name;

-- 10. Select the first 5 Projects
select * from Projects LIMIT 5;

-- 11. Select Projects with less than 50 characters in description
SELECT * FROM Projects WHERE char_length(description) < 50;

-- 12. Select Projects with a location that does not contain 'MUMBAI'
select * from Projects WHERE location NOT LIKE '%MUMBAI%';

-- 13. Select the total number of unique description
SELECT count(DISTINCT description) AS unique_description from Projects;

-- 14. select Projects where finance_allocated is not null
select * from Projects WHERE finance_allocated IS NOT  NULL;

-- 15. SELECT Projects with the longest name
select * from Projects ORDER BY char_length(project_name) DESC LIMIT 3;

-- 16. Select Projects with a location that is not 'Mumbai'
select * from Projects WHERE location != 'Mumbai';

-- 17. Order Projects by no_of_employees
select * from Projects ORDER BY no_of_emp;

-- 18. Select the first 3 Projects
select * from Projects LIMIT 3;

-- 19. select specific name from Projects
select * from Projects WHERE project_name = 'National Highway';

-- 20. select specific columns from Projects
select project_id, project_name, location, description from Projects;




-- create table-4
create table Salaries(
salary_id int primary key,
empp_id int,
salary decimal(10,2),
position VARCHAR(100),
payment_date date,
basic_pay decimal(10,2),
bonus float,
deductions float,
HRA int,
overtime_pay int,
foreign key (empp_id) references employees (emp_id)
);

-- to display table data 
select * from  Salaries;

-- insert records in table-4
insert into Salaries(salary_id,empp_id,salary,position,payment_date,basic_pay,bonus,deductions,HRA,overtime_pay)
values
(401,101,50000.00,'Senior Engineer','2025-05-01',26000.00,15000.00,1500,2000,850),
(402,103,100000.00,'HOD','2025-05-02',40000.00, 20000.00,2500,2000,850),
(403,104,78000.00,'Senior Engineer Engineer','2025-05-01',35000.00, 15000.00,1500,2000,850),
(404,105,100000.00,'Product Engineer','2025-05-03',50000.00, 25000.00,1500,4000,850),
(405,102,56000.00,'Fresher','2025-05-02',26000.00, 20000.00,1500,2000,850),
(406,107,40000.00,'Senior Engineer','2025-05-01',26000.00, 15000.00,1500,4000,850),
(407,109,180000.00,'Manager','2025-05-03',26000.00, 30000.00,1500,6000,850),
(408,103,150000.00,'HOD','2025-05-02',26000.00, 45000.00,1500,2500,850),
(409,106,50000.00,'HR','2025-05-02',26000.00, 20000.00,1500,2000,850),
(410,108,115000.00,'Manager','2025-05-03',45000.00, 15000.00,1500,2000,850);

-- to remove values from table 
truncate table Salaries;

-- to delete table 
drop table Salaries;

-- SELECT QUERIES

-- 1. select columns from Salaries
select * from Salaries;

-- 2. select specific columns from Salaries
select salary_id, salary from Salaries;

-- 3. select specific position from Salaries
select * from Salaries WHERE position = 'Manager';

-- 4. select specific salary from Salaries
select * from Salaries WHERE salary = '100000.00';

-- 5. Count the number of Salaries
select count(*) AS total_Salaries from Salaries;

-- 6.  select specific columns from Salaries
select  salary_id, position from Salaries;

-- 7. Select Salaries with more 48000 in salary
select * from Salaries WHERE salary  > 48000;

-- 8.  Select Salaries with a position starting with 'S'
select * from Salaries WHERE position LIKE 'S%';

-- 9. Select Salaries ordered by salary
select * from Salaries ORDER BY salary;

-- 10. Select the first 5 Salaries
select * from Salaries LIMIT 5;

-- 11. Select Salaries with less than 50000 in salary
SELECT * FROM Salaries WHERE salary < 50000;

-- 12. Select Salaries with a position that does not contain 'Senior Engineer'
select * from Salaries WHERE position NOT LIKE '%Senior Engineer%';

-- 13. Select the total number of unique salary
SELECT count(DISTINCT salary) AS unique_salary from Salaries;

-- 14. select Salaries where position is not null
select * from Salaries WHERE position IS NOT  NULL;

-- 15. SELECT Salaries with the basic pay less than 20000
select * from Salaries WHERE basic_pay < 35000;

-- 16. Select Salaries with a position that is not 'Senior Engineer'
select * from Salaries WHERE position != 'Senior Engineer';

-- 17. Order Salaries by basic_pay
select * from Salaries ORDER BY basic_pay;

-- 18. Select the first 3 Salaries
select * from Salaries LIMIT 3;

-- 19. select specific position from Salaries
select * from Salaries WHERE position = 'HOD';

-- 20. select specific columns from Salaries
select  salary,position,payment_date from Salaries;



-- create table-5
create table Clients(
client_id int primary key,
client_name varchar(100),
project_id int,
email varchar(100),
phone_no varchar(20),
location varchar(50),
industry_type varchar(50),
account_status varchar(50),
company_name varchar(50),
registration_date date,
foreign key (project_id) references projects(project_id)
); 

-- to display table data 
select * from  Clients;


-- insert records into table t-5
insert into Clients(client_id,client_name,project_id,email,phone_no,location,industry_type,account_status,company_name,registration_date)
values
(501,'Rakesh Aggarwal',302,'rakesh10@gmail.com','9584002365','Mumbai','Tech','Active','TCS','1987-05-16'),
(502,'Rushikesh Sapkal',303,'rushikesh54@gmail.com','9501554869','Delhi','Construction','Active','CIDCO','1986-05-18'),
(503,'Aditya Naik',305,'aditya12@gmail.com','984100321','Bangalore','Construction','Active','L&T','1984-06-10'),
(504,'Soham Patil',301,'soham30@gmail.com','9001450863','Mumbai','Plants','Active','TCS','1987-05-16'),
(505,'Raju Gupta',306,'raju1998@gmail.com','9871003652','Kolkata','Construction','Active','L&T','1984-06-10'),
(506,'Siddhant Dube',309,'siddu1992@gmail.com','965841200','Delhi','Construction','Active','CIDCO','1986-05-18'),
(507,'Alok Patil',304,'alok18@gmail.com','9854512003','Mumbai','Tech','Active','Infosys','1975-10-20'),
(508,'Rajesh Nair',305,'rajesh.nair13@gmail.com','9854518536','Cochin','Construction','Active','CIDCO','1986-05-18'),
(509,'Vedant Ghag',302,'vedant223@gmail.com','9584001452','Gujarat','Tech','Active','Capgemini','1987-05-16'),
(510,'Aarol Fernandez',307,'aarol01@gmail.com','9563254008','Delhi','Construction','Active','TCS','1987-05-16');


-- to remove values from table 
truncate table Clients;

-- to delete table 
drop table Clients;

-- SELECT QUERIES

-- 1. select columns from Clients
select * from Clients;

-- 2. select specific columns from Clients
select client_id,client_name from Clients;

-- 3. select specific client_name from Clients
select * from Clients WHERE client_name = 'Soham Patil';

-- 4. select specific industry_type from Clients
select * from Clients WHERE industry_type = 'Tech';

-- 5. Count the number of Clients
select count(*) AS total_clients from Clients;

-- 6.  select specific columns from Clients
select  client_id, email, phone_no from Clients;

-- 7. Select Clients with industry_type containing specific word
select * from Clients WHERE industry_type  LIKE  '%Construction%';

-- 8.  Select Clients with a client_name starting with 'R'
select * from Clients WHERE client_name LIKE 'R%';

-- 9. Select Clients ordered by client_name
select * from Clients ORDER BY client_name;

-- 10. Select the first 5 Clients
select * from Clients LIMIT 5;

-- 11. select specific industry_type from Clients
select * from Clients WHERE industry_type = 'Construction';

-- 12. Select Clients with a industry_type that does not contain specific word
select * from Clients WHERE industry_type NOT LIKE '%Tech%';

-- 13. Select the total number of unique Clients
SELECT count(DISTINCT email) AS unique_email from Clients;

-- 14. select Clients where industry_type is not null
select * from Clients WHERE industry_type IS NOT  NULL;

-- 15. Select Clients ordered by client_name
select * from Clients ORDER BY client_name;

-- 16. Select Clients with a location that is not 'Delhi'
select * from Clients WHERE location != 'Delhi';

-- 17. Order Clients by registration_date
select * from Clients ORDER BY registration_date;

-- 18. Select the first 3 Clients
select * from Clients LIMIT 3;

-- 19. select specific client_name from Clients
select * from Clients WHERE client_name = 'Vedant Ghag';

-- 20. select specific columns from Clients
select  client_id, project_id, location, industry_type from Clients;




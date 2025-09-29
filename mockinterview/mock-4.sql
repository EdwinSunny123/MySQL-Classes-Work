-- create a database to work on it 
create database CompanyDB;

use CompanyDB;

SET SQL_SAFE_UPDATES = 0;
-- ------------------------------------------------------ Database Queries -----------------------------------------------

/*

Table 1: Employee(emp_id, name, gender, dob, hire_date, dept_id, salary, email)` 
Table 2: Department(dept_id, dept_name, location)`
Table 3: Project(proj_id, proj_name, start_date, end_date, budget, dept_id)
Table 4: Assignment(assign_id, emp_id, proj_id, role, hours_worked)`

*/

-- ------------------------------------------------------ Table related queries -----------------------------------------

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M','F')),
    dob DATE,
    hire_date DATE,
    dept_id INT,
    salary DECIMAL(10,2),
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Employee (emp_id, name, gender, dob, hire_date, dept_id, salary, email) VALUES
(101, 'Amit Sharma', 'M', '1990-05-12', '2015-06-01', 3, 65000, 'amit.sharma@company.com'),
(102, 'Priya Nair', 'F', '1988-09-20', '2013-08-15', 2, 72000, 'priya.nair@company.com'),
(103, 'Rajesh Kumar', 'M', '1992-01-10', '2016-02-20', 5, 48000, 'rajesh.kumar@company.com'),
(104, 'Sneha Patel', 'F', '1991-07-25', '2014-11-11', 1, 55000, 'sneha.patel@company.com'),
(105, 'Vikram Singh', 'M', '1985-03-18', '2010-05-05', 4, 80000, 'vikram.singh@company.com'),
(106, 'Neha Verma', 'F', '1993-12-05', '2017-09-01', 6, 60000, 'neha.verma@company.com'),
(107, 'Arjun Mehta', 'M', '1994-04-14', '2018-01-12', 7, 45000, 'arjun.mehta@company.com'),
(108, 'Kavita Rao', 'F', '1989-11-30', '2012-03-23', 8, 70000, 'kavita.rao@company.com');

select * from Employee;

truncate table Employee;

drop table Employee;


CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL
);

INSERT INTO Department (dept_id, dept_name, location) VALUES
(1, 'Human Resources', 'Mumbai'),
(2, 'Finance', 'Delhi'),
(3, 'IT', 'Bengaluru'),
(4, 'Marketing', 'Chennai'),
(5, 'Sales', 'Hyderabad'),
(6, 'Research', 'Pune'),
(7, 'Customer Support', 'Kolkata'),
(8, 'Administration', 'Ahmedabad');

select * from Department;

truncate table Department;

drop table Department;



CREATE TABLE Project (
    proj_id INT PRIMARY KEY,
    proj_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Project (proj_id, proj_name, start_date, end_date, budget, dept_id) VALUES
(201, 'Payroll System', '2020-01-10', '2020-12-31', 500000, 2),
(202, 'Recruitment Portal', '2021-03-01', '2021-10-30', 300000, 1),
(203, 'E-commerce Platform', '2019-05-15', '2020-05-15', 1200000, 3),
(204, 'Marketing Campaign 2021', '2021-02-01', '2021-12-15', 450000, 4),
(205, 'Sales CRM Tool', '2020-07-01', '2021-06-30', 600000, 5),
(206, 'AI Research Project', '2021-01-01', '2022-01-01', 1500000, 6),
(207, 'Customer Chatbot', '2020-09-15', '2021-09-15', 400000, 7),
(208, 'Office Automation', '2019-11-01', '2020-08-01', 250000, 8);

select * from Project;

truncate table Project;

drop table Project;


CREATE TABLE Assignment (
    assign_id INT PRIMARY KEY,
    emp_id INT,
    proj_id INT,
    role VARCHAR(50),
    hours_worked INT,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (proj_id) REFERENCES Project(proj_id)
);

INSERT INTO Assignment (assign_id, emp_id, proj_id, role, hours_worked) VALUES
(301, 101, 203, 'Developer', 120),
(302, 102, 201, 'Financial Analyst', 90),
(303, 103, 205, 'Sales Executive', 110),
(304, 104, 202, 'HR Specialist', 80),
(305, 105, 204, 'Marketing Lead', 130),
(306, 106, 206, 'Research Analyst', 150),
(307, 107, 207, 'Support Engineer', 95),
(308, 108, 208, 'Admin Officer', 100);

select * from Assignment;

truncate table Assignment;

drop table Assignment;


-- Section-1: Datatypes, Constraints, Clauses, DDL, DML, DQL, Operators

-- 2. Alter Employee table to add UNIQUE constraint on email
ALTER TABLE Employee
ADD CONSTRAINT unique_email UNIQUE (email);

-- 4. Increase all employee salaries by 10%
UPDATE Employee
SET salary = salary * 1.10;

-- 5. Delete employees not assigned to any project
DELETE FROM Employee
WHERE emp_id NOT IN (SELECT emp_id FROM Assignment);

-- 6. Employees with salary between 50k and 80k
SELECT emp_id, name, salary
FROM Employee
WHERE salary BETWEEN 50000 AND 80000;

-- 7. Employees whose names start with 'A'
SELECT emp_id, name
FROM Employee
WHERE name LIKE 'A%';

-- 8. Employees hired after 1st Jan 2020
SELECT emp_id, name, hire_date
FROM Employee
WHERE hire_date > '2020-01-01';

-- 9. Unique job roles
SELECT DISTINCT role
FROM Assignment;

-- 10. Employee count by department
SELECT dept_id, COUNT(emp_id) AS total_employees
FROM Employee
GROUP BY dept_id;

-- 11. Employees without department
SELECT emp_id, name
FROM Employee
WHERE dept_id IS NULL;

-- 12. Employees sorted by salary (high to low)
SELECT emp_id, name, salary
FROM Employee
ORDER BY salary DESC;

-- 13. Top 3 highest paid employees
SELECT emp_id, name, salary
FROM Employee
ORDER BY salary DESC
LIMIT 3;

-- 14. Employees not in IT department
SELECT e.emp_id, e.name, d.dept_name
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
WHERE d.dept_name <> 'IT';

-- 15. Developers earning less than 60k
SELECT e.emp_id, e.name, e.salary, a.role
FROM Employee e
JOIN Assignment a ON e.emp_id = a.emp_id
WHERE e.salary < 60000 AND a.role = 'Developer';

-- 16. Employees with salary above company average
SELECT emp_id, name, salary
FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- 17. Employees born in March
SELECT emp_id, name, dob
FROM Employee
WHERE MONTH(dob) = 3;

-- 18. Total salary per department
SELECT dept_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY dept_id;

-- 19. Salary classification using CASE
SELECT emp_id, name, salary,
       CASE
           WHEN salary < 50000 THEN 'Low'
           WHEN salary BETWEEN 50000 AND 80000 THEN 'Medium'
           ELSE 'High'
       END AS salary_category
FROM Employee;


-- 20. Check if Finance department exists
SELECT dept_id, dept_name
FROM Department
WHERE dept_name = 'Finance';



-- Section-2: Built-in & User Defined Functions, Joins, Subqueries, Alias 

-- 21. HR wants to know the age of each employee.
SELECT emp_id, name,
       TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age
FROM Employee;

-- 22. Display the current date from the system.
SELECT CURDATE() AS current_date;

-- 23. Show employee name + email concatenated as one column.
SELECT CONCAT(name, ' - ', email) AS name_email
FROM Employee;

-- 24. Display only the first 5 characters of employee names.
SELECT emp_id, LEFT(name, 5) AS short_name
FROM Employee;

-- 25. Print employee names in uppercase.
SELECT emp_id, UPPER(name) AS name_upper
FROM Employee;

-- 26. Calculate duration (days) of each project.
SELECT proj_id, proj_name,
       DATEDIFF(end_date, start_date) AS duration_days
FROM Project;

-- 27. Find employees earning more than 'Amit' using a subquery.
SELECT emp_id, name, salary
FROM Employee
WHERE salary > (SELECT salary FROM Employee WHERE name = 'Amit Sharma');

-- 28. Display employees earning more than the average salary of their own department.
SELECT emp_id, name, dept_id, salary
FROM Employee e
WHERE salary > (SELECT AVG(salary) 
                FROM Employee 
                WHERE dept_id = e.dept_id);
                
-- 29. Find employees working on multiple projects.
SELECT emp_id, name, COUNT(proj_id) AS project_count
FROM Assignment a
JOIN Employee e ON a.emp_id = e.emp_id
GROUP BY emp_id, name
HAVING COUNT(proj_id) > 1;

-- 30. Retrieve highest-paid employee in each department.
SELECT dept_id, name, salary
FROM Employee e1
WHERE salary = (SELECT MAX(salary) 
                FROM Employee e2 
                WHERE e1.dept_id = e2.dept_id);

-- 31. Join Employee and Department to show employee names with department names.
SELECT e.emp_id, e.name, d.dept_name
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id;

-- 32. Show all projects with their department names (INNER JOIN).
SELECT p.proj_id, p.proj_name, d.dept_name
FROM Project p
INNER JOIN Department d ON p.dept_id = d.dept_id;

-- 33. Display employees with their assigned projects (including employees without projects) (LEFT JOIN).
SELECT e.emp_id, e.name, p.proj_name
FROM Employee e
LEFT JOIN Assignment a ON e.emp_id = a.emp_id
LEFT JOIN Project p ON a.proj_id = p.proj_id;

-- 34. List all departments and their employees (including departments with no employees) (RIGHT JOIN).
SELECT e.emp_id, e.name, d.dept_name
FROM Employee e
RIGHT JOIN Department d ON e.dept_id = d.dept_id;

-- 35. Retrieve employees working on Project Alpha.
SELECT e.emp_id, e.name, a.proj_id
FROM Employee e
JOIN Assignment a ON e.emp_id = a.emp_id
JOIN Project p ON a.proj_id = p.proj_id
WHERE p.proj_name = 'Project Alpha';

-- 36. Rename columns in output using alias: employee as emp_name, department as dept_title.
SELECT e.name AS emp_name, d.dept_name AS dept_title
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id;

-- 37. Write a User Defined Function get_bonus(salary) to return 10% bonus.
DELIMITER //
CREATE FUNCTION get_bonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END;
//
DELIMITER ;

-- Example usage:
SELECT name, salary, get_bonus(salary) AS bonus
FROM Employee;

-- 38. Calculate average project budget department-wise.
SELECT d.dept_name, AVG(p.budget) AS avg_budget
FROM Project p
JOIN Department d ON p.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 39. Display employees with the second-highest salary.
SELECT emp_id, name, salary
FROM Employee
WHERE salary = (SELECT MAX(salary) 
                FROM Employee 
                WHERE salary < (SELECT MAX(salary) FROM Employee));

-- 40. Find employees whose names have exactly 5 characters.
SELECT emp_id, name
FROM Employee
WHERE CHAR_LENGTH(name) = 5;






-- ------------------------------------------------------------ Database Queries ----------------------------------------------------------

-- create a databse to store the data
CREATE DATABASE Company;

drop database Company;

-- use the database first to work on it 
use Company;

-- ------------------------------------------------------------ Database Analysis -----------------------------------------------

-- Table 1: Employees(EmpID, EmpName, Department, Salary)

-- ------------------------------------------------------------ Table related queries ------------------------------------------

-- =====================
-- Part A Commands (DDL, DML, DQL)
-- =====================

-- Table-1: Employees

Create table Employees(
EmpID INT PRIMARY KEY,
EmpName VARCHAR(50) NOT NULL,
Department VARCHAR(50),
Salary INT 
);

drop table Employees;

INSERT INTO Employees(EmpID, EmpName, Department, Salary) VALUES
(101, "Rushikesh Sapkal", "HR", 65000),
(102, "Vedant Ghag", "IT", 70000),
(103, "Joel Roy", "Mechanical", 50000),
(104, "Aman Gupta", "Finance", 40000),
(105, "Siddhant Dube", "Electrical", 95000),
(106, "Sanjay Nair", "Management", 40000),
(107, "Aniruddh Menon", "Sales", 75000),
(108, "Ishan Pednekar", "Operations", 55000),
(109, "Yash More", "Marketing", 80000),
(110, "Sahil Mhatre", "Instrumentation", 65000);

select * from Employees;

-- 2. Update the salary of an Employee 

UPDATE Employees
SET Salary = 85000 
WHERE EmpID = 105;


-- 3. SQL statement to delete employees from the Employees table where Department = 'HR'.
SET SQL_SAFE_UPDATES = 0;

DELETE FROM Employees
WHERE Department = "HR" ;

-- 4. Display all employees working in the "Finance" department.

SELECT * FROM Employees 
WHERE Department = "Finance";

-- =====================
-- Part B: Clauses
-- =====================

-- 5. Top 3 highest-paid employees

SELECT * FROM Employees 
ORDER BY SALARY DESC
LIMIT 3;

-- 6. Find the total salary paid by each department

SELECT Department, SUM(Salary) AS Total_Salary FROM Employees GROUP BY Department;

-- 7. Retrieve all employees who earn more than 50,000 but less than 80,000 

SELECT * FROM Employees
WHERE Salary BETWEEN 50000 AND 80000;

-- 8. employees whose names start with "A"

SELECT * FROM Employees 
WHERE EmpName LIKE "A%";

-- =====================
-- Part C: Constraints
-- =====================

-- 9. Create the Students table, ensure that RollNo is unique and Marks cannot be negative.

CREATE TABLE Students(
Std_Roll_No INT PRIMARY KEY UNIQUE,
Student_name varchar(50) not null,
Marks INT CHECK(Marks >= 0),
Email varchar(100)
);


-- 10. Add a NOT NULL constraint on the Email column

ALTER TABLE Employees
ADD COLUMN Email VARCHAR(100) NOT NULL;


-- 11. Create a table Orders where OrderID is the Primary Key and CustomerID is a Foreign Key referencing the Customers table.

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Email VARCHAR(100),
Address VARCHAR(150) NOT NULL
);

INSERT INTO Customers(CustomerID, Name, Email, Address) VALUES
(1001, "Vedant", "ved105@gmail.com", "Andheri"),
(1002, "Ishan", "ishan1005@gmail.com", "Bandra" ),
(1003, "Amit", "amit96@gmail.com", "Thane"),
(1004, "Shruti", "shru002@gmail.com", "Dombivli"),
(1005, "Pooja", "pooja98512@gmail.com", "Kalyan");

select * from Customers;

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
Product_name VARCHAR(100) not null,
product_price DECIMAL(10,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders(OrderID, CustomerID, Product_name, product_price) VALUES 
(101, 1002, "T.V", 65000.00),
(102, 1001, "Refigerator", 40000.00),
(103, 1004, "Washing Machine", 17000.00),
(104, 1005, "Air Conditioner", 30000.00),
(105, 1001, "Bluetooth Soundar", 20000.00);

select * from Orders;

-- =====================
-- Part D: Joins 
-- =====================

-- 12. Write a query to fetch all customer names along with their order details using an INNER JOIN.

SELECT c.Name, o.product_name, o.product_price 
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;


-- 13. Display all employees and their assigned projects. If an employee has no project, still show their name using a LEFT JOIN.

CREATE TABLE Projects(
ProjectID INT PRIMARY KEY,
EmpID INT,
Project_name VARCHAR(100) NOT NULL,
Start_date DATE,
FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

drop table Projects;

INSERT INTO Projects(ProjectID, EmpID, Project_Name, Start_date) VALUES
(001, 104, "Integrated Electrical Ecosystem", "2025-06-15"),
(002, 105, "Business Valuation", "2025-07-20"),
(003, 101, "Recruitment", "2025-05-13"),
(004, 109, "Sales 2025", "2025-03-15"),
(005, 103, "", "2025-08-15"),
(006, 102, "Software Creation", "2025-09-15"),
(007, 107, "Target 2025", "2025-07-15"),
(008, 108, "Project Horizon", "2025-06-15"),
(009, 106, "Project Elevate", "2025-07-15"),
(010, 110, "Smart Sensor Network", "2025-05-15");


select * from Projects;


SELECT e.EmpName, p.Project_name, p.Start_date
FROM Employees e
LEFT JOIN Projects p ON e.EmpID = p.EmpID;


-- 14.  List all departments and employees using a RIGHT JOIN.

SELECT e.EmpName, e.Department, p.Project_name
FROM Employees e
LEFT JOIN Projects p ON e.EmpID = p.EmpID;


-- 15. 

SELECT e.EmpID, e.EmpName, e.Department, e.Salary
FROM Employees e
LEFT JOIN Projects p ON e.EmpID = p.EmpID
WHERE p.EmpID IS NULL;



-- =====================
-- Part E: Subqueries
-- =====================


-- 17. Find the second highest salary from the Employees table using a subquery.

SELECT MAX(Salary) AS Second_Highest_Salary
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);


-- 18. Retrieve names of employees whose salary is greater than the average salary using a subquery.

SELECT EmpID, EmpName
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 19. Display employees who work in the same department as the employee named "Rohit".

SELECT EmpID, EmpName, Department, Salary
FROM Employees
WHERE Department = (
    SELECT Department
    FROM Employees
    WHERE EmpName = 'Rohit'
);


-- 20. Fetch all customers who placed orders worth more than the average order amount.

SELECT c.CustomerID, c.Name, c.Email, c.Address, SUM(o.product_price) AS TotalOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name, c.Email, c.Address
HAVING SUM(o.product_price) > (
    SELECT AVG(product_price) 
    FROM Orders
);



-- =====================
-- Part F: Built-in & User-defined Functions
-- =====================

-- 21. Use a built-in function to display the current date and time.

SELECT NOW() AS Current_Date_and_Time;

-- 22. Write a query to show the length of each employee’s name using the LENGTH() function.

SELECT EmpName, LENGTH(EmpName) AS Emp_Name_Length FROM Employees;


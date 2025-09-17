
CREATE DATABASE Electricity_Department;

USE Electricity_Department;


-- ------------------------------------------------------- Database Analysis -----------------------------------------------------
/*

Table - 1: Customer(CustomerID, Name, Address, City, Contact, ConnectionDate, Status)
Table - 2: Meter(MeterID, CustomerID, MeterType, InstallationDate, Status)
Table - 3: Bill(BillID, CustomerID, MeterID, BillMonth, UnitsConsumed, Amount, DueDate, Status)
Table - 4: Payment(PaymentID, BillID, PaymentDate, AmountPaid, Mode, Status)
Table - 5: Staff(StaffID, Name, Role, Salary, Branch)
Table - 6: Complaint(ComplaintID, CustomerID, Date, Description, Status, StaffID)

*/

-- -------------------------------------------------------- Table Related Queries -------------------------------------------------

-- Table -1: Customers

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Address VARCHAR(150),
  City VARCHAR(50),
  Contact CHAR(10) UNIQUE,
  ConnectionDate DATE,
  Status ENUM('Active', 'Inactive') DEFAULT 'Active'
);


INSERT INTO Customer (CustomerID, Name, Address, City, Contact, ConnectionDate, Status) VALUES
(101, 'Ravi Kumar', '12 MG Road', 'Bengaluru', '9876543210', '2021-01-15', 'Active'),
(102, 'Anjali Sharma', '45 Nehru Nagar', 'Mumbai', '9823456789', '2020-07-10', 'Active'),
(103, 'Suresh Reddy', '23 Gandhi Street', 'Hyderabad', '9911223344', '2019-03-25', 'Inactive'),
(104, 'Priya Nair', '78 Marine Drive', 'Kochi', '9845123456', '2022-05-18', 'Active'),
(105, 'Vikas Singh', '56 Civil Lines', 'Lucknow', '9876001234', '2021-09-09', 'Active'),
(106, 'Deepa Iyer', '19 Residency Road', 'Chennai', '9753124680', '2018-12-12', 'Inactive'),
(107, 'Rahul Mehta', '89 Ashok Nagar', 'Pune', '9988776655', '2022-11-20', 'Active'),
(108, 'Meena Patil', '34 Jayanagar', 'Bengaluru', '9812345678', '2019-08-30', 'Active'),
(109, 'Arjun Das', '11 Park Street', 'Kolkata', '9776655443', '2020-04-04', 'Active'),
(110, 'Kavita Joshi', '67 Rajendra Nagar', 'Delhi', '9900112233', '2023-02-01', 'Active');

select * from Customer;

truncate table Customer;

drop table Customer;

-- 2. Meter Table

CREATE TABLE Meter (
  MeterID INT PRIMARY KEY,
  CustomerID INT,
  MeterType VARCHAR(50) NOT NULL,
  InstallationDate DATE,
  Status ENUM('Active', 'Inactive'),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


INSERT INTO Meter (MeterID, CustomerID, MeterType, InstallationDate, Status) VALUES
(201, 101, 'Digital', '2021-01-20', 'Active'),
(202, 102, 'Analog', '2020-07-15', 'Active'),
(203, 103, 'Digital', '2019-04-01', 'Inactive'),
(204, 104, 'Digital', '2022-05-22', 'Active'),
(205, 105, 'Analog', '2021-09-12', 'Active'),
(206, 106, 'Digital', '2018-12-15', 'Inactive'),
(207, 107, 'Digital', '2022-11-25', 'Active'),
(208, 108, 'Analog', '2019-09-05', 'Active'),
(209, 109, 'Digital', '2020-04-08', 'Active'),
(210, 110, 'Digital', '2023-02-05', 'Active');

select * from Meter;

truncate table Meter;

drop table Meter;


-- 3. Bill Table

CREATE TABLE Bill (
  BillID INT AUTO_INCREMENT PRIMARY KEY,
  CustomerID INT,
  MeterID INT,
  BillMonth CHAR(7),  -- Format: YYYY-MM
  UnitsConsumed INT CHECK (UnitsConsumed >= 0),
  Amount DECIMAL(10,2) CHECK (Amount >= 0),
  DueDate DATE,
  Status varchar(20),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (MeterID) REFERENCES Meter(MeterID)
);


INSERT INTO Bill (BillID, CustomerID, MeterID, BillMonth, UnitsConsumed, Amount, DueDate, Status) VALUES
(301, 101, 201, '2023-06', 250, 1500, '2023-07-10', 'Paid'),
(302, 102, 202, '2023-06', 300, 1800, '2023-07-12', 'Unpaid'),
(303, 103, 203, '2023-05', 0, 0, '2023-06-05', 'Inactive'),
(304, 104, 204, '2023-06', 180, 1080, '2023-07-08', 'Paid'),
(305, 105, 205, '2023-06', 220, 1320, '2023-07-15', 'Paid'),
(306, 106, 206, '2023-05', 0, 0, '2023-06-02', 'Inactive'),
(307, 107, 207, '2023-06', 270, 1620, '2023-07-09', 'Unpaid'),
(308, 108, 208, '2023-06', 310, 1860, '2023-07-13', 'Paid'),
(309, 109, 209, '2023-06', 150, 900, '2023-07-07', 'Paid'),
(310, 110, 210, '2023-06', 200, 1200, '2023-07-11', 'Unpaid');

select * from Bill;

truncate table Bill;

drop table Bill;

-- 4. Payment Table

CREATE TABLE Payment (
  PaymentID INT PRIMARY KEY,
  BillID INT,
  PaymentDate DATE,
  AmountPaid DECIMAL(10,2),
  Mode ENUM('UPI','Cash','Credit Card','Net Banking','Pending','NA'),
  Status ENUM('Successful','Pending','Failed','Inactive'),
  FOREIGN KEY (BillID) REFERENCES Bill(BillID)
);


INSERT INTO Payment (PaymentID, BillID, PaymentDate, AmountPaid, Mode, Status) VALUES
(401, 301, '2023-07-05', 1500, 'UPI', 'Successful'),
(402, 302, NULL, 0, 'Pending', 'Failed'),
(403, 303, NULL, 0, 'NA', 'Inactive'),
(404, 304, '2023-07-06', 1080, 'Credit Card', 'Successful'),
(405, 305, '2023-07-10', 1320, 'Net Banking', 'Successful'),
(406, 306, NULL, 0, 'NA', 'Inactive'),
(407, 307, NULL, 0, 'Pending', 'Pending'),
(408, 308, '2023-07-09', 1860, 'Cash', 'Successful'),
(409, 309, '2023-07-04', 900, 'UPI', 'Successful'),
(410, 310, NULL, 0, 'Pending', 'Pending');

select * from Payment;

truncate table Payment;

drop table Payment;

-- 5. Staff Table

CREATE TABLE Staff (
  StaffID INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Role VARCHAR(50),
  Salary DECIMAL(10,2) CHECK (Salary >= 0),
  Branch VARCHAR(50)
);


INSERT INTO Staff (StaffID, Name, Role, Salary, Branch) VALUES
(501, 'Mahesh Rao', 'Line Inspector', 25000, 'Bengaluru'),
(502, 'Sunita Verma', 'Billing Officer', 28000, 'Mumbai'),
(503, 'Rohan Patel', 'Technician', 22000, 'Hyderabad'),
(504, 'Nisha Gupta', 'Customer Care', 20000, 'Kochi'),
(505, 'Vivek Sharma', 'Manager', 45000, 'Lucknow'),
(506, 'Alok Singh', 'Engineer', 35000, 'Chennai'),
(507, 'Pooja Mehta', 'Accountant', 30000, 'Pune'),
(508, 'Arvind Kumar', 'Technician', 24000, 'Bengaluru'),
(509, 'Sanjay Das', 'Line Inspector', 26000, 'Kolkata'),
(510, 'Swati Joshi', 'Customer Care', 21000, 'Delhi');

select * from Staff;

truncate table Staff;

drop table Staff;

-- 6. Complaint Table

CREATE TABLE Complaint (
  ComplaintID INT PRIMARY KEY,
  CustomerID INT,
  Date DATE,
  Description VARCHAR(255),
  Status ENUM('Pending','Resolved','Closed'),
  StaffID INT,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);


INSERT INTO Complaint (ComplaintID, CustomerID, Date, Description, Status, StaffID) VALUES
(601, 101, '2023-06-15', 'Voltage fluctuation issue', 'Resolved', 501),
(602, 102, '2023-06-20', 'Wrong bill generated', 'Pending', 502),
(603, 103, '2023-05-10', 'Meter not working', 'Closed', 503),
(604, 104, '2023-06-25', 'Frequent power cuts', 'Resolved', 504),
(605, 105, '2023-06-18', 'Billing mismatch', 'Resolved', 502),
(606, 106, '2023-05-22', 'Connection inactive', 'Closed', 505),
(607, 107, '2023-06-28', 'High bill amount', 'Pending', 507),
(608, 108, '2023-06-16', 'Meter reading delay', 'Resolved', 508),
(609, 109, '2023-06-30', 'Frequent outages', 'Pending', 509),
(610, 110, '2023-07-01', 'Payment not updated', 'Pending', 510);

select * from Complaint;

truncate table Complaint;

drop table Complaint;



-- Section A – Commands (DDL, DML, DQL, DCL, TCL)

-- 2. (DDL) Alter the Bill table to add a column LateFee DECIMAL(8,2
ALTER TABLE Bill
ADD COLUMN LateFee DECIMAL(8,2) DEFAULT 0;

-- 3. (DML) Insert a new record of a customer “Rahul Sharma” from Lucknow with contact 9876543210.
INSERT INTO Customer (CustomerID, Name, Address, City, Contact, ConnectionDate, Status)
VALUES (111, 'Rahul Sharma', '22 Alambagh', 'Lucknow', '9975234348', CURDATE(), 'Active');

-- 4. (DML) Update all bills where DueDate < CURRENT_DATE and set Status = 'Overdue'.
SET SQL_SAFE_UPDATES = 0;

UPDATE Bill
SET Status = 'Overdue'
WHERE DueDate < CURRENT_DATE
AND Status = 'Unpaid';

-- 5. Write a query to display CustomerName, City, and ConnectionDate of all customers connected after 2020.
SELECT Name AS CustomerName, City, ConnectionDate
FROM Customer
WHERE ConnectionDate > '2020-12-31';


-- 6. (DCL) Grant SELECT and UPDATE privilege on the Bill table to staff member ‘clerk1’.
CREATE USER 'clerk1'@'localhost' IDENTIFIED BY 'password123';

GRANT SELECT, UPDATE
ON Bill
TO 'clerk1'@'localhost';


CREATE USER  'clerk1'@'%' IDENTIFIED BY 'password456';

GRANT SELECT, UPDATE
ON Bill
TO 'clerk1'@'%';


-- 7. (TCL) Demonstrate how you will rollback a bill payment insertion in case of wrong entry.
-- Start a transaction
START TRANSACTION;

-- Insert a new payment 
INSERT INTO Payment (PaymentID, BillID, PaymentDate, AmountPaid, Mode, Status)
VALUES (411, 302, '2023-07-15', 5000, 'Cash', 'Successful');

--  Wrong entry detected, Rollback to undo the insertion
ROLLBACK;

-- Verify that the payment was NOT inserted
SELECT * FROM Payment WHERE PaymentID = 411;



-- Section B – Clauses 

-- 8. Retrieve all customers from “Delhi” using the WHERE clause
SELECT * 
FROM Customer
WHERE City = 'Delhi';

-- 9. Display customers grouped by city and count the number of connections in each city
SELECT City, COUNT(CustomerID) AS TotalConnections
FROM Customer
GROUP BY City;

-- 10. Find the maximum bill amount city-wise using GROUP BY and MAX()
SELECT C.City, MAX(B.Amount) AS MaxBillAmount
FROM Bill B
JOIN Customer C ON B.CustomerID = C.CustomerID
GROUP BY C.City;

-- 11. Display customers whose name starts with ‘A’ using the LIKE clause
SELECT * 
FROM Customer
WHERE Name LIKE 'A%';

-- 12. Show the top 5 highest bill amounts using ORDER BY and LIMIT
SELECT BillID, CustomerID, Amount
FROM Bill
ORDER BY Amount DESC
LIMIT 5;

-- 13. Find the average units consumed by customers having consumption more than 200 units (HAVING clause)
SELECT CustomerID, AVG(UnitsConsumed) AS AvgUnits
FROM Bill
GROUP BY CustomerID
HAVING AVG(UnitsConsumed) > 200;



-- Section C – Constraints 

-- 14. 

ALTER TABLE Meter
ADD CONSTRAINT chk_meter_type CHECK (MeterType IN ('Domestic','Commercial'));


-- Section D – Joins 

-- 17. Display CustomerName, MeterType, InstallationDate of all customers using an INNER JOIN
SELECT C.Name AS CustomerName, M.MeterType, M.InstallationDate
FROM Customer C
INNER JOIN Meter M ON C.CustomerID = M.CustomerID;

-- 18. Show all customers and their bills (if any) using a LEFT JOIN
SELECT C.Name AS CustomerName, B.BillID, B.BillMonth, B.Amount, B.Status
FROM Customer C
LEFT JOIN Bill B ON C.CustomerID = B.CustomerID;

-- 19. Display all staff members who have not handled any complaints using a LEFT JOIN
SELECT S.StaffID, S.Name, S.Role
FROM Staff S
LEFT JOIN Complaint C ON S.StaffID = C.StaffID
WHERE C.ComplaintID IS NULL;


-- 21. List all customers who paid after the due date using JOIN between Bill and Payment
SELECT C.Name AS CustomerName, B.BillID, B.DueDate, P.PaymentDate
FROM Customer C
JOIN Bill B ON C.CustomerID = B.CustomerID
JOIN Payment P ON B.BillID = P.BillID
WHERE P.PaymentDate > B.DueDate;

-- 22. Show CustomerName, ComplaintDescription, StaffName using JOIN on Complaint and Staff
SELECT Cu.Name AS CustomerName, Co.Description AS ComplaintDescription, S.Name AS StaffName
FROM Complaint Co
JOIN Customer Cu ON Co.CustomerID = Cu.CustomerID
JOIN Staff S ON Co.StaffID = S.StaffID;


-- Section E – Subqueries

-- 23. Find the customer with the highest bill amount (subquery in WHERE)
SELECT C.Name, B.Amount
FROM Customer C
JOIN Bill B ON C.CustomerID = B.CustomerID
WHERE B.Amount = (SELECT MAX(Amount) FROM Bill);

-- 24. Retrieve customers whose units consumed > average units consumed (subquery)
SELECT DISTINCT C.Name, B.UnitsConsumed
FROM Customer C
JOIN Bill B ON C.CustomerID = B.CustomerID
WHERE B.UnitsConsumed > (SELECT AVG(UnitsConsumed) FROM Bill);

-- 25. Find the second highest bill amount using subquery with LIMIT
SELECT Amount
FROM Bill
WHERE Amount < (SELECT MAX(Amount) FROM Bill)
ORDER BY Amount DESC
LIMIT 1;

-- 26. Display customers who have never made a payment (subquery with NOT IN)
SELECT Name
FROM Customer
WHERE CustomerID NOT IN (
    SELECT DISTINCT B.CustomerID
    FROM Bill B
    JOIN Payment P ON B.BillID = P.BillID
    WHERE P.Status = 'Successful'
);

-- 27. List customers whose due bills are more than the maximum salary of staff
SELECT C.Name, B.Amount, B.DueDate
FROM Customer C
JOIN Bill B ON C.CustomerID = B.CustomerID
WHERE B.Amount > (SELECT MAX(Salary) FROM Staff)
AND B.Status IN ('Unpaid','Overdue');

-- 28. Show the oldest connection date using subquery in SELECT
SELECT MIN(ConnectionDate) AS OldestConnectionDate
FROM Customer
WHERE ConnectionDate = (
    SELECT MIN(ConnectionDate) FROM Customer
);


-- Section F – Built-in & User-Defined Functions (

-- 29. Display the current date and time using a built-in function
SELECT NOW() AS CurrentDateTime;

-- 30. Show the first 5 characters of customer names using string functions
SELECT Name, LEFT(Name, 5) AS First5Chars
FROM Customer;

-- 31. Create a UDF GetFullName(CustomerID) that returns FirstName + ' ' + LastName.
DELIMITER //
CREATE FUNCTION GetFullName(custId INT)
RETURNS VARCHAR(200)
DETERMINISTIC
RETURN (
  SELECT Name
  FROM Customer
  WHERE CustomerID = custId
  LIMIT 1
);
DELIMITER ;

SELECT GetFullName(101) AS FullName;


-- 32. Use a built-in function to find the difference in days between DueDate and PaymentDate
SELECT B.BillID, C.Name AS CustomerName, DATEDIFF(P.PaymentDate, B.DueDate) AS DaysDifference
FROM Bill B
JOIN Payment P ON B.BillID = P.BillID
JOIN Customer C ON B.CustomerID = C.CustomerID;
















 

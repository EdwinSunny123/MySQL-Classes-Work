-- ----------------------------------- Database Queries --------------------------------------
-- Create SBI Bank database
CREATE DATABASE SBI_Bank;

-- Select the database for use
USE SBI_Bank;

-- ---------------------------------- Table Queries -----------------------------------------

-- Table-1 : Customers

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AadharNumber VARCHAR(16),
    PANNumber VARCHAR(12),
    Address TEXT,
    BranchCode VARCHAR(10)
);

INSERT INTO Customers VALUES
(1, 'Rahul Sharma', '1988-06-12', 'Male', 'rahul88@gmail.com', '9876543210', '123412341234', 'ABCDE1234F', 'Delhi, India', 'SBI001'),
(2, 'Anjali Mehta', '1992-03-25', 'Female', 'anjali25@gmail.com', '9856432109', '987698769876', 'GHYTR5678G', 'Mumbai, India', 'SBI002'),
(3, 'Amit Roy', '1985-01-10', 'Male', 'amitroy@gmail.com', '9871122334', '123456781234', 'DFGTR1234E', 'Kolkata, India', 'SBI003'),
(4, 'Pooja Nair', '1990-09-17', 'Female', 'pooja.n@gmail.com', '9934567890', '567812341234', 'POIUY6789H', 'Chennai, India', 'SBI004'),
(5, 'Vikram Sinha', '1982-12-04', 'Male', 'vikram.sinha@gmail.com', '9765432101', '345612341234', 'PLMNB2345J', 'Bangalore, India', 'SBI005'),
(6, 'Riya Sen', '1994-11-30', 'Female', 'riya.sen@gmail.com', '9823456781', '876543218765', 'LKJHG8765K', 'Hyderabad, India', 'SBI006'),
(7, 'Neeraj Das', '1987-07-23', 'Male', 'neeraj.das@gmail.com', '9812345672', '765412349876', 'MNBVC2345L', 'Ahmedabad, India', 'SBI007'),
(8, 'Seema Agarwal', '1993-04-15', 'Female', 'seema.a@gmail.com', '9743124567', '234512347654', 'QWERT1234P', 'Surat, India', 'SBI008'),
(9, 'Anil Kumar', '1989-08-12', 'Male', 'anil.k@gmail.com', '9687654321', '112233445566', 'ZXCVB3456M', 'Jaipur, India', 'SBI009'),
(10, 'Sneha Das', '1991-02-22', 'Female', 'sneha.d@gmail.com', '9765123890', '667788990011', 'ASDFG5678T', 'Bhopal, India', 'SBI010'),
(11, 'Aditya Mehra', '1990-03-11', 'Male', 'aditya.m@gmail.com', '9845000001', '123400000123', 'PQWER6789Z', 'Lucknow, India', 'SBI011'),
(12, 'Divya Thakur', '1995-06-19', 'Female', 'divya.t@gmail.com', '9789456123', '234500000123', 'LKJHG0001A', 'Kanpur, India', 'SBI012'),
(13, 'Manish Tiwari', '1984-05-15', 'Male', 'manish.t@gmail.com', '9876541290', '321654987000', 'ZMXNB7890D', 'Nagpur, India', 'SBI013'),
(14, 'Priya Kaur', '1987-07-21', 'Female', 'priya.k@gmail.com', '9712314567', '654321009876', 'REWQ1234AS', 'Amritsar, India', 'SBI014'),
(15, 'Kunal Ghosh', '1992-10-01', 'Male', 'kunal.g@gmail.com', '9834567890', '223344556677', 'IUYTRE4321Z', 'Guwahati, India', 'SBI015'),
(16, 'Rachna Pathak', '1989-12-12', 'Female', 'rachna.p@gmail.com', '9854123987', '334455667788', 'OIUYT5678B', 'Indore, India', 'SBI016'),
(17, 'Saurabh Jain', '1985-08-08', 'Male', 'saurabh.j@gmail.com', '9723456789', '445566778899', 'XCVBN2345U', 'Kota, India', 'SBI017'),
(18, 'Meera Joshi', '1991-09-09', 'Female', 'meera.j@gmail.com', '9745123467', '556677889900', 'TREWQ3456N', 'Raipur, India', 'SBI018'),
(19, 'Arun Verma', '1993-06-06', 'Male', 'arun.v@gmail.com', '9887654321', '667788990011', 'NBVCX9876P', 'Agra, India', 'SBI019'),
(20, 'Meena Kapoor', '1991-08-09', 'Female', 'meenak@gmail.com', '9945362819', '673498761234', 'FHTRE7865J', 'Pune, India', 'SBI020');

-- Display all customers
SELECT * FROM Customers;

-- Delete all customer records but keep the table structure
TRUNCATE TABLE Customers;

-- Completely remove the Customers table from the database
DROP TABLE Customers;

-- Select Queries

-- 1. Select specific columns from customer stable 
Select CustomerID, FullName, Phone from Customers;

-- 2. Select based on specific condition 
Select * from Customers where FullName = 'Rahul Sharma';

-- 3. Select all male customers 
select * from Customers Where Gender = 'Male';

-- 4. Select first 5 customers
select * from customers Limit 5;

-- 5. Select customrs oorder by name 
select * from customers ORDER BY FullName;


-- Alter Queries 

-- 1. Add a new column 
ALTER TABLE Customers
ADD column Customer_occupation varchar(50) not null;


-- 2. Modify an existing column 
ALTER TABLE Customers
MODIFY COLUMN ADDRESS VARCHAR(50) not null;

-- 3. Rename a column 
ALTER TABLE Customers
change column Email Email_id varchar(50);

-- 4. Set a deafult a value to a column 
ALTER TABLE Customers
ALTER COLUMN ADDRESS SET DEFAULT 'India';

-- 5. drop a column 
ALTER TABLE Customers
DROP COLUMN Customer_occupation;

-- Delete Queries

-- 1. Delete specific record 
DELETE FROM Customers
WHERE fullname = 'Amit Roy';

-- 2. Delete all female customers
DELETE FROM Customers
WHERE Gender = 'Female';

-- 3. Delete customers after certain birth date
DELETE FROM Customers
WHERE DOB > '1980-01-01';

-- 4. Delete specific records 
DELETE FROM Customers
WHERE CustomerID = 5;

-- Rename Queries

-- 1. Rename the name of the table 
ALTER TABLE Customers RENAME TO Customer_info;

-- 2. Rename the name of the column 
ALTER TABLE Customer_info RENAME COLUMN Email_id TO Email;

-- 3. Reanme the name of the coumn 
ALTER TABLE Customer_info RENAME COLUMN ADDRESS TO LOCATION;

-- 4. Rename the table name 
ALTER TABLE Customer_info RENAME TO Customers;


set sql_safe_updates = 0;


-- UPDATE QUERIES

-- 1. Update the name of a customer
UPDATE Customers 
SET FullName = 'Amit Rajeev'
WHERE DOB = '1989-08-12';

-- 2. Update the DOB of a customer
UPDATE Customers
set DOB = '1995-05-06'
where FullName = 'Sneha Das';



-- Clauses Queries

-- 1. Select Specific record from table 
SELECT * FROM Customers WHERE fullname = 'Amit Rajeev';

-- 2. Select the first 5 customers order by DOB
Select * from Customers order by DOB Limit 5;

-- 3. Select the customers by location 
SELECT ADDRESS , COUNT(*) AS TOTAL_address  from Customers
GROUP BY ADDRESS
HAVING COUNT(*) > 5;

-- 4. Select 5 customers offset 10
SELECT * FROM Customers LIMIT 5 OFFSET 10;

-- 5. 
Select c.cutomerid, c.fullname, a.accountid, a.accounttype
From Customer c
INNER JOIN Accounts a ON c.Customerid = a.customerid;

-- 6. create a query to insert cutomers into into new table 
Select customerid, fullname, dob
into new_customer_table
from Customers
WHERE fullname = 'Priya Kaur';

-- 7. SDelect customers between a raneg of DOB 
SELECT * FROM CUSTOMERS 
WHERE dob BETWEEN '1985-01-01' AND '2000-01-01';

-- 8. SELECT the first 6 customers 
SELECT * FROM CUSTOMERS LIMIT 6;

-- 9. Select the first 5 customers order by DOB
Select * from Customers order by DOB Limit 5;

-- 10. 
SELECT c.customerid, c.fullname, c.dob
from customers c 
where fullname = 'Priya Kaur';


-- Operators queries

-- 1. Select customers based on specific date 
SELECT * FROM CUSTOMERS WHERE DOB = '1993-06-06';

-- 2. Select customers whose dob is after a ceratin date 
select * from customers  WHERE DOB > '1990-01-01';

-- 3. Select customers whose dob is before a certain date 
SELECT * FROM CUSTOMERS WHERE DOB < '1990-01-01';

-- 4. select customers based on specific condition 
SELECT * FROM CUSTOMERS where  FULLNAME = 'Sneha Das';

-- 5. Select customers based on specific condition
SELECT * FROM Customers WHERE address != 'Pune, India';

-- 6. SELECT CUSTOMERS containg a specific word 
SELECT * FROM CUSTOMERS WHERE ADDRESS LIKE '%India%';

-- 7. Select customers starting a letter 
SELECT * FROM CUSTOMERS WHERE Fullname like 'A%';

-- 8. Select customers BASED on multiple conditions 
SELECT Customerid, fullname, phone from Customers
where fullname = 'Pooja Nair'
and phone = '9934567890';

-- 9. Select customers based on multiple conditions 
SELECT customerid, fullname, phone from Customers
where fullname = 'Amit Rajeev'
OR phone = '9945362819';

-- 10. Select customers whose address is not Delhi
SELECT * FROM CUSTOMERS 
WHERE NOT ADDRESS = 'Delhi, India';


-- Functions Queries 

-- 1. Combine full name and email ID for all customers using CONCAT()
SELECT CustomerID, CONCAT(FullName, ' - ', Email) AS ContactInfo
FROM Customers;

-- 2. Display full names in uppercase using UPPER()
SELECT CustomerID, UPPER(FullName) AS NameInUpperCase
FROM Customers;

-- 3. Find the length of each customer's Aadhar number using LENGTH()
SELECT CustomerID, FullName, LENGTH(AadharNumber) AS AadharLength
FROM Customers;

-- 4. Compare character length vs byte length of PANNumber using CHAR_LENGTH() and LENGTH()
SELECT CustomerID, FullName, CHAR_LENGTH(PANNumber) AS CharLen, LENGTH(PANNumber) AS ByteLen
FROM Customers;

-- 5. Display customer names along with their birth year using YEAR()
SELECT FullName, YEAR(DOB) AS BirthYear
FROM Customers;

-- 6. Calculate age of each customer in years using TIMESTAMPDIFF()
SELECT FullName, TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS Age
FROM Customers;

-- 7. Count how many male and female customers exist using COUNT()
SELECT Gender, COUNT(*) AS TotalCount
FROM Customers
GROUP BY Gender;

-- 8. Find the oldest and youngest customer birthdate using MAX() and MIN()
SELECT MAX(DOB) AS YoungestDOB, MIN(DOB) AS OldestDOB
FROM Customers;

-- 9. Show if the customer is a senior citizen (60+ years) using IF()
SELECT FullName, DOB,
       IF(TIMESTAMPDIFF(YEAR, DOB, CURDATE()) >= 60, 'Senior Citizen', 'Adult') AS AgeCategory
FROM Customers;

-- 10. Categorize customers by age group using CASE WHEN
SELECT FullName,
       CASE
           WHEN TIMESTAMPDIFF(YEAR, DOB, CURDATE()) < 30 THEN 'Young Adult'
           WHEN TIMESTAMPDIFF(YEAR, DOB, CURDATE()) BETWEEN 30 AND 50 THEN 'Middle-aged'
           ELSE 'Senior'
       END AS AgeGroup
FROM Customers;




-- Table-2: Accounts

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    OpenDate DATE,
    Balance DECIMAL(12,2),
    IFSCCode VARCHAR(11),
    BranchCode VARCHAR(10),
    Status VARCHAR(10),
    NomineeName VARCHAR(100),
    Currency VARCHAR(5),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Accounts VALUES
(101, 1, 'Savings', '2020-01-15', 55000.75, 'SBIN000001', 'SBI001', 'Active', 'Reena Sharma', 'INR'),
(102, 2, 'Current', '2019-05-22', 125000.00, 'SBIN000002', 'SBI002', 'Active', 'Vijay Mehta', 'INR'),
(103, 3, 'Savings', '2021-11-10', 67000.00, 'SBIN000003', 'SBI003', 'Active', 'Asha Roy', 'INR'),
(104, 4, 'Savings', '2018-07-09', 89000.00, 'SBIN000004', 'SBI004', 'Active', 'Pritam Nair', 'INR'),
(105, 5, 'Current', '2022-01-01', 32000.00, 'SBIN000005', 'SBI005', 'Active', 'Kiran Sinha', 'INR'),
(106, 6, 'Savings', '2020-06-15', 47000.90, 'SBIN000006', 'SBI006', 'Active', 'Aman Sen', 'INR'),
(107, 7, 'Savings', '2021-02-25', 51000.50, 'SBIN000007', 'SBI007', 'Active', 'Sonal Das', 'INR'),
(108, 8, 'Current', '2017-09-10', 95000.00, 'SBIN000008', 'SBI008', 'Active', 'Vivek Agarwal', 'INR'),
(109, 9, 'Savings', '2023-04-20', 22000.00, 'SBIN000009', 'SBI009', 'Active', 'Rina Kumar', 'INR'),
(110, 10, 'Savings', '2019-12-12', 34000.00, 'SBIN000010', 'SBI010', 'Active', 'Neeraj Das', 'INR'),
(111, 11, 'Savings', '2021-08-12', 78000.45, 'SBIN000011', 'SBI011', 'Active', 'Priya Mehra', 'INR'),
(112, 12, 'Current', '2022-03-19', 125000.00, 'SBIN000012', 'SBI012', 'Active', 'Ajay Thakur', 'INR'),
(113, 13, 'Savings', '2023-01-23', 33000.00, 'SBIN000013', 'SBI013', 'Active', 'Anita Tiwari', 'INR'),
(114, 14, 'Savings', '2020-10-14', 59000.00, 'SBIN000014', 'SBI014', 'Active', 'Karan Kaur', 'INR'),
(115, 15, 'Current', '2021-04-18', 40500.00, 'SBIN000015', 'SBI015', 'Active', 'Deepak Ghosh', 'INR'),
(116, 16, 'Savings', '2019-11-11', 22000.00, 'SBIN000016', 'SBI016', 'Active', 'Nidhi Pathak', 'INR'),
(117, 17, 'Savings', '2020-05-30', 47000.50, 'SBIN000017', 'SBI017', 'Active', 'Tarun Jain', 'INR'),
(118, 18, 'Current', '2022-06-22', 110000.00, 'SBIN000018', 'SBI018', 'Active', 'Ankit Joshi', 'INR'),
(119, 19, 'Savings', '2023-03-03', 56000.00, 'SBIN000019', 'SBI019', 'Active', 'Radhika Verma', 'INR'),
(120, 20, 'Savings', '2023-07-07', 43250.50, 'SBIN000020', 'SBI020', 'Active', 'Amit Kapoor', 'INR');

-- Show all accounts
SELECT * FROM Accounts;

-- Delete all account records but keep the structure
TRUNCATE TABLE Accounts;

-- Completely remove the Accounts table
DROP TABLE Accounts;


-- Select Queries 

-- 1. Select AccountID and Balance
SELECT AccountID, Balance FROM Accounts;

-- 2. Select all savings accounts
SELECT * FROM Accounts WHERE AccountType = 'Savings';

-- 3. Select accounts with balance greater than 50000
SELECT * FROM Accounts WHERE Balance > 50000;

-- 4. Select accounts ordered by OpenDate descending
SELECT * FROM Accounts ORDER BY OpenDate DESC;

-- 5. Select distinct account types
SELECT DISTINCT AccountType FROM Accounts;


-- ALTER QUERIES 

-- 6. Add a column 'InterestRate'
ALTER TABLE Accounts ADD InterestRate DECIMAL(5,2);

-- 7. Change datatype of Balance column
ALTER TABLE Accounts MODIFY Balance DECIMAL(15,2);

-- 8. Rename column Status to AccountStatus
ALTER TABLE Accounts CHANGE Status AccountStatus VARCHAR(15);

-- 9. Drop IFSCCode column
ALTER TABLE Accounts DROP COLUMN IFSCCode;

-- 10. Set default for Currency column
ALTER TABLE Accounts ALTER COLUMN Currency SET DEFAULT 'INR';

-- update queries 


-- 11. Set status to 'Inactive' for AccountID 101
UPDATE Accounts SET Status = 'Inactive' WHERE AccountID = 101;

-- 12. Add 1000 to balance for AccountID 102
UPDATE Accounts SET Balance = Balance + 1000 WHERE AccountID = 102;

-- 13. Change AccountType to 'Current' for AccountID 103
UPDATE Accounts SET AccountType = 'Current' WHERE AccountID = 103;

-- 14. Set Currency to 'USD' for AccountID 104
UPDATE Accounts SET Currency = 'USD' WHERE AccountID = 104;

-- 15. Set NomineeName to 'Rohit Sharma' for AccountID 105
UPDATE Accounts SET NomineeName = 'Rohit Sharma' WHERE AccountID = 105;


-- DELETE QUERIES 

-- 16. Delete account with AccountID = 106
DELETE FROM Accounts WHERE AccountID = 106;

-- 17. Delete all inactive accounts
DELETE FROM Accounts WHERE AccountStatus = 'Inactive';

-- 18. Delete all zero balance accounts
DELETE FROM Accounts WHERE Balance = 0;

-- 19. Delete accounts with null nominee name
DELETE FROM Accounts WHERE NomineeName IS NULL;

-- 20. Delete all accounts opened before 2020
DELETE FROM Accounts WHERE OpenDate < '2020-01-01';

-- operators 

-- 21. Accounts with balance != 20000
SELECT * FROM Accounts WHERE Balance != 20000;

-- 22. Accounts with balance > 30000
SELECT * FROM Accounts WHERE Balance > 30000;

-- 23. Accounts with balance < 10000
SELECT * FROM Accounts WHERE Balance < 10000;

-- 24. Accounts with balance BETWEEN 10000 AND 50000
SELECT * FROM Accounts WHERE Balance BETWEEN 10000 AND 50000;

-- 25. Accounts with AccountType IN ('Savings', 'Current')
SELECT * FROM Accounts WHERE AccountType IN ('Savings', 'Current');

-- 26. Accounts with AccountType NOT IN ('Loan')
SELECT * FROM Accounts WHERE AccountType NOT IN ('Loan');

-- 27. Accounts with nominee name LIKE 'A%'
SELECT * FROM Accounts WHERE NomineeName LIKE 'A%';

-- 28. Accounts with nominee name IS NOT NULL
SELECT * FROM Accounts WHERE NomineeName IS NOT NULL;

-- 29. Accounts opened after 2022-01-01
SELECT * FROM Accounts WHERE OpenDate > '2022-01-01';

-- 30. Accounts where BranchCode = 'SBI001' AND Currency = 'INR'
SELECT * FROM Accounts WHERE BranchCode = 'SBI001' AND Currency = 'INR';


-- CLAUSES 

-- 31. Count of accounts by type
SELECT AccountType, COUNT(*) FROM Accounts GROUP BY AccountType;

-- 32. Total balance by branch
SELECT BranchCode, SUM(Balance) FROM Accounts GROUP BY BranchCode;

-- 33. Average balance by AccountType
SELECT AccountType, AVG(Balance) FROM Accounts GROUP BY AccountType;

-- 34. Group by status and show those having more than 2 accounts
SELECT Status, COUNT(*) FROM Accounts GROUP BY Status HAVING COUNT(*) > 2;

-- 35. List top 5 accounts with highest balance
SELECT * FROM Accounts ORDER BY Balance DESC LIMIT 5;

-- 36. List top 3 recently opened accounts
SELECT * FROM Accounts ORDER BY OpenDate DESC LIMIT 3;

-- 37. List 5 accounts skipping the first 5 (offset)
SELECT * FROM Accounts LIMIT 5 OFFSET 5;

-- 38. Accounts grouped by currency
SELECT Currency, COUNT(*) FROM Accounts GROUP BY Currency;

-- 39. Maximum balance by branch
SELECT BranchCode, MAX(Balance) FROM Accounts GROUP BY BranchCode;

-- 40. Minimum balance for each AccountType
SELECT AccountType, MIN(Balance) FROM Accounts GROUP BY AccountType;


-- FUNCTIONS  

-- 41. Round balance to nearest 100
SELECT AccountID, ROUND(Balance, -2) AS RoundedBalance FROM Accounts;

-- 42. Year account was opened
SELECT AccountID, YEAR(OpenDate) AS OpenYear FROM Accounts;

-- 43. Show length of IFSCCode
SELECT AccountID, LENGTH(IFSCCode) AS IFSC_Length FROM Accounts;

-- 44. Show uppercased AccountType
SELECT AccountID, UPPER(AccountType) AS TypeCaps FROM Accounts;

-- 45. Substring first 3 letters of NomineeName
SELECT AccountID, SUBSTRING(NomineeName, 1, 3) AS Initials FROM Accounts;

-- 46. Find current date
SELECT NOW() AS CurrentDateTime;

-- 47. Calculate 10% of balance
SELECT AccountID, Balance * 0.10 AS TenPercent FROM Accounts;

-- 48. Replace 'Savings' with 'SAV' in AccountType
SELECT REPLACE(AccountType, 'Savings', 'SAV') FROM Accounts;

-- 49. Extract month from OpenDate
SELECT AccountID, MONTH(OpenDate) AS OpenMonth FROM Accounts;

-- 50. Use CASE to categorize balance
SELECT AccountID,
  CASE 
    WHEN Balance >= 100000 THEN 'High'
    WHEN Balance >= 50000 THEN 'Medium'
    ELSE 'Low'
  END AS BalanceCategory
FROM Accounts;




--  Table-3: Transactions

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Type VARCHAR(10),
    Amount DECIMAL(10,2),
    Description TEXT,
    Mode VARCHAR(20),
    Status VARCHAR(10),
    BalanceAfter DECIMAL(12,2),
    BranchCode VARCHAR(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Transactions VALUES
(1001, 101, '2024-06-10', 'Credit', 5000.00, 'Salary credited', 'NEFT', 'Success', 60000.75, 'SBI001'),
(1002, 101, '2024-06-15', 'Debit', 2000.00, 'Mobile recharge', 'UPI', 'Success', 58000.75, 'SBI001'),
(1003, 102, '2024-05-22', 'Debit', 1500.00, 'Electricity bill', 'Net Banking', 'Success', 123500.00, 'SBI002'),
(1004, 103, '2024-07-01', 'Credit', 20000.00, 'Cheque deposit', 'Cheque', 'Success', 87000.00, 'SBI003'),
(1005, 104, '2024-07-02', 'Debit', 500.00, 'ATM Withdrawal', 'ATM', 'Success', 88500.00, 'SBI004'),
(1006, 105, '2024-06-20', 'Credit', 10000.00, 'UPI received', 'UPI', 'Success', 42000.00, 'SBI005'),
(1007, 106, '2024-05-10', 'Debit', 1500.00, 'Online shopping', 'UPI', 'Success', 45500.90, 'SBI006'),
(1008, 107, '2024-07-15', 'Debit', 2500.00, 'Fuel payment', 'Card', 'Success', 48500.50, 'SBI007'),
(1009, 108, '2024-06-30', 'Credit', 7000.00, 'Client payment', 'IMPS', 'Success', 102000.00, 'SBI008'),
(1010, 109, '2024-05-18', 'Debit', 1000.00, 'Recharge', 'UPI', 'Success', 21000.00, 'SBI009'),
(1011, 110, '2024-07-05', 'Credit', 5000.00, 'Salary', 'NEFT', 'Success', 39000.00, 'SBI010'),
(1012, 111, '2024-06-12', 'Debit', 2000.00, 'Shopping', 'UPI', 'Success', 76000.45, 'SBI011'),
(1013, 112, '2024-05-25', 'Credit', 15000.00, 'Cheque', 'Cheque', 'Success', 140000.00, 'SBI012'),
(1014, 113, '2024-06-07', 'Debit', 2000.00, 'Rent', 'NEFT', 'Success', 31000.00, 'SBI013'),
(1015, 114, '2024-05-29', 'Debit', 1000.00, 'Petrol', 'UPI', 'Success', 58000.00, 'SBI014'),
(1016, 115, '2024-07-18', 'Credit', 10000.00, 'Client Payment', 'IMPS', 'Success', 50500.00, 'SBI015'),
(1017, 116, '2024-06-25', 'Debit', 500.00, 'Bill Payment', 'Net Banking', 'Success', 21500.00, 'SBI016'),
(1018, 117, '2024-07-03', 'Credit', 12000.00, 'Cash Deposit', 'Cash', 'Success', 59000.50, 'SBI017'),
(1019, 118, '2024-06-17', 'Debit', 1000.00, 'Restaurant', 'Card', 'Success', 109000.00, 'SBI018'),
(1020, 119, '2024-07-21', 'Credit', 8000.00, 'Transfer from friend', 'UPI', 'Success', 64000.00, 'SBI019');

-- Show all transactions
SELECT * FROM Transactions;

-- Remove all transaction records (preserves structure)
TRUNCATE TABLE Transactions;

-- Delete the Transactions table permanently
DROP TABLE Transactions;


-- SELECT QUERIES 

-- 1. Select TransactionID and Amount
SELECT TransactionID, Amount FROM Transactions;

-- 2. Select all credit transactions
SELECT * FROM Transactions WHERE Type = 'Credit';

-- 3. Select transactions above ₹10,000
SELECT * FROM Transactions WHERE Amount > 10000;

-- 4. Select transactions ordered by TransactionDate
SELECT * FROM Transactions ORDER BY TransactionDate DESC;

-- 5. Select distinct modes of transaction
SELECT DISTINCT Mode FROM Transactions;

-- ALTER QUERIES 

-- 6. Add column Charges
ALTER TABLE Transactions ADD Charges DECIMAL(10,2);

-- 7. Modify Amount to hold larger values
ALTER TABLE Transactions MODIFY Amount DECIMAL(15,2);

-- 8. Rename column Type to TransactionType
ALTER TABLE Transactions CHANGE Type TransactionType VARCHAR(15);

-- 9. Drop column Description
ALTER TABLE Transactions DROP COLUMN Description;

-- 10. Set default status as 'Success'
ALTER TABLE Transactions ALTER COLUMN Status SET DEFAULT 'Success';


-- UPDATE QUERIES 
-- 11. Update mode to 'Online' for UPI transactions
UPDATE Transactions SET Mode = 'Online' WHERE Mode = 'UPI';

-- 12. Set status to 'Failed' for TransactionID 1002
UPDATE Transactions SET Status = 'Failed' WHERE TransactionID = 1002;

-- 13. Add ₹500 to amount where TransactionID = 1010
UPDATE Transactions SET Amount = Amount + 500 WHERE TransactionID = 1010;

-- 14. Change TransactionType to 'Withdrawal' for ATM transactions
UPDATE Transactions SET TransactionType = 'Withdrawal' WHERE Mode = 'ATM';

-- 15. Change BranchCode to 'SBI999' for TransactionID = 1001
UPDATE Transactions SET BranchCode = 'SBI999' WHERE TransactionID = 1001;


-- DELETE QUERIES

-- 16. Delete transaction with ID 1015
DELETE FROM Transactions WHERE TransactionID = 1015;

-- 17. Delete all failed transactions
DELETE FROM Transactions WHERE Status = 'Failed';

-- 18. Delete debit transactions below ₹1000
DELETE FROM Transactions WHERE TransactionType = 'Debit' AND Amount < 1000;

-- 19. Delete transactions from SBI013 branch
DELETE FROM Transactions WHERE BranchCode = 'SBI013';

-- 20. Delete transactions before 2024-06-01
DELETE FROM Transactions WHERE TransactionDate < '2024-06-01';


-- OPERATORS 

-- 21. Transactions not equal to ₹5000
SELECT * FROM Transactions WHERE Amount != 5000;

-- 22. Transactions greater than ₹7000
SELECT * FROM Transactions WHERE Amount > 7000;

-- 23. Transactions less than ₹2000
SELECT * FROM Transactions WHERE Amount < 2000;

-- 24. Transactions between ₹2000 and ₹10000
SELECT * FROM Transactions WHERE Amount BETWEEN 2000 AND 10000;

-- 25. Transactions of type 'Credit' or 'Debit'
SELECT * FROM Transactions WHERE TransactionType IN ('Credit', 'Debit');

-- 26. Transactions not done via 'Cheque'
SELECT * FROM Transactions WHERE Mode NOT IN ('Cheque');

-- 27. Transactions with mode starting with 'C'
SELECT * FROM Transactions WHERE Mode LIKE 'C%';

-- 28. Transactions with Description IS NOT NULL
SELECT * FROM Transactions WHERE Description IS NOT NULL;

-- 29. Transactions made on or after 2024-07-01
SELECT * FROM Transactions WHERE TransactionDate >= '2024-07-01';

-- 30. Transactions with status 'Success' AND type 'Debit'
SELECT * FROM Transactions WHERE Status = 'Success' AND TransactionType = 'Debit';


-- CLAUSES 

-- 31. Total amount per transaction type
SELECT TransactionType, SUM(Amount) FROM Transactions GROUP BY TransactionType;

-- 32. Average transaction amount per branch
SELECT BranchCode, AVG(Amount) FROM Transactions GROUP BY BranchCode;

-- 33. Count of transactions per mode
SELECT Mode, COUNT(*) FROM Transactions GROUP BY Mode;

-- 34. Branches with total amount > ₹20000
SELECT BranchCode, SUM(Amount) AS TotalAmount
FROM Transactions
GROUP BY BranchCode
HAVING SUM(Amount) > 20000;

-- 35. Top 5 highest amount transactions
SELECT * FROM Transactions ORDER BY Amount DESC LIMIT 5;

-- 36. Last 5 transactions
SELECT * FROM Transactions ORDER BY TransactionDate DESC LIMIT 5;

-- 37. Skip first 5 and show next 5 transactions
SELECT * FROM Transactions ORDER BY TransactionDate DESC LIMIT 5 OFFSET 5;

-- 38. Show total balance after all transactions per account
SELECT AccountID, MAX(BalanceAfter) FROM Transactions GROUP BY AccountID;

-- 39. Count of credit transactions by branch
SELECT BranchCode, COUNT(*) FROM Transactions 
WHERE TransactionType = 'Credit' GROUP BY BranchCode;

-- 40. Mode with max average amount
SELECT Mode, AVG(Amount) AS AvgAmt FROM Transactions GROUP BY Mode ORDER BY AvgAmt DESC LIMIT 1;


-- FUNCTIONS 

-- 41. Round Amount to nearest 100
SELECT TransactionID, ROUND(Amount, -2) AS RoundedAmount FROM Transactions;

-- 42. Extract year of transaction
SELECT TransactionID, YEAR(TransactionDate) AS TransYear FROM Transactions;

-- 43. Length of transaction mode
SELECT TransactionID, LENGTH(Mode) AS ModeLength FROM Transactions;

-- 44. Uppercase mode
SELECT TransactionID, UPPER(Mode) AS ModeCaps FROM Transactions;

-- 45. First 3 characters of description
SELECT TransactionID, SUBSTRING(Description, 1, 3) AS ShortDesc FROM Transactions;

-- 46. Current system time
SELECT NOW() AS CurrentTime;

-- 47. Add 18% GST to each transaction
SELECT TransactionID, Amount, Amount * 1.18 AS WithGST FROM Transactions;

-- 48. Replace 'UPI' with 'Unified Payment'
SELECT TransactionID, REPLACE(Mode, 'UPI', 'Unified Payment') FROM Transactions;

-- 49. Get month of each transaction
SELECT TransactionID, MONTH(TransactionDate) AS Month FROM Transactions;

-- 50. Categorize transactions based on amount
SELECT TransactionID,
  CASE 
    WHEN Amount >= 10000 THEN 'High Value'
    WHEN Amount >= 5000 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS ValueCategory
FROM Transactions;





-- Table-4: Loans

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(20),
    Amount DECIMAL(12,2),
    StartDate DATE,
    TenureMonths INT,
    InterestRate FLOAT,
    EMI DECIMAL(10,2),
    Status VARCHAR(10),
    BranchCode VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Loans VALUES
(201, 1, 'Home', 2500000.00, '2023-01-01', 240, 7.5, 22345.67, 'Active', 'SBI001'),
(202, 2, 'Car', 800000.00, '2023-05-10', 60, 9.2, 16543.00, 'Active', 'SBI002'),
(203, 3, 'Personal', 200000.00, '2024-01-15', 36, 11.5, 6720.45, 'Active', 'SBI003'),
(204, 4, 'Education', 400000.00, '2022-06-01', 48, 10.0, 10450.30, 'Active', 'SBI004'),
(205, 5, 'Home', 1500000.00, '2023-04-20', 180, 8.0, 15400.00, 'Active', 'SBI005'),
(206, 6, 'Car', 950000.00, '2022-03-01', 60, 9.5, 17250.20, 'Active', 'SBI006'),
(207, 7, 'Business', 1200000.00, '2023-07-10', 84, 8.9, 19300.00, 'Active', 'SBI007'),
(208, 8, 'Education', 350000.00, '2021-08-15', 48, 10.2, 9450.00, 'Active', 'SBI008'),
(209, 9, 'Home', 1800000.00, '2023-09-01', 240, 7.0, 19800.50, 'Active', 'SBI009'),
(210, 10, 'Car', 600000.00, '2022-02-20', 60, 9.1, 13450.00, 'Active', 'SBI010'),
(211, 11, 'Personal', 250000.00, '2023-11-10', 36, 11.2, 7300.00, 'Active', 'SBI011'),
(212, 12, 'Home', 3000000.00, '2022-12-12', 240, 6.9, 24500.00, 'Active', 'SBI012'),
(213, 13, 'Education', 420000.00, '2023-05-01', 60, 10.4, 9900.00, 'Active', 'SBI013'),
(214, 14, 'Car', 700000.00, '2021-10-10', 48, 9.3, 15000.00, 'Active', 'SBI014'),
(215, 15, 'Home', 2200000.00, '2022-01-05', 240, 7.2, 21400.00, 'Active', 'SBI015'),
(216, 16, 'Business', 1000000.00, '2022-06-25', 120, 8.8, 19500.00, 'Active', 'SBI016'),
(217, 17, 'Personal', 300000.00, '2023-04-14', 36, 11.0, 8800.00, 'Active', 'SBI017'),
(218, 18, 'Education', 250000.00, '2022-07-07', 48, 10.5, 7800.00, 'Active', 'SBI018'),
(219, 19, 'Car', 850000.00, '2023-03-03', 60, 9.0, 15800.00, 'Active', 'SBI019'),
(220, 20, 'Personal', 200000.00, '2024-03-20', 36, 11.5, 6720.45, 'Active', 'SBI020');

-- List all home loans above ₹20 lakhs
SELECT * FROM Loans;

-- Clear all loan records
TRUNCATE TABLE Loans;

-- Delete the Loans table from database
DROP TABLE Loans;


-- SELECT QUERIES 

-- 1. Select specific columns from table
SELECT LoanID, LoanType, Amount from Loans;

-- 2. Select loans based on specific ondition 
SELECT * FROM LOANS where LOANType = 'Car';

-- 3. Select loans below a certain amaount 
SELECT * FROM LOANS WHERE AMOUNT < 350000.00;

-- 4. Select first 5 loan records 
SELECT * FROM LOANS LIMIT 5;

-- 5. Select distinct loan type
SELECT DISTINCT LoanType FROM Loans;


-- ALTER QUERIES

-- 1. Add a new column 
ALTER TABLE Loans 
ADD COLUMN Amount_left int not null;

-- 2. Modify a column 
ALTER TABLE Loans
MODIFY COLUMN EMI DECIMAL(15,2) not null;

-- 3. Drop a column 
ALTER TABLE Loans
DROP COLUMN  TenureMonths;

-- 4. Set a default value to column 
ALTER TABLE Loans 
ALTER COLUMN Status SET DEFAULT 'Active';

-- 5. Rename the column 
ALTER TABLE Loans
CHANGE COLUMN LoanType Type_of_Loan varchar(50);

-- UPADTE QUERIES 

-- 1. Update the loan type 
UPDATE LOANS
SET Type_of_Loan = 'House'
WHERE Amount = 1200000.00;

-- 2. Update the amount 
UPDATE LOANS
SET Amount = 2500000000.00
WHERE Type_of_Loan = 'Home';

-- 3. Update the start date 
UPDATE LOANS 
SET StartDate = '2023-06-09'
WHERE LoanID = 205;

-- 4. Update the EMI
UPDATE LOANS 
SET EMI = 25000.00
WHERE Type_of_Loan = 'Home';

-- 5. Update the Tenuremonths
UPDATE LOANS 
SET Tenuremonths = 90
WHERE Type_of_Loan = 'Car';


-- DELETE QUERIES 

-- 1. Delete records whose Loan type is home 
DELETE FROM LOANS 
WHERE Type_of_loan = 'Home';

-- 2. Delete records where LoanID is 205
DELETE FROM LOANS 
WHERE LoanID = 205;

-- 3. Delete records where EMI is below 15000.00
DELETE FROM Loans 
WHERE EMI < 15000.00;

-- 4. Delete records based on start date 
DELETE FROM Loans 
WHERE StartDate = '2023-09-01';

-- 5. Delete records where loanid is 209 
DELETE FROM Loans
WHERE LoanID = 209;



--  Table-5: Branches

CREATE TABLE Branches (
    BranchCode VARCHAR(10) PRIMARY KEY,
    BranchName VARCHAR(100),
    IFSCCode VARCHAR(11),
    MICRCode VARCHAR(10),
    Address TEXT,
    City VARCHAR(50),
    State VARCHAR(50),
    Contact VARCHAR(15),
    ManagerName VARCHAR(100),
    WorkingHours VARCHAR(50)
);

INSERT INTO Branches VALUES
('SBI001', 'SBI Delhi Main Branch', 'SBIN000001', '110002001', 'Connaught Place, Delhi', 'Delhi', 'Delhi', '01123456789', 'Rajeev Khanna', '9 AM - 4 PM'),
('SBI002', 'SBI Mumbai West Branch', 'SBIN000002', '400002002', 'Bandra, Mumbai', 'Mumbai', 'Maharashtra', '02245678901', 'Sonal Rane', '9 AM - 4 PM'),
('SBI003', 'SBI Kolkata Branch', 'SBIN000003', '700002003', 'Salt Lake, Kolkata', 'Kolkata', 'West Bengal', '03312345678', 'Rakesh Roy', '9 AM - 4 PM'),
('SBI004', 'SBI Chennai Branch', 'SBIN000004', '600002004', 'T Nagar, Chennai', 'Chennai', 'Tamil Nadu', '04423456789', 'Meena Nair', '9 AM - 4 PM'),
('SBI005', 'SBI Bangalore Branch', 'SBIN000005', '560002005', 'MG Road, Bangalore', 'Bangalore', 'Karnataka', '08034567891', 'Anil Sinha', '9 AM - 4 PM'),
('SBI006', 'SBI Hyderabad Branch', 'SBIN000006', '500002006', 'Banjara Hills, Hyderabad', 'Hyderabad', 'Telangana', '04067891234', 'Preeti Rao', '9 AM - 4 PM'),
('SBI007', 'SBI Ahmedabad Branch', 'SBIN000007', '380002007', 'Navrangpura, Ahmedabad', 'Ahmedabad', 'Gujarat', '07945678912', 'Karan Patel', '9 AM - 4 PM'),
('SBI008', 'SBI Surat Branch', 'SBIN000008', '395002008', 'Ring Road, Surat', 'Surat', 'Gujarat', '02612345678', 'Anjali Desai', '9 AM - 4 PM'),
('SBI009', 'SBI Jaipur Branch', 'SBIN000009', '302002009', 'MI Road, Jaipur', 'Jaipur', 'Rajasthan', '01414567890', 'Ravi Sharma', '9 AM - 4 PM'),
('SBI010', 'SBI Bhopal Branch', 'SBIN000010', '462002010', 'New Market, Bhopal', 'Bhopal', 'Madhya Pradesh', '07552678901', 'Neha Joshi', '9 AM - 4 PM'),
('SBI011', 'SBI Lucknow Branch', 'SBIN000011', '226002011', 'Hazratganj, Lucknow', 'Lucknow', 'Uttar Pradesh', '05221234567', 'Saurabh Pandey', '9 AM - 4 PM'),
('SBI012', 'SBI Kanpur Branch', 'SBIN000012', '208002012', 'Mall Road, Kanpur', 'Kanpur', 'Uttar Pradesh', '05122345678', 'Anita Yadav', '9 AM - 4 PM'),
('SBI013', 'SBI Nagpur Branch', 'SBIN000013', '440002013', 'Sitabuldi, Nagpur', 'Nagpur', 'Maharashtra', '07122456789', 'Manoj Deshmukh', '9 AM - 4 PM'),
('SBI014', 'SBI Amritsar Branch', 'SBIN000014', '143002014', 'GT Road, Amritsar', 'Amritsar', 'Punjab', '01832456789', 'Gurpreet Singh', '9 AM - 4 PM'),
('SBI015', 'SBI Guwahati Branch', 'SBIN000015', '781002015', 'Zoo Road, Guwahati', 'Guwahati', 'Assam', '03612456789', 'Bipin Choudhary', '9 AM - 4 PM'),
('SBI016', 'SBI Indore Branch', 'SBIN000016', '452002016', 'Rajwada, Indore', 'Indore', 'Madhya Pradesh', '07312456789', 'Isha Tripathi', '9 AM - 4 PM'),
('SBI017', 'SBI Kota Branch', 'SBIN000017', '324002017', 'Chambal Road, Kota', 'Kota', 'Rajasthan', '07442456789', 'Deepak Verma', '9 AM - 4 PM'),
('SBI018', 'SBI Raipur Branch', 'SBIN000018', '492002018', 'Pandri, Raipur', 'Raipur', 'Chhattisgarh', '07712456789', 'Shweta Chauhan', '9 AM - 4 PM'),
('SBI019', 'SBI Agra Branch', 'SBIN000019', '282002019', 'Sadar Bazar, Agra', 'Agra', 'Uttar Pradesh', '05622456789', 'Abhay Dixit', '9 AM - 4 PM'),
('SBI020', 'SBI Pune Branch', 'SBIN000020', '411002020', 'Kalyani Nagar, Pune', 'Pune', 'Maharashtra', '02024567890', 'Ajay Pawar', '9 AM - 4 PM');

-- View all branches located in Maharashtra
SELECT * FROM Branches;

-- Remove all records from Branches
TRUNCATE TABLE Branches;

-- Drop the entire Branches table
DROP TABLE Branches;
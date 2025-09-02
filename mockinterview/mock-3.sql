-- -------------------------------------- Database Queries -----------------------------------------

create database e_commerce;

use e_commerce;

-- -------------------------------------- Database Analysis -----------------------------------------

/*

T-1: Customers(customer_id (PK), name, email, city)

T-2: Products(product_id (PK), product_name, categoryprice)

T-3: Orders (order_id (PK), customer_id (FK → Customers.customer_id), product_id (FK → Products.product_id), order_date, quantity)


*/

-- ----------------------------------------------- Table Related Queries ------------------------------------------

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO Customers (name, email, city) VALUES
('Ravi Kumar', 'ravi.kumar@example.com', 'Mumbai'),
('Priya Sharma', 'priya.sharma@example.com', 'Delhi'),
('Amit Patel', 'amit.patel@example.com', 'Ahmedabad'),
('Sneha Reddy', 'sneha.reddy@example.com', 'Hyderabad'),
('Arjun Singh', 'arjun.singh@example.com', 'Bengaluru');

select * from Customers;

truncate table Customers;
drop table Customers;


-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

INSERT INTO Products (product_name, category, price) VALUES
('Laptop', 'Electronics', 55000.00),
('Smartphone', 'Electronics', 25000.00),
('Office Chair', 'Furniture', 7000.00),
('Washing Machine', 'Home Appliance', 18000.00),
('Bluetooth Headphones', 'Electronics', 3000.00);

select * from Products;

truncate table Products;
drop table Products;


-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE NOT NULL,
    quantity INT CHECK (quantity > 0),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Orders (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2025-08-15', 1),  
(2, 2, '2025-08-16', 2),  
(3, 3, '2025-08-17', 1),  
(4, 5, '2025-08-18', 3),  
(5, 4, '2025-08-19', 1);  

select * from Orders;

truncate table Orders;
drop table Orders;

-- B. Query Writing

-- 1. Customers who placed at least one order in August 2025
SELECT DISTINCT c.name, c.email
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE MONTH(o.order_date) = 8
  AND YEAR(o.order_date) = 2025;


-- 2. Top 3 most expensive products
SELECT product_name, category, price
FROM Products
ORDER BY price DESC
LIMIT 3;


-- 3. Total orders per customer in descending order
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC;


-- 4. Total revenue per product
SELECT p.product_name, SUM(o.quantity * p.price) AS total_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name;


-- 6. Customers with no orders
SELECT c.name, c.email
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- 8. Average order quantity per customer
SELECT c.name, 
       AVG(o.quantity) AS avg_quantity
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;


-- 9. Products with unique customer count
SELECT p.product_name, 
       COUNT(DISTINCT o.customer_id) AS unique_customers
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name;


-- 10. Customer with maximum orders
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC
LIMIT 1;







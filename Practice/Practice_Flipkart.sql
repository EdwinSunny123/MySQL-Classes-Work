-- Single line comment
/*
Multi-line 
comment
*/

-- ------------------------------------------------------------------ Database Queries ---------------------------------------------------
-- create a dataabse to work on it 
CREATE DATABASE Flipkart ;

-- to work on that database use it first 
use Flipkart ;

-- ----------------------------------------------------------------- Table Analysis -----------------------------------------------------
/*

Table-1 : Customers(customer_id, first_name, last_name, email, phone_number, address, city, state, country, pincode)
Table-2 : Products(product_id, product_name, category, brand, price, stock_quantity, description, rating, seller_id, warranty_period)
Table-3 : Orders(order_id, customer_id, order_date, total_amount, status, payment_method, shipping_address, shipping_city, shipping_state, shipping_pincode)
Table-4 : OrderDetails(order_detail_id, order_id, product_id, quantity, price_per_unit, discount, total_price, seller_id, warranty_info, return_policy)
Table-5 : Sellers(seller_id, seller_name, email, phone_number, address, city, state, country, pincode, rating)
Table-6 : Payments(payment_id, order_id, payment_date, payment_method, transaction_id, amount, status, bank_name, account_number, ifsc_code)
Table-7 : Reviews(review_id, product_id, customer_id, rating, review_text, review_date, status, helpful_votes, seller_id, verified_purchase)
Table-8 : Categories(category_id, category_name, description, parent_category_id, created_date, status, total_products, avg_price, top_seller_id, remarks)
Table-9 : Wishlists(wishlist_id, customer_id, product_id, date_added, priority, notes, status, shared_with, reminder_date, category_id)
Table-10 : Cart(cart_id, customer_id, product_id, quantity, date_added, status, price_per_unit, discount, total_price, seller_id)


*/

-- ---------------------------------------------------------------- Database Queries -----------------------------------------------------

-- Table-1: Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    pincode VARCHAR(10)
);

INSERT INTO Customers VALUES
(101, 'Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '123 MG Road', 'Mumbai', 'Maharashtra', 'India', '400001'),
(102, 'Priya', 'Mehta', 'priya.mehta@example.com', '9876501234', '45 Park Street', 'Kolkata', 'West Bengal', 'India', '700016'),
(103, 'Rahul', 'Verma', 'rahul.verma@example.com', '9988776655', '78 Residency Road', 'Bengaluru', 'Karnataka', 'India', '560025'),
(104, 'Sneha', 'Patil', 'sneha.patil@example.com', '9123456780', '56 Nehru Street', 'Chennai', 'Tamil Nadu', 'India', '600001'),
(105, 'Vikram', 'Singh', 'vikram.singh@example.com', '9765432109', '89 Janpath', 'Delhi', 'Delhi', 'India', '110001');

-- to remove the data of the table 
TRUNCATE TABLE Customers;

-- to delete the entire table 
DROP TABLE Customers;

-- Table-2: Products
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    description VARCHAR(255),
    rating DECIMAL(3,2),
    seller_id INT,
    warranty_period VARCHAR(50)
);

INSERT INTO Products VALUES
(201, 'Smartphone X', 'Mobiles', 'BrandA', 29999.99, 50, 'Latest 5G smartphone', 4.5, 501, '1 Year'),
(202, 'Laptop Pro', 'Electronics', 'BrandB', 74999.50, 30, 'High performance laptop', 4.7, 502, '2 Years'),
(203, 'Running Shoes', 'Footwear', 'BrandC', 2999.99, 100, 'Comfortable sports shoes', 4.3, 503, '6 Months'),
(204, 'Microwave Oven', 'Home Appliances', 'BrandD', 8999.00, 40, 'Convection microwave', 4.4, 504, '1 Year'),
(205, 'Bluetooth Speaker', 'Audio', 'BrandE', 1999.99, 150, 'Portable speaker', 4.6, 505, '1 Year');

-- to remove the data of the table 
TRUNCATE TABLE Products;

-- to delete the entire table 
DROP TABLE Products;

-- Table-3: Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(50),
    payment_method VARCHAR(50),
    shipping_address VARCHAR(255),
    shipping_city VARCHAR(50),
    shipping_state VARCHAR(50),
    shipping_pincode VARCHAR(10)
);

INSERT INTO Orders VALUES
(301, 101, '2025-08-01', 29999.99, 'Shipped', 'Credit Card', '123 MG Road', 'Mumbai', 'Maharashtra', '400001'),
(302, 102, '2025-08-02', 74999.50, 'Processing', 'Net Banking', '45 Park Street', 'Kolkata', 'West Bengal', '700016'),
(303, 103, '2025-08-03', 2999.99, 'Delivered', 'UPI', '78 Residency Road', 'Bengaluru', 'Karnataka', '560025'),
(304, 104, '2025-08-04', 8999.00, 'Cancelled', 'Cash on Delivery', '56 Nehru Street', 'Chennai', 'Tamil Nadu', '600001'),
(305, 105, '2025-08-05', 1999.99, 'Shipped', 'Debit Card', '89 Janpath', 'Delhi', 'Delhi', '110001');

-- to remove the data of the table 
TRUNCATE TABLE Orders;

-- to delete the entire table 
DROP TABLE Orders;

-- Table-4: OrderDetails
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10,2),
    discount DECIMAL(5,2),
    total_price DECIMAL(10,2),
    seller_id INT,
    warranty_info VARCHAR(50),
    return_policy VARCHAR(255)
);

INSERT INTO OrderDetails VALUES
(401, 301, 201, 1, 29999.99, 0.00, 29999.99, 501, '1 Year', '10 Days Return'),
(402, 302, 202, 1, 74999.50, 5.00, 71249.53, 502, '2 Years', '15 Days Return'),
(403, 303, 203, 1, 2999.99, 0.00, 2999.99, 503, '6 Months', '7 Days Return'),
(404, 304, 204, 1, 8999.00, 10.00, 8099.10, 504, '1 Year', '10 Days Return'),
(405, 305, 205, 1, 1999.99, 0.00, 1999.99, 505, '1 Year', '7 Days Return');

-- to remove the data of the table 
TRUNCATE TABLE OrderDetails;

-- to delete the entire table 
DROP TABLE OrderDetails;

-- Table-5: Sellers
CREATE TABLE Sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    pincode VARCHAR(10),
    rating DECIMAL(3,2)
);

INSERT INTO Sellers VALUES
(501, 'Tech World', 'techworld@example.com', '9812345678', '12 Tech Park', 'Mumbai', 'Maharashtra', 'India', '400001', 4.6),
(502, 'Laptop Hub', 'laptophub@example.com', '9823456789', '34 IT Street', 'Pune', 'Maharashtra', 'India', '411001', 4.5),
(503, 'Sports Gear', 'sportsgear@example.com', '9834567890', '56 Sport Avenue', 'Delhi', 'Delhi', 'India', '110001', 4.4),
(504, 'Home Needs', 'homeneeds@example.com', '9845678901', '78 Kitchen Road', 'Chennai', 'Tamil Nadu', 'India', '600001', 4.3),
(505, 'Sound Store', 'soundstore@example.com', '9856789012', '90 Music Lane', 'Bengaluru', 'Karnataka', 'India', '560025', 4.7);

-- to remove the data of the table 
TRUNCATE TABLE Sellers;

-- to delete the entire table 
DROP TABLE Sellers;


-- Table-6: Categories
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50),
    description VARCHAR(255),
    parent_category_id INT,
    status VARCHAR(20),
    created_date DATE,
    updated_date DATE,
    icon_url VARCHAR(255),
    display_order INT,
    seo_keywords VARCHAR(255)
);

INSERT INTO Categories VALUES
(601, 'Mobiles', 'Smartphones and accessories', NULL, 'Active', '2024-01-01', '2025-01-10', 'mobiles.png', 1, 'phones, smartphones'),
(602, 'Electronics', 'Laptops, tablets and more', NULL, 'Active', '2024-01-02', '2025-02-15', 'electronics.png', 2, 'laptops, gadgets'),
(603, 'Footwear', 'Shoes and sandals', NULL, 'Active', '2024-01-03', '2025-03-20', 'footwear.png', 3, 'shoes, sports shoes'),
(604, 'Home Appliances', 'Kitchen and home appliances', NULL, 'Active', '2024-01-04', '2025-04-25', 'home_appliances.png', 4, 'microwave, fridge'),
(605, 'Audio', 'Speakers and headphones', NULL, 'Active', '2024-01-05', '2025-05-30', 'audio.png', 5, 'speakers, headphones');

-- to remove the data of the table 
TRUNCATE TABLE Categories;

-- to delete the entire table 
DROP TABLE Categories;

-- Table-7: Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    transaction_id VARCHAR(100),
    payment_status VARCHAR(50),
    currency VARCHAR(10),
    payment_gateway VARCHAR(50),
    remarks VARCHAR(255)
);

INSERT INTO Payments VALUES
(701, 301, '2025-08-01', 29999.99, 'Credit Card', 'TXN123456', 'Success', 'INR', 'Razorpay', 'Payment received'),
(702, 302, '2025-08-02', 74999.50, 'Net Banking', 'TXN123457', 'Pending', 'INR', 'PayU', 'Awaiting confirmation'),
(703, 303, '2025-08-03', 2999.99, 'UPI', 'TXN123458', 'Success', 'INR', 'PhonePe', 'Instant payment'),
(704, 304, '2025-08-04', 8999.00, 'Cash on Delivery', 'TXN123459', 'Cancelled', 'INR', 'NA', 'Order cancelled'),
(705, 305, '2025-08-05', 1999.99, 'Debit Card', 'TXN123460', 'Success', 'INR', 'Paytm', 'Payment successful');

-- to remove the data of the table 
TRUNCATE TABLE Payments;

-- to delete the entire table 
DROP TABLE Payments;

-- Table-8: Reviews
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating DECIMAL(3,2),
    review_text VARCHAR(500),
    review_date DATE,
    status VARCHAR(20),
    likes_count INT,
    dislikes_count INT,
    verified_purchase BOOLEAN
);

INSERT INTO Reviews VALUES
(801, 201, 101, 4.5, 'Excellent phone, very smooth performance.', '2025-08-02', 'Approved', 25, 2, TRUE),
(802, 202, 102, 4.7, 'Great laptop for professionals.', '2025-08-03', 'Approved', 15, 1, TRUE),
(803, 203, 103, 4.3, 'Comfortable and stylish shoes.', '2025-08-04', 'Approved', 10, 0, TRUE),
(804, 204, 104, 4.0, 'Good oven but delivery was late.', '2025-08-05', 'Approved', 5, 1, TRUE),
(805, 205, 105, 4.6, 'Amazing sound quality!', '2025-08-06', 'Approved', 20, 0, TRUE);

-- to remove the data of the table 
TRUNCATE TABLE Reviews;

-- to delete the entire table 
DROP TABLE Reviews;

-- Table-9: Wishlists
CREATE TABLE Wishlists (
    wishlist_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    date_added DATE,
    priority VARCHAR(20),
    status VARCHAR(20),
    reminder_date DATE,
    notes VARCHAR(255),
    shared_with VARCHAR(255),
    visibility VARCHAR(20)
);

INSERT INTO Wishlists VALUES
(901, 101, 202, '2025-08-01', 'High', 'Active', '2025-08-10', 'For Diwali sale', 'priya@example.com', 'Public'),
(902, 102, 201, '2025-08-02', 'Medium', 'Active', '2025-08-15', 'Gift for friend', 'amit@example.com', 'Private'),
(903, 103, 205, '2025-08-03', 'Low', 'Active', '2025-08-20', 'Birthday gift', NULL, 'Public'),
(904, 104, 203, '2025-08-04', 'High', 'Inactive', NULL, 'Running season', NULL, 'Private'),
(905, 105, 204, '2025-08-05', 'Medium', 'Active', NULL, 'Kitchen upgrade', 'rahul@example.com', 'Public');

-- to remove the data of the table 
TRUNCATE TABLE Wishlists;

-- to delete the entire table 
DROP TABLE Wishlists;

-- Table-10: Shipments
CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    shipment_date DATE,
    delivery_date DATE,
    courier_service VARCHAR(50),
    tracking_number VARCHAR(100),
    shipment_status VARCHAR(50),
    weight DECIMAL(5,2),
    shipping_cost DECIMAL(10,2),
    remarks VARCHAR(255)
);

INSERT INTO Shipments VALUES
(1001, 301, '2025-08-02', '2025-08-05', 'BlueDart', 'TRK123456', 'Delivered', 1.2, 150.00, 'On time delivery'),
(1002, 302, '2025-08-03', NULL, 'Delhivery', 'TRK123457', 'In Transit', 2.5, 200.00, 'Delayed due to weather'),
(1003, 303, '2025-08-04', '2025-08-06', 'Ecom Express', 'TRK123458', 'Delivered', 0.8, 100.00, 'Fast delivery'),
(1004, 304, '2025-08-05', NULL, 'XpressBees', 'TRK123459', 'Cancelled', 1.5, 0.00, 'Order cancelled'),
(1005, 305, '2025-08-06', '2025-08-09', 'Shadowfax', 'TRK123460', 'Delivered', 0.6, 120.00, 'Delivered safely');

-- to remove the data of the table 
TRUNCATE TABLE Shipments;

-- to delete the entire table 
DROP TABLE Shipments;


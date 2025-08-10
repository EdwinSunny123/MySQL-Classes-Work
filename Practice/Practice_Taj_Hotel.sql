-- Single line comment
/*
Multi-line 
comment
*/

-- ------------------------------------------------------------------ Database Queries ---------------------------------------------------
-- create a dataabse to work on it 
CREATE DATABASE Taj_Hotel;

-- to work on that database use it first 
use Taj_Hotel;

-- ----------------------------------------------------------------- Table Analysis -----------------------------------------------------
/*

Table-1 : Guests(guest_id, first_name, last_name, gender, dob, phone_number, email, address, nationality, status)
Table-2 : Rooms(room_id, room_number, room_type, bed_type, price_per_night, floor, view_type, availability_status, max_occupancy, remarks)
Table-3 : Bookings(booking_id, guest_id, room_id, check_in_date, check_out_date, number_of_guests, booking_date, booking_status, payment_status, remarks)
Table-4 : Payments(payment_id, booking_id, amount, payment_date, payment_mode, transaction_id, status, currency, received_by, remarks)
Table-5 : Staff(staff_id, first_name, last_name, position, department, hire_date, phone_number, email, salary, status)
Table-6 : Services(service_id, service_name, description, price, availability_status, category, duration_minutes, staff_in_charge, remarks, status)
Table-7 : Orders(order_id, guest_id, service_id, order_date, quantity, total_amount, status, remarks, served_by, payment_status)
Table-8 : Events(event_id, event_name, start_date, end_date, location, organizer, capacity, price_per_person, status, remarks)
Table-9 : Suppliers(supplier_id, supplier_name, contact_person, phone_number, email, address, city, country, status)
Table-10 : Inventory(item_id, item_name, category, quantity, supplier_id, purchase_date, unit_price, total_value, status, remarks)

*/

-- ---------------------------------------------------------------- Database Queries -----------------------------------------------------

-- Table-1: Guests
CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    dob DATE,
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255),
    nationality VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO Guests VALUES
(101, 'Raj', 'Sharma', 'Male', '1985-06-15', '9876543210', 'raj.sharma@example.com', '123 MG Road, Mumbai', 'Indian', 'Active'),
(102, 'Priya', 'Verma', 'Female', '1990-08-22', '9876501234', 'priya.verma@example.com', '45 Nehru Street, Delhi', 'Indian', 'Active'),
(103, 'John', 'Doe', 'Male', '1982-01-12', '9988776655', 'john.doe@example.com', '56 Park Avenue, New York', 'American', 'Inactive'),
(104, 'Anita', 'Kumar', 'Female', '1995-03-05', '9123456789', 'anita.kumar@example.com', '78 Hill Road, Pune', 'Indian', 'Active'),
(105, 'Liam', 'Smith', 'Male', '1988-12-25', '9234567890', 'liam.smith@example.com', '12 Green Street, London', 'British', 'Active');

-- to remove the data of the table 
TRUNCATE TABLE Guests;

-- to delete the entire table 
DROP TABLE Guests;


-- Table-2: Rooms
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_number VARCHAR(10),
    room_type VARCHAR(50),
    bed_type VARCHAR(50),
    price_per_night DECIMAL(10,2),
    floor INT,
    view_type VARCHAR(50),
    availability_status VARCHAR(20),
    max_occupancy INT,
    remarks VARCHAR(255)
);

INSERT INTO Rooms VALUES
(201, '101', 'Deluxe', 'King', 7500.00, 1, 'Sea View', 'Available', 2, 'Includes breakfast'),
(202, '102', 'Suite', 'Queen', 12000.00, 1, 'City View', 'Occupied', 3, 'VIP suite'),
(203, '201', 'Standard', 'Twin', 5000.00, 2, 'Garden View', 'Available', 2, 'None'),
(204, '202', 'Deluxe', 'King', 8000.00, 2, 'Sea View', 'Maintenance', 2, 'Repair work ongoing'),
(205, '301', 'Penthouse', 'King', 20000.00, 3, 'Panoramic', 'Available', 4, 'Private pool included');

-- to remove the data of the table 
TRUNCATE TABLE Rooms;

-- to delete the entire table 
DROP TABLE Rooms;


-- Table-3: Bookings
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in_date DATE,
    check_out_date DATE,
    number_of_guests INT,
    booking_date DATE,
    booking_status VARCHAR(20),
    payment_status VARCHAR(20),
    remarks VARCHAR(255)
);

INSERT INTO Bookings VALUES
(301, 101, 201, '2025-08-01', '2025-08-05', 2, '2025-07-20', 'Confirmed', 'Paid', 'Honeymoon package'),
(302, 102, 202, '2025-08-10', '2025-08-12', 3, '2025-07-22', 'Confirmed', 'Pending', 'VIP guest'),
(303, 103, 203, '2025-08-15', '2025-08-16', 1, '2025-07-25', 'Cancelled', 'Refunded', 'Guest canceled'),
(304, 104, 204, '2025-08-18', '2025-08-20', 2, '2025-07-27', 'Pending', 'Pending', 'Room under maintenance'),
(305, 105, 205, '2025-08-22', '2025-08-25', 4, '2025-07-28', 'Confirmed', 'Paid', 'Special event booking');

-- to remove the data of the table 
TRUNCATE TABLE Bookings;

-- to delete the entire table 
DROP TABLE Bookings;


-- Table-4: Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_mode VARCHAR(50),
    transaction_id VARCHAR(100),
    status VARCHAR(20),
    currency VARCHAR(10),
    received_by VARCHAR(50),
    remarks VARCHAR(255)
);

INSERT INTO Payments VALUES
(401, 301, 30000.00, '2025-07-21', 'Credit Card', 'TXN12345', 'Success', 'INR', 'Cashier1', 'Advance payment'),
(402, 302, 12000.00, '2025-07-23', 'UPI', 'TXN67890', 'Pending', 'INR', 'Cashier2', 'Awaiting confirmation'),
(403, 303, 5000.00, '2025-07-26', 'Cash', 'TXN11111', 'Refunded', 'INR', 'Cashier3', 'Booking canceled'),
(404, 304, 0.00, '2025-07-28', 'N/A', 'N/A', 'Pending', 'INR', 'Cashier4', 'No payment due'),
(405, 305, 80000.00, '2025-07-29', 'Credit Card', 'TXN22222', 'Success', 'INR', 'Cashier5', 'Full payment received');

-- to remove the data of the table 
TRUNCATE TABLE Payments;

-- to delete the entire table 
DROP TABLE Payments;


-- Table-5: Staff
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(50),
    department VARCHAR(50),
    hire_date DATE,
    phone_number VARCHAR(15),
    email VARCHAR(100),
    salary DECIMAL(10,2),
    status VARCHAR(20)
);

INSERT INTO Staff VALUES
(501, 'Amit', 'Patel', 'Manager', 'Front Office', '2015-06-10', '9876001111', 'amit.patel@example.com', 60000.00, 'Active'),
(502, 'Neha', 'Singh', 'Chef', 'Kitchen', '2018-03-15', '9876002222', 'neha.singh@example.com', 45000.00, 'Active'),
(503, 'Ravi', 'Kumar', 'Housekeeping', 'Housekeeping', '2020-01-20', '9876003333', 'ravi.kumar@example.com', 30000.00, 'Active'),
(504, 'Suman', 'Das', 'Receptionist', 'Front Office', '2022-05-25', '9876004444', 'suman.das@example.com', 25000.00, 'Active'),
(505, 'Karan', 'Joshi', 'Security', 'Security', '2017-09-05', '9876005555', 'karan.joshi@example.com', 28000.00, 'Inactive');

-- to remove the data of the table 
TRUNCATE TABLE Staff;

-- to delete the entire table 
DROP TABLE Staff;


-- Table-6: Services
CREATE TABLE Services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    description VARCHAR(255),
    price DECIMAL(10,2),
    available_time VARCHAR(50),
    category VARCHAR(50),
    status VARCHAR(20),
    duration_minutes INT,
    staff_in_charge VARCHAR(50),
    remarks VARCHAR(255)
);

INSERT INTO Services VALUES
(601, 'Spa Massage', 'Full body spa massage', 2500.00, '09:00-20:00', 'Wellness', 'Available', 60, 'Neha Singh', 'Includes aromatherapy'),
(602, 'Room Service', 'In-room dining and cleaning', 0.00, '24/7', 'Hospitality', 'Available', 0, 'Amit Patel', 'Food charges extra'),
(603, 'Airport Pickup', 'Luxury car pickup from airport', 1500.00, 'On Request', 'Transport', 'Available', 45, 'Karan Joshi', 'Advance booking needed'),
(604, 'Laundry', 'Clothes washing and ironing', 300.00, '08:00-20:00', 'Housekeeping', 'Available', 0, 'Ravi Kumar', 'Express service available'),
(605, 'Gym Access', 'Unlimited gym usage', 0.00, '06:00-22:00', 'Fitness', 'Available', 0, 'Suman Das', 'Free for guests');

-- to remove the data of the table 
TRUNCATE TABLE Services;

-- to delete the entire table 
DROP TABLE Services;


-- Table-7: Events
CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100),
    organizer VARCHAR(50),
    start_date DATE,
    end_date DATE,
    venue VARCHAR(100),
    capacity INT,
    status VARCHAR(20),
    ticket_price DECIMAL(10,2),
    remarks VARCHAR(255)
);

INSERT INTO Events VALUES
(701, 'Wedding Ceremony', 'Raj Sharma', '2025-09-10', '2025-09-12', 'Banquet Hall', 200, 'Confirmed', 5000.00, 'Includes catering'),
(702, 'Corporate Meeting', 'Priya Verma', '2025-09-15', '2025-09-15', 'Conference Room A', 50, 'Pending', 0.00, 'Projector setup required'),
(703, 'Music Concert', 'John Doe', '2025-09-20', '2025-09-20', 'Open Lawn', 500, 'Confirmed', 1500.00, 'VIP passes available'),
(704, 'Birthday Party', 'Anita Kumar', '2025-09-25', '2025-09-25', 'Banquet Hall', 100, 'Confirmed', 2000.00, 'Theme: Bollywood'),
(705, 'Food Festival', 'Liam Smith', '2025-10-01', '2025-10-03', 'Garden Area', 300, 'Confirmed', 1000.00, 'Includes tasting stalls');

-- to remove the data of the table 
TRUNCATE TABLE Events;

-- to delete the entire table 
DROP TABLE Events;


-- Table-8: Suppliers
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_person VARCHAR(50),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(50),
    country VARCHAR(50),
    status VARCHAR(20),
    remarks VARCHAR(255)
);

INSERT INTO Suppliers VALUES
(801, 'FreshFoods Ltd', 'Manoj Kumar', '9000000001', 'freshfoods@example.com', '12 Market Road', 'Mumbai', 'India', 'Active', 'Delivers daily fresh vegetables'),
(802, 'Luxury Linen Co', 'Rita Sharma', '9000000002', 'luxlinen@example.com', '45 Textile Street', 'Delhi', 'India', 'Active', 'Supplies premium linens'),
(803, 'AquaPure', 'Suresh Gupta', '9000000003', 'aquapure@example.com', '78 Water Lane', 'Pune', 'India', 'Inactive', 'Delayed deliveries in monsoon'),
(804, 'SoundMax Audio', 'Pankaj Mehta', '9000000004', 'soundmax@example.com', '23 Music Plaza', 'Bangalore', 'India', 'Active', 'Event sound equipment supplier'),
(805, 'Global Wines', 'Amit Chawla', '9000000005', 'globalwines@example.com', '56 Wine Street', 'Goa', 'India', 'Active', 'Exclusive wine distributor');

-- to remove the data of the table 
TRUNCATE TABLE Suppliers;

-- to delete the entire table 
DROP TABLE Suppliers;


-- Table-9: Inventory
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    supplier_id INT,
    date_added DATE,
    status VARCHAR(20),
    storage_location VARCHAR(50),
    remarks VARCHAR(255)
);

INSERT INTO Inventory VALUES
(901, 'Bath Towels', 'Linen', 500, 200.00, 802, '2025-07-15', 'In Stock', 'Store Room 1', 'High-quality cotton'),
(902, 'Shampoo Bottles', 'Toiletries', 300, 50.00, 801, '2025-07-16', 'In Stock', 'Store Room 2', 'Herbal fragrance'),
(903, 'Wine Bottles', 'Beverages', 100, 1500.00, 805, '2025-07-17', 'Low Stock', 'Cellar', 'Imported from France'),
(904, 'Speakers', 'Electronics', 20, 5000.00, 804, '2025-07-18', 'In Stock', 'Audio Room', 'For events'),
(905, 'Water Cans', 'Beverages', 50, 100.00, 803, '2025-07-19', 'In Stock', 'Kitchen Store', '20-liter cans');

-- to remove the data of the table 
TRUNCATE TABLE Inventory;

-- to delete the entire table 
DROP TABLE Inventory;


-- Table-10: Feedback
CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY,
    guest_id INT,
    feedback_date DATE,
    rating INT,
    comments VARCHAR(255),
    staff_id INT,
    service_id INT,
    response_status VARCHAR(20),
    resolved_by VARCHAR(50),
    remarks VARCHAR(255)
);

INSERT INTO Feedback VALUES
(1001, 101, '2025-08-05', 5, 'Excellent service and food!', 501, 601, 'Responded', 'Amit Patel', 'Guest very happy'),
(1002, 102, '2025-08-06', 4, 'Room was clean but AC was noisy', 503, 602, 'Pending', NULL, 'Needs maintenance check'),
(1003, 103, '2025-08-07', 3, 'Average experience, slow room service', 504, 602, 'Responded', 'Suman Das', 'Action taken'),
(1004, 104, '2025-08-08', 5, 'Loved the spa session!', 502, 601, 'Responded', 'Neha Singh', 'Guest will return'),
(1005, 105, '2025-08-09', 2, 'Uncomfortable bed', 503, 603, 'Pending', NULL, 'Room change suggested');

-- to remove the data of the table 
TRUNCATE TABLE Feedback;

-- to delete the entire table 
DROP TABLE Feedback;

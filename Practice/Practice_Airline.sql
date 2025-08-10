-- Single line comment
/*
Multi-line 
comment
*/

-- ------------------------------------------------------------------ Database Queries ---------------------------------------------------
-- create a dataabse to work on it 
CREATE DATABASE Airlines;

-- to work on that database use it first 
use Airlines;

-- ----------------------------------------------------------------- Table Analysis -----------------------------------------------------
/*
Table-1: Airlines(airline_id, airline_name, country, founded_year, fleet_size, alliance, iata_code, icao_code, headquarters, status)

Table-2: Flights(flight_id, airline_id, flight_number, source, destination, departure_time, arrival_time, duration, aircraft_type, status)

Table-3: Passengers(passenger_id, first_name, last_name, gender, age, email, phone, nationality, passport_number, frequent_flyer)

Table-4: Bookings(booking_id, passenger_id, flight_id, booking_date, travel_date, seat_class, seat_number, booking_status, payment_mode, total_amount)

Table-5: Airports(airport_id, airport_name, city, state, country, iata_code, icao_code, terminals, runway_length, status)

Table-6: Crew(crew_id, flight_id, crew_name, role, gender, age, experience_years, nationality, contact_number, license_number)

Table-7: Luggage(luggage_id, booking_id, passenger_id, number_of_bags, total_weight, check_in_status, tag_number, extra_fees, fragile, special_instructions)

Table-8: Payments(payment_id, booking_id, passenger_id, payment_date, amount, payment_mode, transaction_id, status, bank_name, currency)

Table-9: Aircrafts(aircraft_id, airline_id, model, registration_number, seating_capacity, manufacturer, in_service, last_maintenance, range_km, year_built)

Table-10: Routes(route_id, flight_id, source_airport, destination_airport, distance_km, estimated_time, is_international, fuel_required_liters, stopovers, preferred_path)

*/

-- ---------------------------------------------------------------- Database Queries -----------------------------------------------------

CREATE TABLE Airlines (
    airline_id INT PRIMARY KEY,
    airline_name VARCHAR(100),
    country VARCHAR(50),
    founded_year INT,
    fleet_size INT,
    alliance VARCHAR(50),
    iata_code VARCHAR(10),
    icao_code VARCHAR(10),
    headquarters VARCHAR(100),
    status VARCHAR(20)
);

INSERT INTO Airlines VALUES
(1, 'IndiGo', 'India', 2006, 300, 'None', '6E', 'IGO', 'Gurgaon, India', 'Active'),
(2, 'Air India', 'India', 1932, 120, 'Star Alliance', 'AI', 'AIC', 'Delhi, India', 'Active'),
(3, 'SpiceJet', 'India', 2005, 90, 'None', 'SG', 'SEJ', 'Gurgaon, India', 'Active'),
(4, 'Vistara', 'India', 2013, 60, 'None', 'UK', 'VTI', 'Gurgaon, India', 'Active'),
(5, 'Go First', 'India', 2005, 55, 'None', 'G8', 'GOW', 'Mumbai, India', 'Inactive');

-- to remove the data of the table 
TRUNCATE TABLE Airlines;

-- to delete the entire table 
DROP TABLE Airlines;



CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    airline_id INT,
    flight_number VARCHAR(10),
    source VARCHAR(50),
    destination VARCHAR(50),
    departure_time TIME,
    arrival_time TIME,
    duration VARCHAR(10),
    aircraft_type VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO Flights VALUES
(101, 1, '6E203', 'Delhi', 'Mumbai', '06:00:00', '08:00:00', '2h', 'Airbus A320', 'On Time'),
(102, 2, 'AI442', 'Chennai', 'Delhi', '09:30:00', '12:30:00', '3h', 'Boeing 787', 'Delayed'),
(103, 3, 'SG123', 'Mumbai', 'Bangalore', '13:00:00', '15:00:00', '2h', 'Boeing 737', 'Cancelled'),
(104, 4, 'UK115', 'Delhi', 'Kolkata', '10:15:00', '12:45:00', '2.5h', 'Airbus A320neo', 'On Time'),
(105, 1, '6E789', 'Hyderabad', 'Pune', '17:00:00', '18:30:00', '1.5h', 'Airbus A321', 'On Time');


-- to remove the data of the table  
TRUNCATE TABLE Flights;

-- to delete the entire table  
DROP TABLE Flights;



CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    email VARCHAR(100),
    phone VARCHAR(15),
    nationality VARCHAR(50),
    passport_number VARCHAR(20),
    frequent_flyer BOOLEAN
);

INSERT INTO Passengers VALUES
(1, 'Raj', 'Kapoor', 'Male', 34, 'raj.kapoor@email.com', '9876543210', 'Indian', 'P1234567', TRUE),
(2, 'Anita', 'Sharma', 'Female', 28, 'anita.sharma@email.com', '9876543211', 'Indian', 'P7654321', FALSE),
(3, 'John', 'Doe', 'Male', 45, 'john.doe@email.com', '9876543212', 'American', 'A9988776', TRUE),
(4, 'Mary', 'Thomas', 'Female', 52, 'mary.t@email.com', '9876543213', 'British', 'B2233445', FALSE),
(5, 'Ravi', 'Verma', 'Male', 30, 'ravi.v@email.com', '9876543214', 'Indian', 'P3344556', TRUE);

-- to remove the data of the table  
TRUNCATE TABLE Passengers;

-- to delete the entire table  
DROP TABLE Passengers;



CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    travel_date DATE,
    seat_class VARCHAR(20),
    seat_number VARCHAR(10),
    booking_status VARCHAR(20),
    payment_mode VARCHAR(20),
    total_amount DECIMAL(10,2)
);

INSERT INTO Bookings VALUES
(201, 1, 101, '2025-08-01', '2025-08-08', 'Economy', '12A', 'Confirmed', 'Credit Card', 4500.00),
(202, 2, 102, '2025-08-02', '2025-08-09', 'Business', '2B', 'Confirmed', 'UPI', 9500.00),
(203, 3, 103, '2025-08-03', '2025-08-10', 'Economy', '15C', 'Cancelled', 'Debit Card', 4000.00),
(204, 4, 104, '2025-08-04', '2025-08-11', 'Premium Economy', '8D', 'Confirmed', 'Net Banking', 6200.00),
(205, 5, 105, '2025-08-05', '2025-08-12', 'Economy', '16B', 'Pending', 'Cash', 3800.00);

-- to remove the data of the table  
TRUNCATE TABLE Bookings;

-- to delete the entire table  
DROP TABLE Bookings;



CREATE TABLE Airports (
    airport_id INT PRIMARY KEY,
    airport_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    iata_code VARCHAR(10),
    icao_code VARCHAR(10),
    terminals INT,
    runway_length INT,
    status VARCHAR(20)
);

INSERT INTO Airports VALUES
(1, 'Indira Gandhi International Airport', 'Delhi', 'Delhi', 'India', 'DEL', 'VIDP', 3, 4430, 'Operational'),
(2, 'Chhatrapati Shivaji Maharaj International', 'Mumbai', 'Maharashtra', 'India', 'BOM', 'VABB', 2, 3480, 'Operational'),
(3, 'Kempegowda International Airport', 'Bangalore', 'Karnataka', 'India', 'BLR', 'VOBL', 2, 4000, 'Operational'),
(4, 'Netaji Subhas Chandra Bose International', 'Kolkata', 'West Bengal', 'India', 'CCU', 'VECC', 2, 3620, 'Operational'),
(5, 'Rajiv Gandhi International Airport', 'Hyderabad', 'Telangana', 'India', 'HYD', 'VOHS', 2, 4260, 'Operational');

-- to remove the data of the table  
TRUNCATE TABLE Airports;

-- to delete the entire table  
DROP TABLE Airports;



CREATE TABLE Crew (
    crew_id INT PRIMARY KEY,
    flight_id INT,
    crew_name VARCHAR(100),
    role VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    experience_years INT,
    nationality VARCHAR(50),
    contact_number VARCHAR(15),
    license_number VARCHAR(20)
);

INSERT INTO Crew VALUES
(1, 101, 'Captain Ajay Singh', 'Pilot', 'Male', 45, 20, 'Indian', '8888888888', 'LIC001'),
(2, 101, 'Ritika Mehta', 'Co-Pilot', 'Female', 33, 10, 'Indian', '9999999999', 'LIC002'),
(3, 102, 'Suresh Rao', 'Pilot', 'Male', 50, 25, 'Indian', '7777777777', 'LIC003'),
(4, 103, 'Anjali Gupta', 'Flight Attendant', 'Female', 29, 5, 'Indian', '6666666666', 'LIC004'),
(5, 104, 'Rahul Verma', 'Flight Engineer', 'Male', 38, 12, 'Indian', '5555555555', 'LIC005');


-- to remove the data of the table  
TRUNCATE TABLE Crew;

-- to delete the entire table  
DROP TABLE Crew;


CREATE TABLE Luggage (
    luggage_id INT PRIMARY KEY,
    booking_id INT,
    passenger_id INT,
    number_of_bags INT,
    total_weight DECIMAL(5,2),
    check_in_status VARCHAR(20),
    tag_number VARCHAR(20),
    extra_fees DECIMAL(6,2),
    fragile BOOLEAN,
    special_instructions VARCHAR(100)
);

INSERT INTO Luggage VALUES
(1, 201, 1, 2, 18.5, 'Checked In', 'TAG123', 0.00, FALSE, 'None'),
(2, 202, 2, 1, 12.0, 'Checked In', 'TAG124', 0.00, TRUE, 'Handle with care'),
(3, 203, 3, 3, 25.0, 'Not Checked In', 'TAG125', 500.00, FALSE, 'Overweight'),
(4, 204, 4, 1, 10.0, 'Checked In', 'TAG126', 0.00, FALSE, 'None'),
(5, 205, 5, 2, 20.5, 'Checked In', 'TAG127', 100.00, TRUE, 'Glass items');


-- to remove the data of the table  
TRUNCATE TABLE Luggage;

-- to delete the entire table  
DROP TABLE Luggage;


CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    passenger_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_mode VARCHAR(20),
    transaction_id VARCHAR(30),
    status VARCHAR(20),
    bank_name VARCHAR(50),
    currency VARCHAR(10)
);

INSERT INTO Payments VALUES
(1, 201, 1, '2025-08-01', 4500.00, 'Credit Card', 'TXN1001', 'Success', 'HDFC', 'INR'),
(2, 202, 2, '2025-08-02', 9500.00, 'UPI', 'TXN1002', 'Success', 'Paytm', 'INR'),
(3, 203, 3, '2025-08-03', 4000.00, 'Debit Card', 'TXN1003', 'Failed', 'SBI', 'INR'),
(4, 204, 4, '2025-08-04', 6200.00, 'Net Banking', 'TXN1004', 'Success', 'ICICI', 'INR'),
(5, 205, 5, '2025-08-05', 3800.00, 'Cash', 'TXN1005', 'Pending', 'None', 'INR');

-- to remove the data of the table  
TRUNCATE TABLE Payments;

-- to delete the entire table  
DROP TABLE Payments;



CREATE TABLE Aircrafts (
    aircraft_id INT PRIMARY KEY,
    airline_id INT,
    model VARCHAR(50),
    registration_number VARCHAR(20),
    seating_capacity INT,
    manufacturer VARCHAR(50),
    in_service BOOLEAN,
    last_maintenance DATE,
    range_km INT,
    year_built INT
);

INSERT INTO Aircrafts VALUES
(1, 1, 'Airbus A320', 'VT-IGO1', 180, 'Airbus', TRUE, '2025-07-15', 6150, 2015),
(2, 2, 'Boeing 787', 'VT-AII2', 242, 'Boeing', TRUE, '2025-06-20', 13600, 2017),
(3, 3, 'Boeing 737', 'VT-SG3', 160, 'Boeing', FALSE, '2025-05-10', 5600, 2012),
(4, 4, 'Airbus A320neo', 'VT-VTI4', 186, 'Airbus', TRUE, '2025-07-01', 6500, 2019),
(5, 1, 'Airbus A321', 'VT-IGO5', 230, 'Airbus', TRUE, '2025-06-25', 7400, 2018);

-- to remove the data of the table  
TRUNCATE TABLE Aircrafts;

-- to delete the entire table  
DROP TABLE Aircrafts;


CREATE TABLE Routes (
    route_id INT PRIMARY KEY,
    flight_id INT,
    source_airport VARCHAR(50),
    destination_airport VARCHAR(50),
    distance_km INT,
    estimated_time VARCHAR(10),
    is_international BOOLEAN,
    fuel_required_liters INT,
    stopovers INT,
    preferred_path VARCHAR(50)
);

INSERT INTO Routes VALUES
(1, 101, 'DEL', 'BOM', 1150, '2h', FALSE, 3200, 0, 'Shortest'),
(2, 102, 'MAA', 'DEL', 1750, '3h', FALSE, 4800, 0, 'Direct'),
(3, 103, 'BOM', 'BLR', 980, '2h', FALSE, 2800, 0, 'Shortest'),
(4, 104, 'DEL', 'CCU', 1300, '2.5h', FALSE, 3500, 0, 'Efficient'),
(5, 105, 'HYD', 'PNQ', 620, '1.5h', FALSE, 2100, 0, 'Direct');

-- to remove the data of the table  
TRUNCATE TABLE Routes;

-- to delete the entire table  
DROP TABLE Routes;

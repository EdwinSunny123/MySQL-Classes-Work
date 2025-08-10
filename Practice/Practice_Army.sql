-- Single line comment
/*
Multi-line 
comment
*/

-- ------------------------------------------------------------------ Database Queries ---------------------------------------------------
-- create a dataabse to work on it 
CREATE DATABASE Army;

-- to work on that database use it first 
use Army;

-- ----------------------------------------------------------------- Table Analysis -----------------------------------------------------
/*
Table-1  : Soldiers(soldier_id, first_name, last_name, rank, date_of_birth, gender, enlistment_date, unit_id, phone_number, email)
Table-2  : Units(unit_id, unit_name, location, commanding_officer, established_date, unit_type, strength, region, mission, status)
Table-3  : Officers(officer_id, first_name, last_name, rank, date_of_birth, gender, commission_date, unit_id, phone_number, email)
Table-4  : Missions(mission_id, mission_name, location, start_date, end_date, commanding_officer, status, objective, success_rate, casualties)
Table-5  : Trainings(training_id, training_name, location, start_date, end_date, instructor, participants, training_type, duration_days, remarks)
Table-6  : Weapons(weapon_id, weapon_name, type, range_meters, weight_kg, manufacturer, purchase_date, condition, quantity, unit_id)
Table-7  : Vehicles(vehicle_id, type, model, manufacturer, purchase_date, capacity, fuel_type, condition, assigned_unit, vehicle_number)
Table-8  : Medical_Records(record_id, soldier_id, checkup_date, doctor_name, health_status, blood_group, allergies, injuries, treatment, remarks)
Table-9  : Leaves(leave_id, soldier_id, leave_type, start_date, end_date, reason, approved_by, status, application_date, remarks)
Table-10 : Inventory(inventory_id, item_name, category, quantity, condition, last_checked, assigned_to, location, supplier, remarks)

*/

-- ---------------------------------------------------------------- Database Queries -----------------------------------------------------

-- Table-1: Soldiers
CREATE TABLE Soldiers (
    soldier_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(20),
    date_of_birth DATE,
    gender VARCHAR(10),
    enlistment_date DATE,
    unit_id INT,
    phone_number VARCHAR(15),
    email VARCHAR(100)
);

INSERT INTO Soldiers VALUES
(101, 'Arjun', 'Reddy', 'Captain', '1990-05-15', 'Male', '2010-06-10', 201, '9876543210', 'arjun.reddy@army.in'),
(102, 'Ravi', 'Kumar', 'Lieutenant', '1992-07-20', 'Male', '2013-03-25', 202, '9876501234', 'ravi.kumar@army.in'),
(103, 'Sneha', 'Verma', 'Major', '1988-09-18', 'Female', '2009-01-10', 203, '9876512345', 'sneha.verma@army.in'),
(104, 'Vikram', 'Singh', 'Colonel', '1985-11-05', 'Male', '2005-09-15', 204, '9876598765', 'vikram.singh@army.in'),
(105, 'Pooja', 'Joshi', 'Captain', '1991-02-28', 'Female', '2012-08-22', 205, '9876587654', 'pooja.joshi@army.in');

-- To remove the data of the table
TRUNCATE TABLE Soldiers;

-- To delete the entire table
DROP TABLE Soldiers;

-- Table-2: Units
CREATE TABLE Units (
    unit_id INT PRIMARY KEY,
    unit_name VARCHAR(100),
    location VARCHAR(100),
    commanding_officer VARCHAR(100),
    established_date DATE,
    unit_type VARCHAR(50),
    strength INT,
    region VARCHAR(50),
    mission VARCHAR(100),
    status VARCHAR(20)
);

INSERT INTO Units VALUES
(201, 'Alpha Force', 'Jammu', 'Col. Vikram Singh', '2000-01-01', 'Infantry', 300, 'North', 'Patrol', 'Active'),
(202, 'Bravo Squad', 'Leh', 'Maj. Sneha Verma', '2005-03-10', 'Artillery', 250, 'North', 'Surveillance', 'Active'),
(203, 'Delta Unit', 'Shillong', 'Lt. Ravi Kumar', '2010-05-20', 'Armored', 200, 'East', 'Peacekeeping', 'Active'),
(204, 'Eagle Team', 'Hyderabad', 'Capt. Arjun Reddy', '2002-07-15', 'Engineers', 180, 'South', 'Construction', 'Active'),
(205, 'Falcon Group', 'Pune', 'Capt. Pooja Joshi', '2015-09-30', 'Signals', 150, 'West', 'Communication', 'Training');

-- To remove the data of the table
TRUNCATE TABLE Units;

-- To delete the entire table
DROP TABLE Units;

-- Table-3: Officers
CREATE TABLE Officers (
    officer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(20),
    date_of_birth DATE,
    gender VARCHAR(10),
    commission_date DATE,
    unit_id INT,
    phone_number VARCHAR(15),
    email VARCHAR(100)
);

INSERT INTO Officers VALUES
(301, 'Raj', 'Kapoor', 'Brigadier', '1975-12-01', 'Male', '1998-01-01', 201, '9876000001', 'raj.kapoor@army.in'),
(302, 'Asha', 'Mehta', 'Colonel', '1980-03-22', 'Female', '2001-07-15', 202, '9876000002', 'asha.mehta@army.in'),
(303, 'Dev', 'Patil', 'Major', '1983-09-30', 'Male', '2005-05-20', 203, '9876000003', 'dev.patil@army.in'),
(304, 'Isha', 'Nair', 'Lieutenant', '1989-06-12', 'Female', '2010-09-05', 204, '9876000004', 'isha.nair@army.in'),
(305, 'Amit', 'Desai', 'Captain', '1992-01-25', 'Male', '2013-12-01', 205, '9876000005', 'amit.desai@army.in');

-- To remove the data of the table
TRUNCATE TABLE Officers;

-- To delete the entire table
DROP TABLE Officers;

-- Table-4: Missions
CREATE TABLE Missions (
    mission_id INT PRIMARY KEY,
    mission_name VARCHAR(100),
    location VARCHAR(100),
    start_date DATE,
    end_date DATE,
    commanding_officer VARCHAR(100),
    status VARCHAR(20),
    objective VARCHAR(100),
    success_rate FLOAT,
    casualties INT
);

INSERT INTO Missions VALUES
(401, 'Operation Shield', 'Kargil', '2022-01-10', '2022-03-15', 'Col. Vikram Singh', 'Completed', 'Defend Post', 95.5, 5),
(402, 'Desert Storm', 'Jaisalmer', '2023-04-01', '2023-04-30', 'Maj. Sneha Verma', 'Completed', 'Tank Drill', 88.0, 0),
(403, 'Peace March', 'Nagaland', '2023-05-10', '2023-06-20', 'Lt. Ravi Kumar', 'Ongoing', 'Peacekeeping', 70.0, 2),
(404, 'River Shield', 'Assam', '2024-01-05', '2024-02-15', 'Capt. Arjun Reddy', 'Completed', 'Flood Rescue', 98.0, 1),
(405, 'Iron Fist', 'Mumbai', '2024-07-01', '2024-07-31', 'Capt. Pooja Joshi', 'Planned', 'Training', NULL, 0);

-- To remove the data of the table
TRUNCATE TABLE Missions;

-- To delete the entire table
DROP TABLE Missions;

-- Table-5: Trainings
CREATE TABLE Trainings (
    training_id INT PRIMARY KEY,
    training_name VARCHAR(100),
    location VARCHAR(100),
    start_date DATE,
    end_date DATE,
    instructor VARCHAR(100),
    participants INT,
    training_type VARCHAR(50),
    duration_days INT,
    remarks VARCHAR(100)
);

INSERT INTO Trainings VALUES
(501, 'Combat Tactics', 'Delhi', '2023-01-10', '2023-01-20', 'Maj. Sneha Verma', 30, 'Field', 10, 'Intense'),
(502, 'Medical Aid', 'Lucknow', '2023-02-01', '2023-02-10', 'Lt. Ravi Kumar', 20, 'Health', 9, 'Completed'),
(503, 'Weapon Handling', 'Bhopal', '2023-03-05', '2023-03-15', 'Capt. Arjun Reddy', 25, 'Armory', 10, 'Completed'),
(504, 'Parade Training', 'Pune', '2023-04-10', '2023-04-20', 'Capt. Pooja Joshi', 40, 'Discipline', 10, 'Ongoing'),
(505, 'Cybersecurity', 'Bangalore', '2023-05-01', '2023-05-10', 'Col. Vikram Singh', 15, 'IT', 9, 'Advanced');

-- To remove the data of the table
TRUNCATE TABLE Trainings;

-- To delete the entire table
DROP TABLE Trainings;

-- Table-6: Weapons
CREATE TABLE Weapons (
    weapon_id INT PRIMARY KEY,
    weapon_name VARCHAR(50),
    type VARCHAR(30),
    range_meters INT,
    weight_kg FLOAT,
    manufacturer VARCHAR(100),
    purchase_date DATE,
    status VARCHAR(20),
    quantity INT,
    unit_id INT
);

INSERT INTO Weapons VALUES
(601, 'INSAS Rifle', 'Rifle', 400, 4.0, 'OFB', '2020-01-10', 'Good', 100, 201),
(602, 'AK-47', 'Rifle', 300, 4.5, 'Russia', '2018-05-15', 'Excellent', 50, 202),
(603, 'T90 Tank', 'Tank', 5000, 46000.0, 'Russia', '2015-09-20', 'Operational', 10, 203),
(604, 'Rocket Launcher', 'Heavy', 1500, 10.0, 'DRDO', '2021-03-01', 'Good', 25, 204),
(605, 'Grenade', 'Explosive', 50, 0.4, 'DRDO', '2022-07-07', 'New', 200, 205);

-- To remove the data of the table
TRUNCATE TABLE Weapons;

-- To delete the entire table
DROP TABLE Weapons;

-- Table-7: Vehicles
CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    type VARCHAR(50),
    model VARCHAR(50),
    manufacturer VARCHAR(100),
    purchase_date DATE,
    capacity INT,
    fuel_type VARCHAR(20),
    status VARCHAR(20),
    assigned_unit VARCHAR(50),
    vehicle_number VARCHAR(20)
);

INSERT INTO Vehicles VALUES
(701, 'Truck', 'Tata LPTA', 'Tata Motors', '2021-05-01', 20, 'Diesel', 'Good', 'Alpha Force', 'MH12AB1234'),
(702, 'Jeep', 'Mahindra Marksman', 'Mahindra', '2020-03-15', 5, 'Diesel', 'Excellent', 'Bravo Squad', 'DL10XY2345'),
(703, 'Tank', 'T90', 'Uralvagonzavod', '2015-07-07', 4, 'Diesel', 'Operational', 'Delta Unit', 'AR01TANK01'),
(704, 'Ambulance', 'Force Traveller', 'Force Motors', '2019-10-10', 8, 'Diesel', 'Good', 'Eagle Team', 'KA05MED123'),
(705, 'Bike', 'Royal Enfield', 'RE', '2023-01-01', 2, 'Petrol', 'New', 'Falcon Group', 'MH03RE9999');

-- To remove the data of the table
TRUNCATE TABLE Vehicles;

-- To delete the entire table
DROP TABLE Vehicles;

-- Table-8: Medical_Records
CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY,
    soldier_id INT,
    checkup_date DATE,
    doctor_name VARCHAR(100),
    health_status VARCHAR(50),
    blood_group VARCHAR(5),
    allergies VARCHAR(100),
    injuries VARCHAR(100),
    treatment VARCHAR(100),
    remarks VARCHAR(100)
);

INSERT INTO Medical_Records VALUES
(801, 101, '2024-01-01', 'Dr. Sinha', 'Fit', 'O+', 'None', 'None', 'Routine', 'Healthy'),
(802, 102, '2024-01-15', 'Dr. Kapoor', 'Fit', 'A+', 'Dust', 'Sprain', 'Physiotherapy', 'Recovered'),
(803, 103, '2024-02-10', 'Dr. Nair', 'Fit', 'B+', 'Pollen', 'None', 'Routine', 'Healthy'),
(804, 104, '2024-03-05', 'Dr. Mehta', 'Unfit', 'AB+', 'None', 'Fracture', 'Surgery', 'Under Observation'),
(805, 105, '2024-04-01', 'Dr. Verma', 'Fit', 'O-', 'None', 'None', 'Routine', 'Cleared');

-- To remove the data of the table
TRUNCATE TABLE Medical_Records;

-- To delete the entire table
DROP TABLE Medical_Records;

-- Table-9: Leaves
CREATE TABLE Leaves (
    leave_id INT PRIMARY KEY,
    soldier_id INT,
    leave_type VARCHAR(30),
    start_date DATE,
    end_date DATE,
    reason VARCHAR(100),
    approved_by VARCHAR(100),
    status VARCHAR(20),
    application_date DATE,
    remarks VARCHAR(100)
);

INSERT INTO Leaves VALUES
(901, 101, 'Annual', '2024-06-01', '2024-06-15', 'Family Visit', 'Col. Vikram Singh', 'Approved', '2024-05-15', 'Granted'),
(902, 102, 'Medical', '2024-07-01', '2024-07-10', 'Sprain Recovery', 'Maj. Sneha Verma', 'Approved', '2024-06-20', 'Medical Leave'),
(903, 103, 'Emergency', '2024-06-20', '2024-06-25', 'Personal', 'Lt. Ravi Kumar', 'Pending', '2024-06-18', 'To be reviewed'),
(904, 104, 'Training', '2024-08-01', '2024-08-10', 'Special Course', 'Capt. Arjun Reddy', 'Approved', '2024-07-20', 'Training'),
(905, 105, 'Annual', '2024-09-01', '2024-09-15', 'Vacation', 'Capt. Pooja Joshi', 'Approved', '2024-08-15', 'Granted');

-- To remove the data of the table
TRUNCATE TABLE Leaves;

-- To delete the entire table
DROP TABLE Leaves;

-- Table-10: Inventory
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    status VARCHAR(20),
    last_checked DATE,
    assigned_to VARCHAR(100),
    location VARCHAR(100),
    supplier VARCHAR(100),
    remarks VARCHAR(100)
);

INSERT INTO Inventory VALUES
(1001, 'Bulletproof Jackets', 'Protective Gear', 100, 'Good', '2024-06-01', 'Alpha Force', 'Delhi', 'DRDO', 'Ready'),
(1002, 'Helmets', 'Protective Gear', 150, 'Excellent', '2024-05-20', 'Bravo Squad', 'Leh', 'OFB', 'Stocked'),
(1003, 'Binoculars', 'Optics', 50, 'Good', '2024-04-15', 'Delta Unit', 'Shillong', 'BEL', 'Working'),
(1004, 'Medic Kits', 'Medical', 200, 'New', '2024-06-30', 'Eagle Team', 'Hyderabad', 'MedTech', 'Packed'),
(1005, 'Walkie Talkies', 'Communication', 75, 'Good', '2024-07-05', 'Falcon Group', 'Pune', 'Motorola', 'Operational');

-- To remove the data of the table
TRUNCATE TABLE Inventory;

-- To delete the entire table
DROP TABLE Inventory;

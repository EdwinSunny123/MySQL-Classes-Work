-- single line comment

/*
multi line 
comments

*/

-- ---------------------------------------------------Databse Queries----------------------------------------------------
-- create a databse to work on it 
create database Hospital;

-- to work on it you need to use it first 
use Hospital;

-- -------------------------------------------------Database analysis-----------------------------------------------
/*
T-1: Patients(patient_id, full_name, age, gender, contact_no, blood_group)
T-2: Doctors(doctor_id, full_name, specialization, contact_no, availability_status)
T-3: Appointments(appointment_id, patient_name, doctor_name, appointment_date, reason)
T-4: Rooms(room_id, room_type, status, floor, charges_per_day)
T-5: Medicines(medicine_id, name, dosage, purpose, availability_status)

*/

-- ------------------------------------------------Table Queries----------------------------------------------------

-- create table T-1
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    contact_no VARCHAR(20)
);

-- display table T-1
select * from Patients;

-- insert records into table T-1
insert into Patients(patient_id, full_name, age, gender, contact_no)
values
(1, 'Ravi Sharma', 45, 'Male', '9876543210'),
(2, 'Anita Mehta', 30, 'Female', '9123456789'),
(3, 'Rohan Verma', 12, 'Male', '9988776655'),
(4, 'Fatima Khan', 55, 'Female', '9012345678'),
(5, 'John Dsouza', 65, 'Male', '9090909090'),
(6, 'Neha Kapoor', 25, 'Female', '9811122233'),
(7, 'Aarav Malhotra', 40, 'Male', '9898989898'),
(8, 'Sushma Reddy', 36, 'Female', '9123451212'),
(9, 'Manoj Tiwari', 60, 'Male', '9000090000'),
(10, 'Divya Bhatt', 18, 'Female', '9887766554');

-- to remove values from table T-1
truncate table Patients;

-- to drop table T-1
drop table Patients;


-- create table T-2
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    specialization VARCHAR(50),
    contact_no VARCHAR(20),
    availability_status VARCHAR(20)
);

-- display table T-2
select * from Doctors;

-- insert records into table T-2
insert into Doctors(doctor_id, full_name, specialization, contact_no, availability_status)
values
(1, 'Dr. Meena Gupta', 'Cardiology', '9876543211', 'Available'),
(2, 'Dr. Raj Nair', 'Orthopedics', '9123456788', 'Unavailable'),
(3, 'Dr. Priya Sen', 'Pediatrics', '9988776622', 'Available'),
(4, 'Dr. Ravi Mehta', 'General Medicine', '9012345670', 'Available'),
(5, 'Dr. Lata Iyer', 'Dermatology', '9090909091', 'Unavailable'),
(6, 'Dr. Vishal Rao', 'Neurology', '9812345678', 'Available'),
(7, 'Dr. Neeta Jain', 'Gynecology', '9834567890', 'Available'),
(8, 'Dr. Rohit Menon', 'ENT', '9865432109', 'Unavailable'),
(9, 'Dr. Kamal Das', 'Urology', '9876509876', 'Available'),
(10, 'Dr. Sheetal Kulkarni', 'Oncology', '9898981234', 'Unavailable');

-- to remove values from table T-2
truncate table Doctors;

-- to drop table T-2
drop table Doctors;


-- create table T-3
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    doctor_name VARCHAR(100),
    appointment_date DATE,
    reason VARCHAR(100)
);

-- display table T-3
select * from Appointments;

-- insert records into table T-3
insert into Appointments(appointment_id, patient_name, doctor_name, appointment_date, reason)
values 
(1, 'Ravi Sharma', 'Dr. Meena Gupta', '2025-06-15', 'Chest pain'),
(2, 'Anita Mehta', 'Dr. Lata Iyer', '2025-06-16', 'Skin allergy'),
(3, 'Rohan Verma', 'Dr. Priya Sen', '2025-06-17', 'Fever'),
(4, 'Fatima Khan', 'Dr. Raj Nair', '2025-06-18', 'Back pain'),
(5, 'John Dsouza', 'Dr. Ravi Mehta', '2025-06-19', 'General check-up'),
(6, 'Neha Kapoor', 'Dr. Neeta Jain', '2025-06-20', 'Routine check-up'),
(7, 'Aarav Malhotra', 'Dr. Vishal Rao', '2025-06-21', 'Headache'),
(8, 'Sushma Reddy', 'Dr. Rohit Menon', '2025-06-22', 'Ear infection'),
(9, 'Manoj Tiwari', 'Dr. Kamal Das', '2025-06-23', 'Urinary issue'),
(10, 'Divya Bhatt', 'Dr. Sheetal Kulkarni', '2025-06-24', 'Cancer screening');

-- to remove values from table T-3
truncate table Appointments;

-- to drop table T-3
drop table Appointments;



-- create table T-4
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(50),
    status VARCHAR(20),
    floor INT,
    charges_per_day INT
);

-- display table T-4
select * from Rooms;

-- insert records into table T-4
insert into Rooms(room_id, room_type, status, floor, charges_per_day)
values
(1, 'Private', 'Occupied', 1, 3000),
(2, 'General', 'Available', 2, 1000),
(3, 'ICU', 'Occupied', 1, 5000),
(4, 'Semi-Private', 'Available', 3, 2000),
(5, 'Deluxe', 'Occupied', 2, 4000),
(6, 'ICU', 'Available', 1, 5000),
(7, 'Private', 'Available', 2, 3000),
(8, 'General', 'Occupied', 3, 1000),
(9, 'Semi-Private', 'Occupied', 1, 2000),
(10, 'Deluxe', 'Available', 4, 4000);

-- to remove values from table T-4
truncate table Rooms;

-- to drop table T-4
drop table Rooms;


-- create table T-5
CREATE TABLE Medicines (
    medicine_id INT PRIMARY KEY,
    name VARCHAR(100),
    dosage VARCHAR(50),
    purpose VARCHAR(100),
    availability_status VARCHAR(20)
);

-- display table T-5
select * from Medicines;

-- insert records into table T-5
insert into Medicines(medicine_id, name, dosage, purpose, availability_status)
values
(1, 'Paracetamol', '500mg', 'Fever', 'Available'),
(2, 'Amoxicillin', '250mg', 'Infection', 'Unavailable'),
(3, 'Cetirizine', '10mg', 'Allergy', 'Available'),
(4, 'Ibuprofen', '400mg', 'Pain relief', 'Available'),
(5, 'Ranitidine', '150mg', 'Acidity', 'Unavailable'),
(6, 'Azithromycin', '500mg', 'Infection', 'Available'),
(7, 'Dolo', '650mg', 'Fever', 'Unavailable'),
(8, 'Metformin', '500mg', 'Diabetes', 'Available'),
(9, 'Atorvastatin', '10mg', 'Cholesterol', 'Available'),
(10, 'Omeprazole', '20mg', 'Acidity', 'Unavailable');


-- to remove values from table T-5
truncate table Medicines;

-- to drop table T-5
drop table Medicines;
-- Single line comment
/*
Multi-line 
comment
*/

-- ------------------------------------------------------------------ Database Queries ---------------------------------------------------
-- create a dataabse to work on it 
CREATE DATABASE ISRO;

-- to work on that database use it first 
use ISRO;

-- ----------------------------------------------------------------- Table Analysis -----------------------------------------------------
/*
Table-1  : Satellites(satellite_id, satellite_name, launch_date, mission_type, status, orbit_type, weight, operator, life_span_years, country)
Table-2  : Launch_Vehicles(vehicle_id, vehicle_name, type, capacity_kg, height_m, stages, manufacturer, status, first_launch, last_launch)
Table-3  : Missions(mission_id, mission_name, satellite_id, objective, launch_vehicle_id, launch_date, duration_days, mission_status, agency, remarks)
Table-4  : Space_Centers(center_id, center_name, location, director, established_year, area_acres, staff_count, research_fields, facilities, status)
Table-5  : Scientists(scientist_id, first_name, last_name, dob, gender, department, specialization, center_id, joining_date, status)
Table-6  : Experiments(experiment_id, experiment_name, mission_id, objective, equipment_used, duration_days, lead_scientist, status, result, remarks)
Table-7  : Payloads(payload_id, payload_name, satellite_id, purpose, weight, manufacturer, power_usage, frequency, resolution, status)
Table-8  : Ground_Stations(station_id, station_name, location, center_id, established_year, antenna_diameter_m, frequency_range, staff_count, operating_status, remarks)
Table-9  : Collaborations(collab_id, country, organization, mission_id, area_of_collaboration, start_year, end_year, status, funding_usd_m, remarks)
Table-10 : Budgets(budget_id, year, allocated_amount_cr, used_amount_cr, remaining_amount_cr, department, approved_by, date_approved, remarks, status)

*/

-- ---------------------------------------------------------------- Database Queries -----------------------------------------------------
-- TABLE 1: Scientists
CREATE TABLE Scientists (
    scientist_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender VARCHAR(10),
    specialization VARCHAR(100),
    department_id INT,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    status VARCHAR(20)
);

INSERT INTO Scientists VALUES
(101, 'Rakesh', 'Sharma', '1975-08-15', 'Male', 'Astrophysics', 201, 'rakesh.sharma@isro.gov.in', '9876543210', 'Active'),
(102, 'Kalpana', 'Mehta', '1980-05-10', 'Female', 'Satellite Design', 202, 'kalpana.mehta@isro.gov.in', '9876543211', 'Active'),
(103, 'Vikram', 'Raj', '1982-03-25', 'Male', 'Rocket Propulsion', 203, 'vikram.raj@isro.gov.in', '9876543212', 'Inactive'),
(104, 'Anjali', 'Menon', '1988-12-20', 'Female', 'Data Analytics', 204, 'anjali.menon@isro.gov.in', '9876543213', 'Active'),
(105, 'Suresh', 'Kumar', '1970-11-30', 'Male', 'Mission Control', 205, 'suresh.kumar@isro.gov.in', '9876543214', 'Active');

TRUNCATE TABLE Scientists;
DROP TABLE Scientists;

-- TABLE 2: Departments
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    director_name VARCHAR(100),
    location VARCHAR(100),
    established_year INT,
    contact_email VARCHAR(100),
    phone_number VARCHAR(15),
    floor_number INT,
    headcount INT,
    status VARCHAR(20)
);

INSERT INTO Departments VALUES
(201, 'Astrophysics', 'Dr. Arvind Patel', 'Bengaluru', 1990, 'astro@isro.gov.in', '0801234567', 2, 50, 'Active'),
(202, 'Satellite Design', 'Dr. Priya Rao', 'Hyderabad', 1995, 'satdesign@isro.gov.in', '0801234568', 3, 70, 'Active'),
(203, 'Rocket Propulsion', 'Dr. Sunil Joshi', 'Sriharikota', 2000, 'propulsion@isro.gov.in', '0801234569', 5, 60, 'Active'),
(204, 'Data Analytics', 'Dr. Neha Shah', 'Bengaluru', 2010, 'analytics@isro.gov.in', '0801234570', 4, 40, 'Active'),
(205, 'Mission Control', 'Dr. Kiran Dev', 'Sriharikota', 1985, 'mission@isro.gov.in', '0801234571', 1, 80, 'Active');

TRUNCATE TABLE Departments;
DROP TABLE Departments;

-- TABLE 3: Satellites
CREATE TABLE Satellites (
    satellite_id INT PRIMARY KEY,
    satellite_name VARCHAR(100),
    launch_date DATE,
    orbit_type VARCHAR(50),
    payload VARCHAR(100),
    mission_id INT,
    lifespan_years INT,
    status VARCHAR(20),
    control_center VARCHAR(100),
    remarks VARCHAR(200)
);

INSERT INTO Satellites VALUES
(301, 'INSAT-1A', '2020-01-15', 'GEO', 'Weather Monitoring', 401, 12, 'Active', 'Bengaluru', 'Operational'),
(302, 'GSAT-10', '2021-06-10', 'GEO', 'Communication', 402, 15, 'Active', 'Hyderabad', 'Clear signals'),
(303, 'IRNSS-1A', '2019-08-05', 'GEO', 'Navigation', 403, 10, 'Inactive', 'Bengaluru', 'Power failure'),
(304, 'RISAT-2B', '2022-03-11', 'LEO', 'Radar Imaging', 404, 8, 'Active', 'Sriharikota', 'Stable'),
(305, 'CartoSat-3', '2023-12-01', 'LEO', 'Earth Observation', 405, 6, 'Active', 'Sriharikota', 'High resolution');

TRUNCATE TABLE Satellites;
DROP TABLE Satellites;

-- TABLE 4: Missions
CREATE TABLE Missions (
    mission_id INT PRIMARY KEY,
    mission_name VARCHAR(100),
    launch_vehicle VARCHAR(100),
    launch_site VARCHAR(100),
    launch_date DATE,
    mission_status VARCHAR(20),
    duration_days INT,
    mission_type VARCHAR(50),
    total_cost DECIMAL(12,2),
    remarks VARCHAR(200)
);

INSERT INTO Missions VALUES
(401, 'Chandrayaan-2', 'GSLV Mk III', 'Sriharikota', '2019-07-22', 'Partially Successful', 48, 'Lunar', 978000000.00, 'Lander failed'),
(402, 'Mars Orbiter Mission', 'PSLV-C25', 'Sriharikota', '2013-11-05', 'Successful', 298, 'Mars', 450000000.00, 'First Asian Mars Mission'),
(403, 'Gaganyaan', 'GSLV Mk III', 'Sriharikota', '2025-01-01', 'Planned', 7, 'Human Spaceflight', 1000000000.00, 'First manned mission'),
(404, 'INSAT-3DR', 'GSLV-F05', 'Sriharikota', '2016-09-08', 'Successful', 3650, 'Weather', 900000000.00, 'Operational'),
(405, 'Cartosat-3 Launch', 'PSLV-C47', 'Sriharikota', '2019-11-27', 'Successful', 3650, 'Earth Observation', 150000000.00, 'High res imaging');

TRUNCATE TABLE Missions;
DROP TABLE Missions;

-- TABLE 5: Launch_Vehicles
CREATE TABLE Launch_Vehicles (
    vehicle_id INT PRIMARY KEY,
    vehicle_name VARCHAR(100),
    type VARCHAR(50),
    stages INT,
    payload_capacity_kg INT,
    height_meters INT,
    thrust_kN INT,
    successful_launches INT,
    failed_launches INT,
    status VARCHAR(20)
);

INSERT INTO Launch_Vehicles VALUES
(501, 'PSLV-C51', 'PSLV', 4, 1750, 44, 4800, 54, 2, 'Active'),
(502, 'GSLV Mk III', 'GSLV', 3, 4000, 43, 7000, 6, 1, 'Active'),
(503, 'SSLV-D2', 'SSLV', 3, 500, 34, 2000, 2, 1, 'Experimental'),
(504, 'ASLV-XL', 'ASLV', 4, 150, 23, 1000, 4, 3, 'Retired'),
(505, 'Rohini', 'Sounding Rocket', 1, 50, 10, 500, 100, 0, 'Retired');

TRUNCATE TABLE Launch_Vehicles;
DROP TABLE Launch_Vehicles;

-- TABLE 6: Research_Centers
CREATE TABLE Research_Centers (
    center_id INT PRIMARY KEY,
    center_name VARCHAR(100),
    location VARCHAR(100),
    established_year INT,
    director VARCHAR(100),
    specialization VARCHAR(100),
    staff_count INT,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    status VARCHAR(20)
);

INSERT INTO Research_Centers VALUES
(601, 'VSSC', 'Thiruvananthapuram', 1963, 'Dr. Narayan Murthy', 'Launch Vehicles', 2000, 'vssc@isro.gov.in', '0471234567', 'Active'),
(602, 'URSC', 'Bengaluru', 1972, 'Dr. Leela Rajan', 'Satellite Technology', 1800, 'ursc@isro.gov.in', '0806543210', 'Active'),
(603, 'SAC', 'Ahmedabad', 1972, 'Dr. Sandeep Sharma', 'Remote Sensing', 1600, 'sac@isro.gov.in', '0792345678', 'Active'),
(604, 'ISTRAC', 'Bengaluru', 1967, 'Dr. Kavitha Desai', 'Mission Control', 1500, 'istrac@isro.gov.in', '0807654321', 'Active'),
(605, 'SHAR', 'Sriharikota', 1969, 'Dr. Akash Nair', 'Launch Site', 1200, 'shar@isro.gov.in', '0867234567', 'Active');

TRUNCATE TABLE Research_Centers;
DROP TABLE Research_Centers;

-- TABLE 7: Engineers
CREATE TABLE Engineers (
    engineer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role VARCHAR(100),
    center_id INT,
    experience_years INT,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    qualification VARCHAR(100),
    status VARCHAR(20)
);

INSERT INTO Engineers VALUES
(701, 'Arjun', 'Verma', 'Structural Engineer', 601, 10, 'arjun.verma@isro.gov.in', '9876543215', 'M.Tech Aerospace', 'Active'),
(702, 'Neha', 'Kapoor', 'Software Engineer', 602, 5, 'neha.kapoor@isro.gov.in', '9876543216', 'M.Tech CSE', 'Active'),
(703, 'Rajeev', 'Singh', 'Thermal Engineer', 603, 8, 'rajeev.singh@isro.gov.in', '9876543217', 'M.Tech Mechanical', 'Active'),
(704, 'Divya', 'Rao', 'Control Systems', 604, 6, 'divya.rao@isro.gov.in', '9876543218', 'M.Tech ECE', 'Active'),
(705, 'Amit', 'Das', 'Launch Systems', 605, 12, 'amit.das@isro.gov.in', '9876543219', 'M.Tech Aerospace', 'Active');

TRUNCATE TABLE Engineers;
DROP TABLE Engineers;

-- TABLE 8: Experiments
CREATE TABLE Experiments (
    experiment_id INT PRIMARY KEY,
    experiment_name VARCHAR(100),
    mission_id INT,
    objective VARCHAR(200),
    result VARCHAR(200),
    date_conducted DATE,
    scientist_id INT,
    status VARCHAR(20),
    report_link VARCHAR(200),
    remarks VARCHAR(100)
);

INSERT INTO Experiments VALUES
(801, 'Lunar Soil Analysis', 401, 'Study Moon soil composition', 'Detected rare minerals', '2019-08-01', 101, 'Completed', 'http://isro.gov.in/reports/lunar_soil', 'High value'),
(802, 'Mars Atmosphere', 402, 'Analyze Martian gases', 'Found methane traces', '2014-02-12', 102, 'Completed', 'http://isro.gov.in/reports/mars_gas', 'Potential signs of life'),
(803, 'Communication Delay', 404, 'Test data transfer latency', '2s delay recorded', '2017-01-15', 104, 'Completed', 'http://isro.gov.in/reports/comm_delay', 'Standard result'),
(804, 'Thermal Shield Test', 403, 'Simulate re-entry heat', 'Passed test phase', '2024-06-10', 103, 'Ongoing', 'http://isro.gov.in/reports/shield_test', 'Promising'),
(805, 'Earth Imaging', 405, 'High res image capture', 'Success', '2024-01-15', 105, 'Completed', 'http://isro.gov.in/reports/earth_img', 'Excellent clarity');

TRUNCATE TABLE Experiments;
DROP TABLE Experiments;

-- TABLE 9: Interns
CREATE TABLE Interns (
    intern_id INT PRIMARY KEY,
    name VARCHAR(100),
    university VARCHAR(100),
    course VARCHAR(100),
    duration_months INT,
    department_id INT,
    mentor_id INT,
    start_date DATE,
    email VARCHAR(100),
    status VARCHAR(20)
);

INSERT INTO Interns VALUES
(901, 'Ritu Sharma', 'IIT Bombay', 'Aerospace Engg', 6, 201, 101, '2024-01-10', 'ritu.sharma@iitb.ac.in', 'Active'),
(902, 'Karan Patel', 'IISc Bangalore', 'Computer Science', 4, 204, 102, '2024-02-01', 'karan.patel@iisc.ac.in', 'Active'),
(903, 'Megha Sinha', 'NIT Trichy', 'Electronics', 5, 203, 104, '2024-03-05', 'megha.sinha@nitt.ac.in', 'Active'),
(904, 'Rohan Das', 'VIT Vellore', 'Mechanical Engg', 3, 202, 103, '2024-04-10', 'rohan.das@vit.ac.in', 'Completed'),
(905, 'Anusha Rao', 'BITS Pilani', 'Physics', 6, 205, 105, '2024-05-01', 'anusha.rao@bits.ac.in', 'Active');

TRUNCATE TABLE Interns;
DROP TABLE Interns;

-- TABLE 10: Collaborations
CREATE TABLE Collaborations (
    collaboration_id INT PRIMARY KEY,
    partner_org VARCHAR(100),
    country VARCHAR(50),
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    budget DECIMAL(12,2),
    is_govt_agency BOOLEAN,
    remarks VARCHAR(200)
);

INSERT INTO Collaborations VALUES
(1001, 'NASA', 'USA', 'Chandrayaan Instruments', '2018-01-01', '2020-12-31', 'Completed', 200000000.00, TRUE, 'Data sharing partnership'),
(1002, 'CNES', 'France', 'Climate Satellite', '2019-05-10', '2022-11-30', 'Completed', 150000000.00, TRUE, 'Joint satellite design'),
(1003, 'JAXA', 'Japan', 'Lunar Lander', '2023-01-01', '2025-12-31', 'Ongoing', 300000000.00, TRUE, 'Lunar rover collaboration'),
(1004, 'SpaceX', 'USA', 'Tech Exchange', '2022-01-01', '2026-12-31', 'Ongoing', 500000000.00, FALSE, 'R&D sharing'),
(1005, 'ISRO Academy', 'India', 'Internship Program', '2020-01-01', '2024-12-31', 'Completed', 10000000.00, TRUE, 'Talent development');

TRUNCATE TABLE Collaborations;
DROP TABLE Collaborations;



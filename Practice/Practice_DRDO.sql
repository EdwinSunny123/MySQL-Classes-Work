-- Single line comment
/*
Multi-line 
comment
*/

-- ------------------------------------------------------------------ Database Queries ---------------------------------------------------
-- create a dataabse to work on it 
CREATE DATABASE DRDO;

-- to work on that database use it first 
use DRDO;

-- ----------------------------------------------------------------- Table Analysis -----------------------------------------------------
/*

Table-1 : Scientists(scientist_id, first_name, last_name, designation, department_id, specialization, date_of_joining, email, phone_number, status)
Table-2 : Departments(department_id, department_name, location, head_id, established_year, contact_number, budget, building_name, floor, status)
Table-3 : Projects(project_id, project_name, department_id, start_date, end_date, project_lead, budget, status, objective, remarks)
Table-4 : ResearchPapers(paper_id, title, author_id, publication_date, journal_name, impact_factor, keywords, citations, department_id, status)
Table-5 : Collaborations(collaboration_id, partner_name, type, start_date, end_date, contact_person, contact_email, country, project_id, status)
Table-6 : Equipment(equipment_id, item_name, category, manufacturer, purchase_date, cost, location, assigned_to, condition, status)
Table-7 : Tests(test_id, test_name, project_id, test_date, location, results, duration_days, conducted_by, remarks, status)
Table-8 : Publications(publication_id, title, author_id, department_id, publish_date, journal_name, impact_factor, citations, doi, status)
Table-9 : Budgets(budget_id, fiscal_year, department_id, allocated_amount, spent_amount, approval_date, approved_by, remarks, status, last_updated)
Table-10 : Awards(award_id, award_name, recipient_id, award_year, awarding_body, cash_prize, category, description, event_location, status)

*/

-- ---------------------------------------------------------------- Database Queries -----------------------------------------------------
	-- Table-1 : Scientists
CREATE TABLE Scientists (
    scientist_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    designation VARCHAR(50),
    department_id INT,
    specialization VARCHAR(100),
    date_of_joining DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    status VARCHAR(20)
);

INSERT INTO Scientists VALUES
(101, 'Rajesh', 'Kumar', 'Senior Scientist', 201, 'Missile Technology', '2005-04-12', 'rajesh.kumar@drdo.gov.in', '9876540101', 'Active'),
(102, 'Anita', 'Sharma', 'Principal Scientist', 202, 'Radar Systems', '2008-06-20', 'anita.sharma@drdo.gov.in', '9876540102', 'Active'),
(103, 'Vikram', 'Rao', 'Lead Scientist', 203, 'AI & ML', '2010-09-15', 'vikram.rao@drdo.gov.in', '9876540103', 'On Leave'),
(104, 'Pooja', 'Nair', 'Scientist', 204, 'Cybersecurity', '2012-01-10', 'pooja.nair@drdo.gov.in', '9876540104', 'Active'),
(105, 'Arjun', 'Singh', 'Scientist', 205, 'Satellite Systems', '2015-07-05', 'arjun.singh@drdo.gov.in', '9876540105', 'Active');

-- to remove the data of the table 
TRUNCATE TABLE Scientists;

-- to delete the entire table 
DROP TABLE Scientists;


-- Table-2 : Departments
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100),
    head_id INT,
    established_year INT,
    contact_number VARCHAR(15),
    budget DECIMAL(15,2),
    building_name VARCHAR(50),
    floor INT,
    status VARCHAR(20)
);

INSERT INTO Departments VALUES
(201, 'Missile Development', 'Hyderabad', 101, 1985, '0401234001', 50000000.00, 'AeroTech Block', 3, 'Active'),
(202, 'Radar Systems', 'Bengaluru', 102, 1990, '0801234002', 35000000.00, 'Signal Block', 2, 'Active'),
(203, 'AI Research', 'Pune', 103, 2015, '0201234003', 20000000.00, 'TechAI Lab', 1, 'Active'),
(204, 'Cybersecurity', 'Delhi', 104, 2012, '0111234004', 25000000.00, 'Cyber Block', 5, 'Active'),
(205, 'Satellite Systems', 'Ahmedabad', 105, 2000, '0791234005', 40000000.00, 'Orbit Complex', 4, 'Active');

-- to remove the data of the table 
TRUNCATE TABLE Departments;

-- to delete the entire table 
DROP TABLE Departments;


-- Table-3 : Projects
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    start_date DATE,
    end_date DATE,
    project_lead VARCHAR(100),
    budget DECIMAL(15,2),
    status VARCHAR(20),
    objective TEXT,
    remarks TEXT
);

INSERT INTO Projects VALUES
(301, 'Agni-V Upgrade', 201, '2020-01-01', '2024-12-31', 'Rajesh Kumar', 20000000.00, 'Ongoing', 'Enhance missile range and precision', 'Phase 2 initiated'),
(302, 'Radar-X', 202, '2019-06-15', '2023-11-30', 'Anita Sharma', 15000000.00, 'Completed', 'Develop advanced radar system', 'Successfully deployed'),
(303, 'AI Defence Protocol', 203, '2021-03-10', '2025-08-20', 'Vikram Rao', 12000000.00, 'Ongoing', 'Integrate AI into defence systems', 'In testing phase'),
(304, 'Cyber Shield', 204, '2020-07-01', '2023-12-31', 'Pooja Nair', 10000000.00, 'Completed', 'Strengthen cybersecurity measures', 'Operational'),
(305, 'Satellite NavSys', 205, '2018-05-20', '2022-09-15', 'Arjun Singh', 18000000.00, 'Completed', 'Improve satellite navigation systems', 'Deployed successfully');

-- to remove the data of the table 
TRUNCATE TABLE Projects;

-- to delete the entire table 
DROP TABLE Projects;


-- Table-4 : ResearchPapers
CREATE TABLE ResearchPapers (
    paper_id INT PRIMARY KEY,
    title VARCHAR(200),
    author_id INT,
    publication_date DATE,
    journal_name VARCHAR(100),
    impact_factor DECIMAL(3,2),
    keywords TEXT,
    citations INT,
    department_id INT,
    status VARCHAR(20)
);

INSERT INTO ResearchPapers VALUES
(401, 'Next-Gen Missile Guidance', 101, '2021-06-15', 'Defence Tech Journal', 4.50, 'missile,guidance', 120, 201, 'Published'),
(402, 'Advanced Radar Algorithms', 102, '2020-03-10', 'Radar Innovations', 3.80, 'radar,algorithms', 95, 202, 'Published'),
(403, 'AI in Modern Warfare', 103, '2022-01-25', 'AI Defence Review', 4.90, 'AI,defence', 150, 203, 'Published'),
(404, 'Cybersecurity for Defence Networks', 104, '2021-11-05', 'CyberTech', 4.20, 'cybersecurity,defence', 110, 204, 'Published'),
(405, 'Satellite Communication Enhancements', 105, '2019-09-12', 'SpaceComm Journal', 3.70, 'satellite,communication', 80, 205, 'Published');

-- to remove the data of the table 
TRUNCATE TABLE ResearchPapers;

-- to delete the entire table 
DROP TABLE ResearchPapers;


-- Table-5 : Collaborations
CREATE TABLE Collaborations (
    collaboration_id INT PRIMARY KEY,
    partner_name VARCHAR(100),
    type VARCHAR(50),
    start_date DATE,
    end_date DATE,
    contact_person VARCHAR(100),
    contact_email VARCHAR(100),
    country VARCHAR(50),
    project_id INT,
    status VARCHAR(20)
);

INSERT INTO Collaborations VALUES
(501, 'ISRO', 'Space Research', '2020-01-01', NULL, 'Dr. Mehta', 'mehta@isro.gov.in', 'India', 305, 'Active'),
(502, 'HAL', 'Aerospace', '2019-04-15', '2024-04-14', 'Mr. Reddy', 'reddy@hal-india.co.in', 'India', 301, 'Active'),
(503, 'BEL', 'Electronics', '2021-07-10', '2025-07-09', 'Ms. Kapoor', 'kapoor@bel-india.in', 'India', 302, 'Active'),
(504, 'MIT', 'Research', '2020-09-01', '2023-08-31', 'Prof. Smith', 'smith@mit.edu', 'USA', 303, 'Completed'),
(505, 'BAE Systems', 'Defence Tech', '2018-05-20', '2022-05-19', 'Mr. Brown', 'brown@baesystems.com', 'UK', 304, 'Completed');

-- to remove the data of the table 
TRUNCATE TABLE Collaborations;

-- to delete the entire table 
DROP TABLE Collaborations;


-- Table-6 : Equipment
CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    manufacturer VARCHAR(100),
    purchase_date DATE,
    cost DECIMAL(15,2),
    location VARCHAR(100),
    assigned_to INT,
    position VARCHAR(50),
    status VARCHAR(20)
);

INSERT INTO Equipment VALUES
(601, 'Wind Tunnel', 'Testing', 'AeroTech Pvt Ltd', '2010-02-15', 15000000.00, 'Bengaluru', 101, 'Operational', 'Active'),
(602, '3D Printing Machine', 'Manufacturing', 'ProtoMakers Inc.', '2018-07-20', 5000000.00, 'Pune', 103, 'Operational', 'Active'),
(603, 'Radar Simulation Unit', 'Testing', 'BEL', '2015-05-10', 8000000.00, 'Delhi', 102, 'Operational', 'Active'),
(604, 'Submarine Sonar Module', 'Naval', 'NavalTech Ltd', '2019-09-05', 12000000.00, 'Kochi', 105, 'Operational', 'Active'),
(605, 'Missile Launch Platform', 'Testing', 'DefenceWorks', '2014-04-12', 25000000.00, 'Hyderabad', 101, 'Operational', 'Active');

-- to remove the data of the table 
TRUNCATE TABLE Equipment;

-- to delete the entire table 
DROP TABLE Equipment;


-- Table-7 : Tests
CREATE TABLE Tests (
    test_id INT PRIMARY KEY,
    test_name VARCHAR(100),
    project_id INT,
    test_date DATE,
    location VARCHAR(100),
    results VARCHAR(50),
    duration_days INT,
    conducted_by INT,
    remarks TEXT,
    status VARCHAR(20)
);

INSERT INTO Tests VALUES
(701, 'Agni-V Final Trial', 301, '2019-12-10', 'Odisha Coast', 'Success', 5, 101, 'Hit target with precision', 'Completed'),
(702, 'LCA Engine Test', 302, '2018-11-15', 'Bengaluru', 'Success', 3, 102, 'Improved thrust performance', 'Completed'),
(703, 'UAV Surveillance Test', 303, '2021-08-05', 'Chennai', 'Partial Success', 2, 103, 'Needs better endurance', 'Ongoing'),
(704, 'Radar Detection Range Test', 304, '2020-03-12', 'Delhi', 'Success', 1, 104, 'Increased range by 50km', 'Completed'),
(705, 'Submarine Sonar Deep Sea Test', 305, '2021-11-25', 'Kochi', 'Ongoing', 7, 105, 'Sea trials in progress', 'Ongoing');

-- to remove the data of the table 
TRUNCATE TABLE Tests;

-- to delete the entire table 
DROP TABLE Tests;


-- Table-8 : Publications
CREATE TABLE Publications (
    publication_id INT PRIMARY KEY,
    title VARCHAR(200),
    author_id INT,
    department_id INT,
    publish_date DATE,
    journal_name VARCHAR(100),
    impact_factor DECIMAL(3,2),
    citations INT,
    doi VARCHAR(100),
    status VARCHAR(20)
);

INSERT INTO Publications VALUES
(801, 'Advances in Missile Guidance', 101, 201, '2018-06-01', 'Defence Tech Journal', 4.50, 120, '10.1000/xyz1', 'Published'),
(802, 'Light Combat Aircraft Development Challenges', 102, 202, '2019-09-15', 'Aerospace Review', 3.80, 95, '10.1000/xyz2', 'Published'),
(803, 'UAVs for Border Surveillance', 103, 203, '2021-01-20', 'Drone Innovations', 3.20, 60, '10.1000/xyz3', 'Published'),
(804, 'Radar Signal Processing Advances', 104, 204, '2020-05-10', 'Radar Systems Journal', 4.10, 80, '10.1000/xyz4', 'Published'),
(805, 'Sonar Systems for Submarines', 105, 205, '2021-07-25', 'Naval Engineering Review', 3.60, 70, '10.1000/xyz5', 'Published');

-- to remove the data of the table 
TRUNCATE TABLE Publications;

-- to delete the entire table 
DROP TABLE Publications;


-- Table-9 : Budgets
CREATE TABLE Budgets (
    budget_id INT PRIMARY KEY,
    fiscal_year INT,
    department_id INT,
    allocated_amount DECIMAL(15,2),
    spent_amount DECIMAL(15,2),
    approval_date DATE,
    approved_by VARCHAR(100),
    remarks TEXT,
    status VARCHAR(20),
    last_updated DATE
);

INSERT INTO Budgets VALUES
(901, 2018, 201, 1000000000.00, 950000000.00, '2018-04-01', 'Defence Minister', 'Missile program budget', 'Closed', '2019-01-01'),
(902, 2019, 202, 1200000000.00, 1150000000.00, '2019-04-01', 'Defence Minister', 'Aircraft program budget', 'Closed', '2020-01-01'),
(903, 2020, 203, 500000000.00, 300000000.00, '2020-04-01', 'Defence Minister', 'Drone development budget', 'Ongoing', '2021-01-01'),
(904, 2021, 204, 400000000.00, 350000000.00, '2021-04-01', 'Defence Minister', 'Radar upgrade budget', 'Closed', '2022-01-01'),
(905, 2022, 205, 600000000.00, 200000000.00, '2022-04-01', 'Defence Minister', 'Submarine sonar development budget', 'Ongoing', '2023-01-01');

-- to remove the data of the table 
TRUNCATE TABLE Budgets;

-- to delete the entire table 
DROP TABLE Budgets;


-- Table-10 : Awards
CREATE TABLE Awards (
    award_id INT PRIMARY KEY,
    award_name VARCHAR(100),
    recipient_id INT,
    award_year INT,
    awarding_body VARCHAR(100),
    cash_prize DECIMAL(15,2),
    category VARCHAR(50),
    description TEXT,
    event_location VARCHAR(100),
    status VARCHAR(20)
);

INSERT INTO Awards VALUES
(1001, 'Defence Scientist Award', 101, 2019, 'DRDO', 500000.00, 'Excellence', 'For successful missile project', 'Hyderabad', 'Active'),
(1002, 'Aerospace Excellence Award', 102, 2020, 'DRDO', 400000.00, 'Aerospace', 'For LCA development', 'Bengaluru', 'Active'),
(1003, 'Innovation in Drone Tech', 103, 2021, 'DRDO', 300000.00, 'Innovation', 'For UAV surveillance', 'Pune', 'Active'),
(1004, 'Radar Technology Pioneer', 104, 2020, 'DRDO', 350000.00, 'Radar', 'For radar upgrade', 'Delhi', 'Active'),
(1005, 'Naval Systems Innovation', 105, 2022, 'DRDO', 450000.00, 'Naval', 'For sonar development', 'Kochi', 'Active');

-- to remove the data of the table 
TRUNCATE TABLE Awards;

-- to delete the entire table 
DROP TABLE Awards;

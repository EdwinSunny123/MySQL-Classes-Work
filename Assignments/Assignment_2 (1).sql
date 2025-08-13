-- single line comment 
/*
Multi line
comments
*/
-- --------------------------------------------------Database Queries --------------------------------------------------------------------------------
-- create a databse to work on it 
create database Health_Care_systems;

-- to work on it use it first 
use Health_Care_systems;

-- --------------------------------------------------- Database Analysis--------------------------------------------------------------------------

/*
Table-1 Patients: Patient_ID (Primary Key), Name, Age, Gender, Contact, Address.
Table-2 Doctors: Doctor_ID (Primary Key), Name, Specialty, Phone, Email.
Table-3 Appointments: Appointment_ID (Primary Key), Patient_ID (FK), Doctor_ID (FK), Date, Time, Status.
Table-4 Medical_History: History_ID (Primary Key), Patient_ID (FK), Diagnosis, Treatment, Notes.
Table-5 Medications: Medication_ID (Primary Key), Name, Type, Price, Description.
Table-6 Prescriptions: Prescription_ID (Primary Key), Patient_ID (FK), Medication_ID (FK), Date_Provided, Dosage.
Table-7 Bills: Bill_ID (Primary Key), Patient_ID (FK), Total_Amount, Payment_Status, Date.
Table-8 Staff: Staff_ID (Primary Key), Name, Role, Contact, Shift.
Table-9 Departments: Department_ID (Primary Key), Name, Location, Phone.
Table-10 Facilities: Facility_ID (Primary Key), Name, Type, Cost, Availability_Status.

*/

-- --------------------------------------------------------Table Related Queries ------------------------------------------------------------------

-- Table-1 Pateients
create table Patients(
Patient_ID  int primary key, 
Name varchar(100) not null, 
Age int not null, 
Gender varchar(10),  
Contact varchar(20) not null, 
Address varchar(150)
);

-- insert records into table-1
INSERT INTO Patients (Patient_ID, Name, Age, Gender, Contact, Address) VALUES
(1, 'Rahul Mehta', 32, 'Male', '9876543210', 'Mumbai, Maharashtra'),
(2, 'Anjali Sharma', 28, 'Female', '9123456789', 'Delhi, Delhi'),
(3, 'Amit Patel', 45, 'Male', '9988776655', 'Ahmedabad, Gujarat'),
(4, 'Priya Nair', 36, 'Female', '9786543210', 'Kochi, Kerala'),
(5, 'Ravi Kumar', 52, 'Male', '9854213890', 'Bengaluru, Karnataka'),
(6, 'Sneha Desai', 30, 'Female', '9090909090', 'Pune, Maharashtra'),
(7, 'Vikram Singh', 60, 'Male', '9822001122', 'Jaipur, Rajasthan'),
(8, 'Meena Joshi', 41, 'Female', '9911554488', 'Chandigarh, Punjab'),
(9, 'Arjun Reddy', 25, 'Male', '9877012345', 'Hyderabad, Telangana'),
(10, 'Divya Iyer', 39, 'Female', '9765432109', 'Chennai, Tamil Nadu');


-- display the data of table-1
select * from Patients;

-- 1. Select all patients older than 40
SELECT * FROM Patients WHERE Age > 40;

-- 2. Select gender-wise patient count
SELECT Gender, COUNT(*) AS Total FROM Patients GROUP BY Gender;

-- 3. Select gender-wise count having more than 2 patients
SELECT Gender, COUNT(*) AS Count FROM Patients GROUP BY Gender HAVING COUNT(*) > 2;

-- 4. Select all patients ordered by age descending
SELECT * FROM Patients ORDER BY Age DESC;

-- 5. Select top 3 youngest patients
SELECT * FROM Patients ORDER BY Age ASC LIMIT 3;

-- 6. Add a column for Blood_Group
ALTER TABLE Patients ADD Blood_Group VARCHAR(5);

-- 7. Modify Contact column length
ALTER TABLE Patients MODIFY Contact VARCHAR(25);

-- 8. Change Address column name to Location
ALTER TABLE Patients CHANGE Address Location VARCHAR(150);

-- 9. Add a column for Nationality
ALTER TABLE Patients ADD Nationality VARCHAR(30);

-- 10. Drop the Nationality column
ALTER TABLE Patients DROP COLUMN Nationality;

-- 11. Delete patient with ID 10
DELETE FROM Patients WHERE Patient_ID = 10;

-- 12. Delete all patients aged above 55
DELETE FROM Patients WHERE Age > 55;

-- 13. Delete male patients below age 30
DELETE FROM Patients WHERE Gender = 'Male' AND Age < 30;

-- 14. Delete patients from Maharashtra
DELETE FROM Patients WHERE Location LIKE '%Maharashtra%';

-- 15. Delete patients whose name is 'Ravi Kumar'
DELETE FROM Patients WHERE Name = 'Ravi Kumar';

-- 16. Rename table to Patient_Info
RENAME TABLE Patients TO Patient_Info;

-- 17. Rename table back to Patients
RENAME TABLE Patient_Info TO Patients;

-- 18. Rename column Location back to Address
ALTER TABLE Patients CHANGE Location Address VARCHAR(150);

-- 19. Rename column Name to Full_Name
ALTER TABLE Patients CHANGE Name Full_Name VARCHAR(100);

-- 20. Rename column Gender to Sex
ALTER TABLE Patients CHANGE Gender Sex VARCHAR(10);


-- 21. Update age of patient with ID 2
UPDATE Patients SET Age = 29 WHERE Patient_ID = 2;

-- 22. Update contact number of the youngest patient
UPDATE Patients SET Contact = '9000000000' 
WHERE Patient_ID = (SELECT Patient_ID FROM Patients ORDER BY Age ASC LIMIT 1);

-- 23. Update address of patients from Delhi
UPDATE Patients SET Address = 'New Delhi' WHERE Address = 'Delhi, Delhi';

-- 24. Update gender of patient named 'Divya Iyer'
UPDATE Patients SET Gender = 'F' WHERE Name = 'Divya Iyer';

-- 25. Update contact number for top 1 oldest patient
UPDATE Patients SET Contact = '8888888888' 
WHERE Patient_ID = (SELECT Patient_ID FROM Patients ORDER BY Age DESC LIMIT 1);



-- Table-2 Doctors
create table Doctors(
Doctor_ID int primary key, 
Name varchar(50), 
Specialty varchar(50), 
Phone varchar(20), 
Email varchar(25)
);

-- insert records into table-2
insert into Doctors values
(1, 'Dr. Suresh Rao', 'Cardiology', '9811122233', 'suresh.rao@hospital.in'),
(2, 'Dr. Neha Kapoor', 'Dermatology', '9822233445', 'neha.kapoor@hospital.in'),
(3, 'Dr. Amit Shah', 'Orthopedics', '9833344556', 'amit.shah@hospital.in'),
(4, 'Dr. Farhan Siddiqui', 'Neurology', '9844455667', 'farhan@hospital.in'),
(5, 'Dr. Anjali Menon', 'Gynecology', '9855566778', 'anjali.menon@hospital.in'),
(6, 'Dr. Rajeev Pillai', 'Pediatrics', '9866677889', 'rajeev.pillai@hospital.in'),
(7, 'Dr. Kavita Jain', 'ENT', '9877788990', 'kavita.jain@hospital.in'),
(8, 'Dr. Vivek Sinha', 'General Medicine', '9888899001', 'vivek.sinha@hospital.in'),
(9, 'Dr. Priyanka Das', 'Psychiatry', '9899900112', 'priyanka.das@hospital.in'),
(10, 'Dr. Ashok Verma', 'Oncology', '9900011223', 'ashok.verma@hospital.in');

-- display the data of table-2
select * from Doctors;

-- ========== SELECT Queries ==========
-- 1. Select all doctors who specialize in 'Cardiology'
SELECT * FROM Doctors WHERE Specialty = 'Cardiology';

-- 2. Select count of doctors in each specialty
SELECT Specialty, COUNT(*) AS Total FROM Doctors GROUP BY Specialty;

-- 3. Select specialties having more than 1 doctor
SELECT Specialty, COUNT(*) AS Count FROM Doctors GROUP BY Specialty HAVING COUNT(*) > 1;

-- 4. Select all doctors ordered by name ascending
SELECT * FROM Doctors ORDER BY Name ASC;

-- 5. Select top 3 doctors by ascending Doctor_ID
SELECT * FROM Doctors ORDER BY Doctor_ID ASC LIMIT 3;

-- ========== ALTER Queries ==========
-- 6. Add a column for Experience in years
ALTER TABLE Doctors ADD Experience INT;

-- 7. Modify Email column to have longer length
ALTER TABLE Doctors MODIFY Email VARCHAR(50);

-- 8. Change Phone column name to Contact_Number
ALTER TABLE Doctors CHANGE Phone Contact_Number VARCHAR(20);

-- 9. Add a column for Hospital_Branch
ALTER TABLE Doctors ADD Hospital_Branch VARCHAR(50);

-- 10. Drop the column Hospital_Branch
ALTER TABLE Doctors DROP COLUMN Hospital_Branch;

-- ========== DELETE Queries ==========
-- 11. Delete doctor with ID = 10
DELETE FROM Doctors WHERE Doctor_ID = 10;

-- 12. Delete all doctors whose specialty is 'ENT'
DELETE FROM Doctors WHERE Specialty = 'ENT';

-- 13. Delete doctors whose name starts with 'Dr. A'
DELETE FROM Doctors WHERE Name LIKE 'Dr. A%';

-- 14. Delete doctors whose email contains 'psychiatry'
DELETE FROM Doctors WHERE Email LIKE '%psychiatry%';

-- 15. Delete doctors from specialty 'Orthopedics'
DELETE FROM Doctors WHERE Specialty = 'Orthopedics';

-- ========== RENAME Queries ==========
-- 16. Rename table to Doctor_Info
RENAME TABLE Doctors TO Doctor_Info;

-- 17. Rename table back to Doctors
RENAME TABLE Doctor_Info TO Doctors;

-- 18. Rename column Contact_Number back to Phone
ALTER TABLE Doctors CHANGE Contact_Number Phone VARCHAR(20);

-- 19. Rename column Name to Full_Name
ALTER TABLE Doctors CHANGE Name Full_Name VARCHAR(50);

-- 20. Rename column Specialty to Department
ALTER TABLE Doctors CHANGE Specialty Department VARCHAR(50);

-- ========== UPDATE Queries ==========
-- 21. Update phone number of doctor with ID = 5
UPDATE Doctors SET Phone = '9999999999' WHERE Doctor_ID = 5;

-- 22. Update specialty of 'Dr. Priyanka Das' to 'Therapy'
UPDATE Doctors SET Specialty = 'Therapy' WHERE Name = 'Dr. Priyanka Das';

-- 23. Update email of doctor with minimum Doctor_ID
UPDATE Doctors SET Email = 'updated@hospital.in' 
WHERE Doctor_ID = (SELECT Doctor_ID FROM (SELECT Doctor_ID FROM Doctors ORDER BY Doctor_ID ASC LIMIT 1) AS temp);

-- 24. Update specialty to 'General Medicine' for doctors with NULL Experience
UPDATE Doctors SET Specialty = 'General Medicine' WHERE Experience IS NULL;

-- 25. Update email of doctors in 'Neurology'
UPDATE Doctors SET Email = 'neurology@hospital.in' WHERE Specialty = 'Neurology';



-- Table-3
create table Appointments(
Appointment_ID int primary key, 
Patient_ID int, 
Doctor_ID int , 
Date date, 
Time time, 
Status varchar(20),
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- insert records into table-3
insert into Appointments values
(1, 1, 1, '2025-07-10', '10:30:00', 'Confirmed'),
(2, 2, 5, '2025-07-11', '11:30:00', 'Completed'),
(3, 3, 3, '2025-07-12', '14:00:00', 'Cancelled'),
(4, 4, 4, '2025-07-13', '09:00:00', 'Confirmed'),
(5, 5, 2, '2025-07-14', '13:00:00', 'Completed'),
(6, 6, 6, '2025-07-15', '15:00:00', 'Confirmed'),
(7, 7, 8, '2025-07-16', '12:00:00', 'Pending'),
(8, 8, 7, '2025-07-17', '16:30:00', 'Confirmed'),
(9, 9, 9, '2025-07-18', '10:45:00', 'Confirmed'),
(10, 10, 10, '2025-07-19', '11:15:00', 'Pending');

-- display the data of table-3
select * from Appointments;

drop table Appointments;

-- ========== SELECT Queries ==========
-- 1. Select all confirmed appointments
SELECT * FROM Appointments WHERE Status = 'Confirmed';

-- 2. Count of appointments by status
SELECT Status, COUNT(*) AS Total FROM Appointments GROUP BY Status;

-- 3. Show appointment statuses having more than 2 appointments
SELECT Status, COUNT(*) AS Count FROM Appointments GROUP BY Status HAVING COUNT(*) > 2;

-- 4. Select all appointments ordered by date
SELECT * FROM Appointments ORDER BY Date ASC;

-- 5. Select top 3 most recent appointments
SELECT * FROM Appointments ORDER BY Date DESC LIMIT 3;

-- ========== ALTER Queries ==========
-- 6. Add a column for Appointment_Type
ALTER TABLE Appointments ADD Appointment_Type VARCHAR(30);

-- 7. Modify Status column to have larger length
ALTER TABLE Appointments MODIFY Status VARCHAR(30);

-- 8. Change column Time to Appointment_Time
ALTER TABLE Appointments CHANGE Time Appointment_Time TIMESTAMP;

-- 9. Add a column for Fee_Collected
ALTER TABLE Appointments ADD Fee_Collected DECIMAL(8,2);

-- 10. Drop the column Appointment_Type
ALTER TABLE Appointments DROP COLUMN Appointment_Type;

-- ========== DELETE Queries ==========
-- 11. Delete appointment with ID = 10
DELETE FROM Appointments WHERE Appointment_ID = 10;

-- 12. Delete all cancelled appointments
DELETE FROM Appointments WHERE Status = 'Cancelled';

-- 13. Delete appointments before '2025-07-13'
DELETE FROM Appointments WHERE Date < '2025-07-13';

-- 14. Delete appointments of patient ID 2
DELETE FROM Appointments WHERE Patient_ID = 2;

-- 15. Delete all appointments with status 'Pending'
DELETE FROM Appointments WHERE Status = 'Pending';

-- ========== RENAME Queries ==========
-- 16. Rename table to Appointment_Records
RENAME TABLE Appointments TO Appointment_Records;

-- 17. Rename table back to Appointments
RENAME TABLE Appointment_Records TO Appointments;

-- 18. Rename column Appointment_Time back to Time
ALTER TABLE Appointments CHANGE Appointment_Time Time TIMESTAMP;

-- 19. Rename column Status to Appointment_Status
ALTER TABLE Appointments CHANGE Status Appointment_Status VARCHAR(30);

-- 20. Rename column Date to Appointment_Date
ALTER TABLE Appointments CHANGE Date Appointment_Date DATE;

-- ========== UPDATE Queries ==========
-- 21. Update status of appointment with ID = 1 to 'Completed'
UPDATE Appointments SET Status = 'Completed' WHERE Appointment_ID = 1;

-- 22. Update time for appointment on '2025-07-14'
UPDATE Appointments SET Time = '14:00:00' WHERE Date = '2025-07-14';

-- 23. Update status to 'Follow-up' for doctor ID 6
UPDATE Appointments SET Status = 'Follow-up' WHERE Doctor_ID = 6;

-- 24. Update time for latest appointment
UPDATE Appointments SET Time = '17:00:00' 
WHERE Appointment_ID = (SELECT Appointment_ID FROM (SELECT Appointment_ID FROM Appointments ORDER BY Date DESC LIMIT 1) AS temp);

-- 25. Update status to 'Rescheduled' for appointments after '2025-07-17'
UPDATE Appointments SET Status = 'Rescheduled' WHERE Date > '2025-07-17';


-- Table-4 Medical_History
create table Medical_History(
History_ID int  primary key, 
Patient_ID int, 
Diagnosis varchar(50), 
Treatment varchar(20) , 
Notes varchar(50),
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- insert records into table-4
insert into Medical_History values
(1, 1, 'Hypertension', 'Medication', 'Monitoring BP regularly'),
(2, 2, 'PCOD', 'Hormonal Therapy', 'Monthly follow-up'),
(3, 3, 'Fracture - Leg', 'Surgery + Cast', 'Physical therapy advised'),
(4, 4, 'Migraine', 'Pain Management', 'Stress reduction suggested'),
(5, 5, 'Diabetes Type 2', 'Insulin + Diet', 'Routine sugar check'),
(6, 6, 'Asthma', 'Inhaler', 'Avoid allergens'),
(7, 7, 'Chronic Kidney Disease', 'Dialysis', 'Regular creatinine check-up and fluid restriction'),
(8, 8, 'Sinusitis', 'Antibiotics', 'Steam inhalation'),
(9, 9, 'Depression', 'Therapy + Medication', 'Regular counseling'),
(10, 10, 'Breast Cancer', 'Chemotherapy', '6th cycle ongoing');


-- display the data of table-4
select * from Medical_History;

-- =======================
--       SELECT Queries
-- =======================

-- 1. Select all rows where diagnosis is 'Asthma'
SELECT * FROM Medical_History WHERE Diagnosis = 'Asthma';

-- 2. Count of patients per treatment type
SELECT Treatment, COUNT(*) AS Total FROM Medical_History GROUP BY Treatment;

-- 3. Show treatments having more than 1 patient
SELECT Treatment, COUNT(*) FROM Medical_History GROUP BY Treatment HAVING COUNT(*) > 1;

-- 4. Select all rows ordered by Patient_ID descending
SELECT * FROM Medical_History ORDER BY Patient_ID DESC;

-- 5. Show top 3 medical history records by History_ID
SELECT * FROM Medical_History ORDER BY History_ID ASC LIMIT 3;

-- =======================
--       ALTER Queries
-- =======================

-- 6. Add column for Date_Of_Diagnosis
ALTER TABLE Medical_History ADD Date_Of_Diagnosis DATE;

-- 7. Modify Notes column to increase its length
ALTER TABLE Medical_History MODIFY Notes VARCHAR(100);

-- 8. Change column name Diagnosis to Diagnosis_Details
ALTER TABLE Medical_History CHANGE Diagnosis Diagnosis_Details VARCHAR(50);

-- 9. Add column for Is_Chronic condition
ALTER TABLE Medical_History ADD Is_Chronic BOOLEAN;

-- 10. Drop column Is_Chronic
ALTER TABLE Medical_History DROP COLUMN Is_Chronic;

-- =======================
--       DELETE Queries
-- =======================

-- 11. Delete record with History_ID = 4
DELETE FROM Medical_History WHERE History_ID = 4;

-- 12. Delete all records with treatment = 'Dialysis'
DELETE FROM Medical_History WHERE Treatment = 'Dialysis';

-- 13. Delete all records where Patient_ID > 8
DELETE FROM Medical_History WHERE Patient_ID > 8;

-- 14. Delete records where notes mention 'therapy'
DELETE FROM Medical_History WHERE Notes LIKE '%therapy%';

-- 15. Delete all rows where diagnosis is 'Sinusitis'
DELETE FROM Medical_History WHERE Diagnosis = 'Sinusitis';

-- =======================
--       RENAME Queries
-- =======================

-- 16. Rename table to Patient_Medical_History
RENAME TABLE Medical_History TO Patient_Medical_History;

-- 17. Rename table back to Medical_History
RENAME TABLE Patient_Medical_History TO Medical_History;

-- 18. Rename column Treatment to Treatment_Type
ALTER TABLE Medical_History CHANGE Treatment Treatment_Type VARCHAR(20);

-- 19. Rename column Notes to Additional_Notes
ALTER TABLE Medical_History CHANGE Notes Additional_Notes VARCHAR(100);

-- 20. Rename column Diagnosis_Details back to Diagnosis
ALTER TABLE Medical_History CHANGE Diagnosis_Details Diagnosis VARCHAR(50);

-- =======================
--       UPDATE Queries
-- =======================

-- 21. Update notes for patient with History_ID = 3
UPDATE Medical_History SET Notes = 'Scheduled for next therapy session' WHERE History_ID = 3;

-- 22. Update treatment for all patients with diagnosis = 'Diabetes Type 2'
UPDATE Medical_History SET Treatment = 'Diet Control' WHERE Diagnosis = 'Diabetes Type 2';

-- 23. Update diagnosis to 'High BP' for patient ID = 1
UPDATE Medical_History SET Diagnosis = 'High BP' WHERE Patient_ID = 1;

-- 24. Update notes where treatment is 'Inhaler'
UPDATE Medical_History SET Notes = 'Carry inhaler always' WHERE Treatment = 'Inhaler';

-- 25. Update treatment to 'Chemo - Final Stage' for History_ID = 10
UPDATE Medical_History SET Treatment = 'Chemo - Final Stage' WHERE History_ID = 10;



-- Table-5 Medications
create table Medications(
Medication_ID int primary key, 
Name varchar(50), 
Type varchar(50), 
Price float, 
Description varchar(100)
);

-- insert records into table-5
insert into Medications values 
(1, 'Paracetamol', 'Tablet', 12.00, 'Used for fever and mild pain'),
(2, 'Metformin', 'Tablet', 30.00, 'Used to treat Type 2 Diabetes'),
(3, 'Amlodipine', 'Tablet', 25.00, 'For high blood pressure'),
(4, 'Salbutamol', 'Inhaler', 150.00, 'Bronchodilator for asthma'),
(5, 'Cefixime', 'Tablet', 55.00, 'Antibiotic'),
(6, 'Ibuprofen', 'Tablet', 10.00, 'Pain relief'),
(7, 'Levothyroxine', 'Tablet', 18.00, 'Thyroid hormone'),
(8, 'Cetirizine', 'Tablet', 8.00, 'Anti-allergic'),
(9, 'Fluoxetine', 'Capsule', 45.00, 'Used in depression treatment'),
(10, 'Ondansetron', 'Tablet', 22.00, 'Used for nausea/vomiting');

-- display the data of table-5
select * from Medications;

-- =======================
--       SELECT Queries
-- =======================

-- 1. Select all medications of type 'Tablet'
SELECT * FROM Medications WHERE Type = 'Tablet';

-- 2. Count medications by type
SELECT Type, COUNT(*) AS Total FROM Medications GROUP BY Type;

-- 3. Show medication types having more than 1 medicine
SELECT Type, COUNT(*) FROM Medications GROUP BY Type HAVING COUNT(*) > 1;

-- 4. Select top 5 cheapest medications
SELECT * FROM Medications ORDER BY Price ASC LIMIT 5;

-- 5. List all medications ordered by Name descending
SELECT * FROM Medications ORDER BY Name DESC;

-- =======================
--       ALTER Queries
-- =======================

-- 6. Add column for Manufacturer
ALTER TABLE Medications ADD Manufacturer VARCHAR(50);

-- 7. Modify Price column to hold more precision
ALTER TABLE Medications MODIFY Price DECIMAL(10,2);

-- 8. Change Description column to Notes
ALTER TABLE Medications CHANGE Description Notes VARCHAR(100);

-- 9. Add column for Expiry_Date
ALTER TABLE Medications ADD Expiry_Date DATE;

-- 10. Drop column Manufacturer
ALTER TABLE Medications DROP COLUMN Manufacturer;

-- =======================
--       DELETE Queries
-- =======================

-- 11. Delete medication with ID 6
DELETE FROM Medications WHERE Medication_ID = 6;

-- 12. Delete all medications priced over 100
DELETE FROM Medications WHERE Price > 100;

-- 13. Delete medications of type 'Capsule'
DELETE FROM Medications WHERE Type = 'Capsule';

-- 14. Delete medication with name 'Cefixime'
DELETE FROM Medications WHERE Name = 'Cefixime';

-- 15. Delete all medications where price is below 10
DELETE FROM Medications WHERE Price < 10;

-- =======================
--       RENAME Queries
-- =======================

-- 16. Rename table to Drug_List
RENAME TABLE Medications TO Drug_List;

-- 17. Rename table back to Medications
RENAME TABLE Drug_List TO Medications;

-- 18. Rename column Type to Form
ALTER TABLE Medications CHANGE Type Form VARCHAR(50);

-- 19. Rename column Notes back to Description
ALTER TABLE Medications CHANGE Notes Description VARCHAR(100);

-- 20. Rename column Price to Cost
ALTER TABLE Medications CHANGE Price Cost FLOAT;

-- =======================
--       UPDATE Queries
-- =======================

-- 21. Update price of Paracetamol to 15
UPDATE Medications SET Price = 15.00 WHERE Name = 'Paracetamol';

-- 22. Update type to 'Syrup' where Medication_ID = 2
UPDATE Medications SET Type = 'Syrup' WHERE Medication_ID = 2;

-- 23. Update description for Amlodipine
UPDATE Medications SET Description = 'Used to treat hypertension' WHERE Name = 'Amlodipine';

-- 24. Increase price by 5 for all medications priced below 20
UPDATE Medications SET Price = Price + 5 WHERE Price < 20;

-- 25. Update type to 'Tablet' where currently 'Form' is 'Capsule'
UPDATE Medications SET Type = 'Tablet' WHERE Type = 'Capsule';



-- Table-6
create table Prescriptions(
Prescription_ID int primary key, 
Patient_ID int,
 Medication_ID int, 
 Date_Provided date, 
 Dosage varchar(100),
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (Medication_ID) REFERENCES Medications(Medication_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- insert records into table-6
insert into Prescriptions values
(1, 1, 3, '2025-07-10', '5mg once daily'),
(2, 2, 2, '2025-07-11', '500mg twice daily'),
(3, 3, 6, '2025-07-12', '200mg every 8 hours'),
(4, 4, 5, '2025-07-13', '200mg twice daily'),
(5, 5, 1, '2025-07-14', '500mg thrice daily'),
(6, 6, 4, '2025-07-15', '2 puffs twice daily'),
(7, 7, 7, '2025-07-16', '50mcg every morning'),
(8, 8, 8, '2025-07-17', '10mg once daily'),
(9, 9, 9, '2025-07-18', '20mg once daily'),
(10, 10, 10, '2025-07-19', '4mg twice daily');

-- display the data of table-6
select * from Prescriptions;

-- =======================
--       SELECT Queries
-- =======================

-- 1. Select all prescriptions for Patient_ID = 1
SELECT * FROM Prescriptions WHERE Patient_ID = 1;

-- 2. Count how many prescriptions each patient has
SELECT Patient_ID, COUNT(*) AS Total_Prescriptions FROM Prescriptions GROUP BY Patient_ID;

-- 3. Show patients who have more than 1 prescription
SELECT Patient_ID, COUNT(*) FROM Prescriptions GROUP BY Patient_ID HAVING COUNT(*) > 1;

-- 4. List 5 most recent prescriptions
SELECT * FROM Prescriptions ORDER BY Date_Provided DESC LIMIT 5;

-- 5. Display prescriptions ordered by Medication_ID
SELECT * FROM Prescriptions ORDER BY Medication_ID;

-- =======================
--       ALTER Queries
-- =======================

-- 6. Add column for prescribing doctor's name
ALTER TABLE Prescriptions ADD Doctor_Name VARCHAR(50);

-- 7. Modify Dosage column size
ALTER TABLE Prescriptions MODIFY Dosage VARCHAR(150);

-- 8. Add column for Notes
ALTER TABLE Prescriptions ADD Notes VARCHAR(100);

-- 9. Drop the Notes column
ALTER TABLE Prescriptions DROP COLUMN Notes;

-- 10. Add column for Follow_Up_Date
ALTER TABLE Prescriptions ADD Follow_Up_Date DATE;

-- =======================
--       DELETE Queries
-- =======================

-- 11. Delete prescription with ID 3
DELETE FROM Prescriptions WHERE Prescription_ID = 3;

-- 12. Delete prescriptions provided before '2025-07-12'
DELETE FROM Prescriptions WHERE Date_Provided < '2025-07-12';

-- 13. Delete prescriptions with Medication_ID = 9
DELETE FROM Prescriptions WHERE Medication_ID = 9;

-- 14. Delete all prescriptions for Patient_ID = 5
DELETE FROM Prescriptions WHERE Patient_ID = 5;

-- 15. Delete all prescriptions where dosage includes '2 puffs'
DELETE FROM Prescriptions WHERE Dosage LIKE '%2 puffs%';

-- =======================
--       RENAME Queries
-- =======================

-- 16. Rename table to Patient_Prescriptions
RENAME TABLE Prescriptions TO Patient_Prescriptions;

-- 17. Rename table back to Prescriptions
RENAME TABLE Patient_Prescriptions TO Prescriptions;

-- 18. Rename column Dosage to Dosage_Info
ALTER TABLE Prescriptions CHANGE Dosage Dosage_Info VARCHAR(100);

-- 19. Rename column Follow_Up_Date to Next_Visit
ALTER TABLE Prescriptions CHANGE Follow_Up_Date Next_Visit DATE;

-- 20. Rename column Date_Provided to Issued_On
ALTER TABLE Prescriptions CHANGE Date_Provided Issued_On DATE;

-- =======================
--       UPDATE Queries
-- =======================

-- 21. Update dosage for Prescription_ID = 1
UPDATE Prescriptions SET Dosage = '10mg once daily' WHERE Prescription_ID = 1;

-- 22. Change Dosage for all prescriptions with Medication_ID = 2
UPDATE Prescriptions SET Dosage = '750mg twice daily' WHERE Medication_ID = 2;

-- 23. Update Date_Provided for Prescription_ID = 6
UPDATE Prescriptions SET Date_Provided = '2025-07-20' WHERE Prescription_ID = 6;

-- 24. Change Dosage to '100mg at night' where Patient_ID = 8
UPDATE Prescriptions SET Dosage = '100mg at night' WHERE Patient_ID = 8;

-- 25. Update Dosage for all prescriptions dated '2025-07-17'
UPDATE Prescriptions SET Dosage = 'Adjusted dose – once daily' WHERE Date_Provided = '2025-07-17';



-- Table-7
create table Bills(
Bill_ID int primary key, 
Patient_ID int, 
Total_Amount float, 
Payment_Status varchar(20), 
Date date,
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE
);


-- insert records into Table-7
insert into Bills Values
(1, 1, 1200.00, 'Paid', '2025-07-10'),
(2, 2, 4500.00, 'Unpaid', '2025-07-11'),
(3, 3, 7800.00, 'Paid', '2025-07-12'),
(4, 4, 1300.00, 'Paid', '2025-07-13'),
(5, 5, 2100.00, 'Paid', '2025-07-14'),
(6, 6, 2500.00, 'Unpaid', '2025-07-15'),
(7, 7, 600.00, 'Paid', '2025-07-16'),
(8, 8, 900.00, 'Paid', '2025-07-17'),
(9, 9, 1100.00, 'Unpaid', '2025-07-18'),
(10, 10, 15000.00, 'Paid', '2025-07-19');

-- display the data of table-7
select * from Bills;

-- =======================
--       SELECT Queries
-- =======================

-- 1. Select all bills where the payment is unpaid
SELECT * FROM Bills WHERE Payment_Status = 'Unpaid';

-- 2. Get total amount billed for each payment status
SELECT Payment_Status, SUM(Total_Amount) AS Total FROM Bills GROUP BY Payment_Status;

-- 3. Show patients who have been billed more than ₹5000
SELECT Patient_ID, Total_Amount FROM Bills WHERE Total_Amount > 5000;

-- 4. Get count of bills per payment status where count > 1
SELECT Payment_Status, COUNT(*) FROM Bills GROUP BY Payment_Status HAVING COUNT(*) > 1;

-- 5. Display the top 3 highest billing records
SELECT * FROM Bills ORDER BY Total_Amount DESC LIMIT 3;

-- =======================
--       ALTER Queries
-- =======================

-- 6. Add column for payment mode
ALTER TABLE Bills ADD Payment_Mode VARCHAR(20);

-- 7. Add column for remarks
ALTER TABLE Bills ADD Remarks VARCHAR(100);

-- 8. Modify Total_Amount to have 2 decimal places
ALTER TABLE Bills MODIFY Total_Amount FLOAT(10,2);

-- 9. Drop Remarks column
ALTER TABLE Bills DROP COLUMN Remarks;

-- 10. Add column for tax
ALTER TABLE Bills ADD Tax FLOAT;

-- =======================
--       DELETE Queries
-- =======================

-- 11. Delete bill where Bill_ID = 9
DELETE FROM Bills WHERE Bill_ID = 9;

-- 12. Delete all bills where amount is less than 1000
DELETE FROM Bills WHERE Total_Amount < 1000;

-- 13. Delete all unpaid bills
DELETE FROM Bills WHERE Payment_Status = 'Unpaid';

-- 14. Delete bills for Patient_ID = 6
DELETE FROM Bills WHERE Patient_ID = 6;

-- 15. Delete bills issued on '2025-07-13'
DELETE FROM Bills WHERE Date = '2025-07-13';

-- =======================
--       RENAME Queries
-- =======================

-- 16. Rename table to Patient_Bills
RENAME TABLE Bills TO Patient_Bills;

-- 17. Rename table back to Bills
RENAME TABLE Patient_Bills TO Bills;

-- 18. Rename column Total_Amount to Bill_Amount
ALTER TABLE Bills CHANGE Total_Amount Bill_Amount FLOAT;

-- 19. Rename column Payment_Status to Status
ALTER TABLE Bills CHANGE Payment_Status Status VARCHAR(20);

-- 20. Rename column Date to Billing_Date
ALTER TABLE Bills CHANGE Date Billing_Date DATE;

-- =======================
--       UPDATE Queries
-- =======================

-- 21. Update Payment_Status of Bill_ID = 2 to 'Paid'
UPDATE Bills SET Payment_Status = 'Paid' WHERE Bill_ID = 2;

-- 22. Update Bill_Amount for Patient_ID = 5
UPDATE Bills SET Total_Amount = 2500.00 WHERE Patient_ID = 5;

-- 23. Set Tax = 5% of Bill_Amount
UPDATE Bills SET Tax = Total_Amount * 0.05;

-- 24. Change Payment_Status to 'Unpaid' for all bills > ₹10,000
UPDATE Bills SET Payment_Status = 'Unpaid' WHERE Total_Amount > 10000;

-- 25. Update billing date for Bill_ID = 4
UPDATE Bills SET Date = '2025-07-20' WHERE Bill_ID = 4;



-- Table-8
create table Staff(
Staff_ID int primary key, 
Name varchar(50), 
Role varchar(50), 
Contact varchar(20), 
Shift varchar(20)
);

-- insert records into table-8
insert into Staff values
(1, 'Sunil Rawat', 'Receptionist', '9812345678', 'Morning'),
(2, 'Lata Kumari', 'Nurse', '9823456789', 'Night'),
(3, 'Manoj Tiwari', 'Pharmacist', '9834567890', 'Morning'),
(4, 'Rita Fernandes', 'Accountant', '9845678901', 'Evening'),
(5, 'Ramesh Kumar', 'Cleaner', '9856789012', 'Night'),
(6, 'Deepa Joshi', 'Nurse', '9867890123', 'Evening'),
(7, 'Ajay Singh', 'Security', '9878901234', 'Night'),
(8, 'Sneha Jain', 'Lab Technician', '9889012345', 'Morning'),
(9, 'Farid Khan', 'Receptionist', '9890123456', 'Evening'),
(10, 'Geeta Verma', 'Admin Assistant', '9901234567', 'Morning');

-- display the data of table-8
select * from Staff;

-- =======================
--       SELECT Queries
-- =======================

-- 1. Get all staff working the 'Night' shift
SELECT * FROM Staff WHERE Shift = 'Night';

-- 2. Count number of staff per shift
SELECT Shift, COUNT(*) AS Staff_Count FROM Staff GROUP BY Shift;

-- 3. Get names of staff who are Nurses
SELECT Name FROM Staff WHERE Role = 'Nurse';

-- 4. List shifts with more than 2 staff
SELECT Shift, COUNT(*) FROM Staff GROUP BY Shift HAVING COUNT(*) > 2;

-- 5. Display top 3 staff records based on Staff_ID
SELECT * FROM Staff ORDER BY Staff_ID ASC LIMIT 3;

-- =======================
--       ALTER Queries
-- =======================

-- 6. Add column for staff email
ALTER TABLE Staff ADD Email VARCHAR(50);

-- 7. Add column for date of joining
ALTER TABLE Staff ADD Joining_Date DATE;

-- 8. Modify Contact to increase length
ALTER TABLE Staff MODIFY Contact VARCHAR(25);

-- 9. Drop Joining_Date column
ALTER TABLE Staff DROP COLUMN Joining_Date;

-- 10. Add column for salary
ALTER TABLE Staff ADD Salary FLOAT;

-- =======================
--       DELETE Queries
-- =======================

-- 11. Delete staff with Role = 'Cleaner'
DELETE FROM Staff WHERE Role = 'Cleaner';

-- 12. Delete all staff in 'Evening' shift
DELETE FROM Staff WHERE Shift = 'Evening';

-- 13. Delete staff with Staff_ID = 9
DELETE FROM Staff WHERE Staff_ID = 9;

-- 14. Delete staff with contact starting with '9812'
DELETE FROM Staff WHERE Contact LIKE '9812%';

-- 15. Delete all 'Receptionist' staff in 'Morning' shift
DELETE FROM Staff WHERE Role = 'Receptionist' AND Shift = 'Morning';

-- =======================
--       RENAME Queries
-- =======================

-- 16. Rename table to Hospital_Staff
RENAME TABLE Staff TO Hospital_Staff;

-- 17. Rename table back to Staff
RENAME TABLE Hospital_Staff TO Staff;

-- 18. Rename column Name to Full_Name
ALTER TABLE Staff CHANGE Name Full_Name VARCHAR(50);

-- 19. Rename column Contact to Phone
ALTER TABLE Staff CHANGE Contact Phone VARCHAR(20);

-- 20. Rename column Role to Designation
ALTER TABLE Staff CHANGE Role Designation VARCHAR(50);

-- =======================
--       UPDATE Queries
-- =======================

-- 21. Update shift of 'Deepa Joshi' to 'Night'
UPDATE Staff SET Shift = 'Night' WHERE Name = 'Deepa Joshi';

-- 22. Update Role of 'Ajay Singh' to 'Head of Security'
UPDATE Staff SET Role = 'Head of Security' WHERE Name = 'Ajay Singh';

-- 23. Set salary to 25000 for all Nurses
UPDATE Staff SET Salary = 25000 WHERE Role = 'Nurse';

-- 24. Update Shift to 'Morning' for all Receptionists
UPDATE Staff SET Shift = 'Morning' WHERE Role = 'Receptionist';

-- 25. Update contact number for Staff_ID = 3
UPDATE Staff SET Contact = '9999999999' WHERE Staff_ID = 3;



-- Table-9
create table Departments(
Department_ID int primary key, 
Name varchar(50) not null, 
Location varchar(50) not null, 
Phone varchar(20),
email varchar(30)
);

-- insert records into table-9
insert into Departments values
(1, 'Cardiology', 'Block A', '0221234567', 'cardiology@hospital.com'),
(2, 'Neurology', 'Block B', '0222345678', 'neurology@hospital.com'),
(3, 'Orthopedics', 'Block C', '0223456789', 'orthopedics@hospital.com'),
(4, 'Pediatrics', 'Block D', '0224567890', 'pediatrics@hospital.com'),
(5, 'Oncology', 'Block E', '0225678901', 'oncology@hospital.com'),
(6, 'ENT', 'Block F', '0226789012', 'ent@hospital.com'),
(7, 'Gynecology', 'Block G', '0227890123', 'gynecology@hospital.com'),
(8, 'General Medicine', 'Block H', '0228901234', 'genmed@hospital.com'),
(9, 'Psychiatry', 'Block I', '0229012345', 'psychiatry@hospital.com'),
(10, 'Dermatology', 'Block J', '0220123456', 'dermatology@hospital.com');

 
-- display the data of table-9
select * from Departments;

-- =======================
--       SELECT Queries
-- =======================

-- 1. Show all departments located in 'Block A'
SELECT * FROM Departments WHERE Location = 'Block A';

-- 2. Count how many departments are there per location
SELECT Location, COUNT(*) AS Dept_Count FROM Departments GROUP BY Location;

-- 3. Display department names and phone numbers where phone starts with '0227'
SELECT Name, Phone FROM Departments WHERE Phone LIKE '0227%';

-- 4. Show blocks having more than 1 department
SELECT Location, COUNT(*) FROM Departments GROUP BY Location HAVING COUNT(*) > 1;

-- 5. List all departments sorted by name
SELECT * FROM Departments ORDER BY Name ASC;

-- =======================
--       ALTER Queries
-- =======================

-- 6. Add column Head_Of_Department
ALTER TABLE Departments ADD Head_Of_Department VARCHAR(50);

-- 7. Add column Established_Year
ALTER TABLE Departments ADD Established_Year INT;

-- 8. Modify Phone column to increase size
ALTER TABLE Departments MODIFY Phone VARCHAR(25);

-- 9. Drop column Established_Year
ALTER TABLE Departments DROP COLUMN Established_Year;

-- 10. Add column Floor_Number
ALTER TABLE Departments ADD Floor_Number INT;

-- =======================
--       DELETE Queries
-- =======================

-- 11. Delete department with Department_ID = 10
DELETE FROM Departments WHERE Department_ID = 10;

-- 12. Delete departments in 'Block I'
DELETE FROM Departments WHERE Location = 'Block I';

-- 13. Delete departments where phone ends with '4567'
DELETE FROM Departments WHERE Phone LIKE '%4567';

-- 14. Delete all departments where name starts with 'P'
DELETE FROM Departments WHERE Name LIKE 'P%';

-- 15. Delete departments with email containing 'ortho'
DELETE FROM Departments WHERE Email LIKE '%ortho%';

-- =======================
--       RENAME Queries
-- =======================

-- 16. Rename table to Hospital_Departments
RENAME TABLE Departments TO Hospital_Departments;

-- 17. Rename back to original name
RENAME TABLE Hospital_Departments TO Departments;

-- 18. Rename column Name to Dept_Name
ALTER TABLE Departments CHANGE Name Dept_Name VARCHAR(50);

-- 19. Rename column Phone to Contact_Number
ALTER TABLE Departments CHANGE Phone Contact_Number VARCHAR(25);

-- 20. Rename column email to Email_Address
ALTER TABLE Departments CHANGE email Email_Address VARCHAR(30);

-- =======================
--       UPDATE Queries
-- =======================

-- 21. Update phone for Dermatology department
UPDATE Departments SET Phone = '0229999999' WHERE Name = 'Dermatology';

-- 22. Change location of ENT to 'Block Z'
UPDATE Departments SET Location = 'Block Z' WHERE Name = 'ENT';

-- 23. Update email of Psychiatry department
UPDATE Departments SET Email = 'mentalhealth@hospital.com' WHERE Name = 'Psychiatry';

-- 24. Set Floor_Number = 2 for all departments in Block B
UPDATE Departments SET Floor_Number = 2 WHERE Location = 'Block B';

-- 25. Set Head_Of_Department = 'Dr. Ramesh' for Cardiology
UPDATE Departments SET Head_Of_Department = 'Dr. Ramesh' WHERE Name = 'Cardiology';



-- Table-10
create table Facilities(
Facility_ID int primary key, 
Name varchar(50), 
Type varchar(50), 
Cost decimal(10,2), 
Availability_Status varchar(100)
);

-- insert records into table-10
insert into Facilities values
(1, 'ICU Bed', 'Critical Care', 3000.00, 'Available'),
(2, 'Private Room', 'Accommodation', 2500.00, 'Occupied'),
(3, 'MRI Scan', 'Diagnostic', 5000.00, 'Available'),
(4, 'X-Ray', 'Diagnostic', 800.00, 'Available'),
(5, 'Ambulance', 'Transport', 1500.00, 'Available'),
(6, 'Ventilator', 'Life Support', 2000.00, 'Occupied'),
(7, 'Operation Theatre', 'Surgical', 10000.00, 'Available'),
(8, 'Pathology Lab', 'Diagnostic', 1200.00, 'Available'),
(9, 'Pharmacy', 'Support', 0.00, 'Available'),
(10, 'Wheelchair', 'Mobility', 100.00, 'Available');

-- display the data of table-10
select * from Facilities;

-- =======================
--       SELECT Queries
-- =======================

-- 1. Show all facilities that are available
SELECT * FROM Facilities WHERE Availability_Status = 'Available';

-- 2. List names and cost of all 'Diagnostic' facilities
SELECT Name, Cost FROM Facilities WHERE Type = 'Diagnostic';

-- 3. Display all facilities ordered by cost in descending order
SELECT * FROM Facilities ORDER BY Cost DESC;

-- 4. Count number of facilities in each type
SELECT Type, COUNT(*) AS Facility_Count FROM Facilities GROUP BY Type;

-- 5. Show all types with more than 1 facility
SELECT Type, COUNT(*) FROM Facilities GROUP BY Type HAVING COUNT(*) > 1;

-- =======================
--       ALTER Queries
-- =======================

-- 6. Add a column 'Location'
ALTER TABLE Facilities ADD Location VARCHAR(50);

-- 7. Add a column 'Added_On' with DATE type
ALTER TABLE Facilities ADD Added_On DATE;

-- 8. Modify the 'Cost' column to have more precision
ALTER TABLE Facilities MODIFY Cost DECIMAL(12,2);

-- 9. Drop the column 'Added_On'
ALTER TABLE Facilities DROP COLUMN Added_On;

-- 10. Add a column 'In_Charge' to store the person responsible
ALTER TABLE Facilities ADD In_Charge VARCHAR(50);

-- =======================
--       DELETE Queries
-- =======================

-- 11. Delete facility with ID 9 (Pharmacy)
DELETE FROM Facilities WHERE Facility_ID = 9;

-- 12. Delete all facilities that are 'Occupied'
DELETE FROM Facilities WHERE Availability_Status = 'Occupied';

-- 13. Delete facilities with cost less than 500
DELETE FROM Facilities WHERE Cost < 500;

-- 14. Delete all 'Mobility' type facilities
DELETE FROM Facilities WHERE Type = 'Mobility';

-- 15. Delete all facilities whose name contains 'Lab'
DELETE FROM Facilities WHERE Name LIKE '%Lab%';

-- =======================
--       RENAME Queries
-- =======================

-- 16. Rename the table to Hospital_Facilities
RENAME TABLE Facilities TO Hospital_Facilities;

-- 17. Rename the table back to Facilities
RENAME TABLE Hospital_Facilities TO Facilities;

-- 18. Rename column 'Name' to 'Facility_Name'
ALTER TABLE Facilities CHANGE Name Facility_Name VARCHAR(50);

-- 19. Rename column 'Type' to 'Facility_Type'
ALTER TABLE Facilities CHANGE Type Facility_Type VARCHAR(50);

-- 20. Rename column 'Cost' to 'Facility_Cost'
ALTER TABLE Facilities CHANGE Cost Facility_Cost DECIMAL(12,2);

-- =======================
--       UPDATE Queries
-- =======================

-- 21. Update cost of 'MRI Scan' to 5500
UPDATE Facilities SET Cost = 5500 WHERE Name = 'MRI Scan';

-- 22. Set In_Charge to 'Dr. Sinha' for ICU Bed
UPDATE Facilities SET In_Charge = 'Dr. Sinha' WHERE Name = 'ICU Bed';

-- 23. Update availability of 'Private Room' to 'Available'
UPDATE Facilities SET Availability_Status = 'Available' WHERE Name = 'Private Room';

-- 24. Set Location = 'Block A' for all Diagnostic facilities
UPDATE Facilities SET Location = 'Block A' WHERE Type = 'Diagnostic';

-- 25. Set Location = 'Ground Floor' for Ambulance
UPDATE Facilities SET Location = 'Ground Floor' WHERE Name = 'Ambulance';


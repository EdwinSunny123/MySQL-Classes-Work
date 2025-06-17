
-- PART A 

-- --------------------------------------------------------Database Analysis-----------------------------------------------
/*
1. AIRLINE DATABASE:

Table 1: Flights(Fight_id,flight_number,departure_airport,arrival_airport,status)
Table-2: Passengers(Paseenger_id,full_name,phone_no,gender,nationality)
Table-3: Bookings(booking_Id,passenger_name,ticket_price,payment_method,booking_date)
Table-4: Aircrafts( aircraft_id,model,capacity,manufacturer,maintenance_status)
Table-5: Crew(crew_id,full_name,phone_No,role,assigned_flight_id)

2. BANKING DATABASE:

Table-1: Customers(customer_id, full_name, phone_number, email, address)
Table-2: Accounts(account_id, customer_name, account_type, balance, status)
Table-3: Transactions(transaction_id, sender_name, receiver_name, amount, transaction_date)
Table-4: Loans(loan_id, customer_name, loan_type, loan_amount, loan_status)
Table-5: Cards(card_id, customer_name, card_type, card_number, expiry_date)

3. BIRTHDAY PARTY:

Table-1: Guests(guest_id, full_name, age, phone_no, relation)
Table-2: Venue(venue_id, name, location, capacity, booking_status)
Table-3: Menu(item_id, item_name, type, quantity, special_note)
Table-4: Activities(activity_id, name, time_slot, host_name, material_required)
Table-5: Gifts(gift_id, guest_name, gift_item, wrapping_color, received_status)

4.BUS DEPOT:

Table-1: Buses(bus_id, bus_number, bus_type, capacity, status)
Table-2: Routes(route_id, source, destination, total_distance_km, duration_minutes)
Table-3: Passengers(passenger_id, full_name, age, phone_number, gender)
Table-4: Bookings(booking_id, passenger_name, bus_number, journey_date, seat_number)
Table-5: Drivers(driver_id, driver_name, license_number, phone_number, experience_years)

5.Cabs SERVICES:

Table-1: Customers(customer_id, full_name, phone_no, email, city)
Table-2: Drivers(driver_id, full_name, phone_no, license_no, availability_status)
Table-3: Cabs(cab_id, cab_number, cab_type, seating_capacity, cab_status)
Table-4: Rides(ride_id, customer_name, driver_name, pickup_location, drop_location)
Table-5: Payments(payment_id, ride_id_info, amount, payment_method, payment_status)

6. Car Rental

Table-1: Customers(customer_id, full_name, phone_no, license_number, city)
Table-2: Cars(car_id, car_number, model, car_type, availability_status)
Table-3: Rentals(rental_id, customer_name, car_number, rental_date, return_date)
Table-4: Payments(payment_id, rental_id_info, amount, payment_method, payment_status)
Table-5: Maintenance(maintenance_id, car_number, issue_reported, maintenance_date, status)

7. College

Table-1: Students(student_id, full_name, gender, phone_no, department)
Table-2: Courses(course_id, course_name, credits, department, semester)
Table-3: Faculties(faculty_id, full_name, phone_no, department, designation)
Table-4: Exams(exam_id, course_name, exam_type, exam_date, duration_minutes)
Table-5: Results(result_id, student_name, course_name, marks_obtained, grade)

8. Company

Table-1 Employees(emp_id,emp_name,emp_age,phone,address)
Table-2 Department(dep_id,dep_name,dept_hod,no_of_employees,description)
Table-3 Staff(id,name,age,salary,phone,location)
Table-4 Projects(id,name,project_manager,project_schedule,project_location)
Table-5 Events(id,name,location,no_of_people,event_schedule)

9. Cruise_ship

Table-1: Ships(ship_id, ship_name, capacity, type, status)
Table-2: Cabins(cabin_id, cabin_number, deck, cabin_type, price)
Table-3: Passengers(passenger_id, full_name, gender, age, nationality)
Table-4: Bookings(booking_id, passenger_name, cabin_number, cruise_date, payment_status)
Table-5: Crew(crew_id, crew_name, role, experience_years, contact_number)

10. E-learning platform

T-1: Students(student_id, full_name, email, phone_no, enrolled_course)
T-2: Courses(course_id, course_name, category, duration_weeks, difficulty_level)
T-3: Instructors(instructor_id, full_name, expertise_area, contact_no, status)
T-4: Enrollments(enrollment_id, student_name, course_name, enrollment_date, progress_percent)
T-5: Assessments(assessment_id, course_name, type, total_marks, availability_status)

11. Event management

T-1: Events(event_id, event_name, event_type, location, event_date)
T-2: Attendees(attendee_id, full_name, phone_number, email, ticket_type)
T-3: Bookings(booking_id, attendee_name, event_name, booking_date, payment_status)
T-4: Organizers(organizer_id, organizer_name, contact_number, company_name, role)
T-5: Vendors(vendor_id, vendor_name, service_type, contact_number, status)

12. Hosptital 

Table-1: Patients(patient_id, full_name, age, gender, contact_no, blood_group)
Table-2: Doctors(doctor_id, full_name, specialization, contact_no, availability_status)
Table-3: Appointments(appointment_id, patient_name, doctor_name, appointment_date, reason)
Table-4: Rooms(room_id, room_type, status, floor, charges_per_day)
Table-5: Medicines(medicine_id, name, dosage, purpose, availability_status)

13. Foood Delivery

Table-1: Restaurants(restaurant_id, name, location, cuisine_type, rating)
Table-2: Customers(customer_id, full_name, phone_number, address, email)
Table-3: Orders(order_id, customer_name, restaurant_name, order_date, order_status)
Table-4: DeliveryAgents(agent_id, full_name, phone_number, vehicle_type, status)
Table-5: MenuItems(item_id, item_name, price, restaurant_name, availability)

14. ISRO

Table-1: Missions(mission_id, mission_name, launch_date, mission_type, status)
Table-2: LaunchVehicles(vehicle_id, vehicle_name, type, max_payload_kg, success_rate)
Table-3: Scientists(scientist_id, full_name, specialization, experience_years, contact_number)
Table-4: ResearchCenters(center_id, center_name, location, established_year, focus_area)
Table-5: Satellites(satellite_id, satellite_name, purpose, launch_vehicle_used, orbit_type)

15. Hotel

Table-1: Guests(guest_id,full_name,phone_no,gender,nationality)
Table-2: Rooms(room_id,room_type,room_number,price_per_night,status)
Table-3: Bookings(booking_id,guest_name,no_of_guest,check_In,Check_out)
Table-4: Staff(staff_id,staff_name,role,phone_no,shift_time)
Table-5: Payents(payemnt_id,guest_name,amount_paid,payment_method,payment_date)

16. Military

Table-1: Soldiers(soldier_id, full_name, rank, age, unit)
Table-2: Missions(mission_id, mission_name, location, status, mission_date)
Table-3: Weapons(weapon_id, weapon_name, type, range_km, status)
Table-4: Vehicles(vehicle_id, vehicle_type, model, capacity, condition, status)
Table-5: Training(training_id, training_name, duration_days, level, instructor)

17. Library

Table-1: Books(book_id, title, author, genre, status)
Table-2: Members(member_id, full_name, phone_no, email, membership_type)
Table-3: IssuedBooks(issue_id, member_name, book_title, issue_date, return_date)
Table-4: Librarians(librarian_id, name, phone_no, shift, email)
Table-5: Fines(fine_id, member_name, amount, reason, paid_status)

18. Pharmacy

Table-1: Medicines(medicine_id, name, type, price, stock_quantity)
Table-2: Suppliers(supplier_id, supplier_name, contact_number, city, license_number)
Table-3: Sales(sale_id, medicine_name, quantity_sold, sale_date, total_price)
Table-4: Purchases(purchase_id, supplier_name, medicine_name, purchase_date, quantity_purchased)
Table-5: Customers(customer_id, full_name, phone_number, gender, address)

19. Railway

Table-1: Trains(train_id, train_name, source_station, destination_station, status)
Table-2: Passengers(passenger_id, full_name, age, gender, phone_number)
Table-3: Bookings(booking_id, passenger_name, train_name, travel_date, seat_number)
Table-4: Stations(station_id, station_name, city, platform_count, station_code)
Table-5: Staff(staff_id, full_name, role, contact_number, assigned_train)

20. Real_estate

Table-1: Properties(property_id, property_type, location, price, status)
Table-2: Clients(client_id, full_name, phone_number, email, city)
Table-3: Transactions(transaction_id, client_name, property_location, transaction_date, amount)
Table-4: Agents(agent_id, agent_name, phone_number, region, experience_years)
Table-5: Developers(developer_id, developer_name, contact_person, head_office, rating)

21. Retail_store

Table-1: Products(product_id, product_name, category, price, stock_quantity)
Table-2: Suppliers(supplier_id, supplier_name, contact_person, phone_number, location)
Table-3: Sales(sale_id, product_name, quantity_sold, sale_date, total_amount)
Table-4: PurchaseOrders(order_id, supplier_name, product_name, order_date, order_status)
Table-5: Customers(customer_id, full_name, phone_number, address, email)

22. Social_media

T-1: Users(user_id, username, full_name, email, join_date)
T-2: Posts(post_id, username, content, post_date, visibility_status)
T-3: Comments(comment_id, username, post_id_info, comment_text, comment_date)
T-4: Likes(like_id, username, post_id_info, like_date, reaction_type)
T-5: Messages(message_id, sender_name, receiver_name, message_text, sent_time)

23. Salon

Table-1: Customers(customer_id, full_name, phone_number, gender, email)
Table-2: Services(service_id, service_name, category, price, duration_minutes)
Table-3: Appointments(appointment_id, customer_name, service_name, appointment_date, time_slot)
Table-4: Stylists(stylist_id, stylist_name, specialization, experience_years, contact_number)
Table-5: Payments(payment_id, customer_name, amount_paid, payment_method, payment_date)

24. Stock_market

Table-1: Stocks(stock_id, company_name, symbol, sector, current_price)
Table-2: Investors(investor_id, full_name, phone_number, email, city)
Table-3: Transactions(transaction_id, investor_name, stock_symbol, transaction_type, transaction_date)
Table-4: MarketNews(news_id, headline, published_date, source, impact_level)
Table-5: Dividends(dividend_id, company_name, dividend_amount, declaration_date, payment_status)

25. Travel_agent

Table-1: Clients(client_id, full_name, phone_no, email, preferred_destination)
Table-2: Packages(package_id, destination, duration_days, price, package_type)
Table-3: Bookings(booking_id, client_name, package_name, booking_date, payment_status)
Table-4: Flights(flight_id, airline_name, flight_number, departure_city, arrival_city)
Table-5: Hotels(hotel_id, hotel_name, location, room_type, availability_status)


26. Election Dataabse

Table-1: Voters(voter_id, full_name, age, gender, address)
Table-2: Candidates(candidate_id, name, party_name, constituency, total_votes)
Table-3: Votes(vote_id, voter_name, candidate_name, polling_station, vote_date)
Table-4: PollingStations(station_id, location, officer_in_charge, station_code, registered_voters)
Table-5: Results(result_id, constituency, winning_candidate, party, total_votes)


27. Electricity Board

Table-1: Customers(customer_id, full_name, address, phone_no, connection_type)
Table-2: Meters(meter_id, meter_number, installation_date, status, reading_unit)
Table-3: Bills(bill_id, customer_name, billing_month, amount_due, payment_status)
Table-4: Complaints(complaint_id, customer_name, issue_type, complaint_date, resolution_status)
Table-5: Employees(employee_id, full_name, designation, contact_no, assigned_area)


28. Amazon Database

Table-1: Customers(customer_id, full_name, email, phone_no, address)
Table-2: Products(product_id, product_name, category, price, stock_status)
Table-3: Orders(order_id, customer_name, product_name, order_date, delivery_status)
Table-4: Reviews(review_id, customer_name, product_name, rating, comment)
Table-5: Sellers(seller_id, seller_name, store_name, location, contact_no)


29. Insurance Claim Database

Table-1: PolicyHolders(policy_id, full_name, age, gender, policy_type)
Table-2: Claims(claim_id, policy_holder_name, claim_amount, claim_date, claim_status)
Table-3: Agents(agent_id, full_name, region, contact_no, active_status)
Table-4: Hospitals(hospital_id, hospital_name, location, empaneled_status, contact_no)
Table-5: Payments(payment_id, claim_id, amount_paid, payment_date, mode_of_payment)

30. Bakery Database

Table-1: Customers(customer_id, full_name, phone_no, email, favorite_item)
Table-2: Products(product_id, product_name, category, price, availability_status)
Table-3: Orders(order_id, customer_name, product_name, order_date, total_amount)
Table-4: Staff(staff_id, full_name, role, shift_time, contact_no)
Table-5: Ingredients(ingredient_id, name, quantity_kg, supplier_name, reorder_status)


*/

-- PART B 

-- -------------------------------------------------Dataabse Queries--------------------------------------------------------

-- create database to work on in it 
create database Election;

-- to work on it we need to use it first 
use Election;

-- --------------------------------------------------Dataabse Analysis----------------------------------------------

/*

Table-1: Voters(voter_id, full_name, age, gender, address)
Table-2: Candidates(candidate_id, name, party_name, constituency, total_votes)
Table-3: Votes(vote_id, voter_name, candidate_name, polling_station, vote_date)
Table-4: PollingStations(station_id, location, officer_in_charge, station_code, registered_voters)
Table-5: Results(result_id, constituency, winning_candidate, party, total_votes)

*/

-- --------------------------------------------------- Table Queries----------------------------------------------

-- create table 1
create table Voters(
voter_id int primary key,
full_name varchar(100),
age int,
gender varchar(20),
address varchar(250) 
);

-- to display table data 
select * from Voters;

-- insert records into table 1
insert into Voters(voter_id, full_name, age, gender, address)
values
(1, 'Ravi Sharma', 45, 'Male', '123 MG Road, Mumbai'),
(2, 'Anita Mehta', 32, 'Female', '56 Residency Lane, Delhi'),
(3, 'Ramesh Kumar', 60, 'Male', '77 Park Avenue, Kolkata'),
(4, 'Fatima Sheikh', 28, 'Female', '12 Marine Drive, Mumbai'),
(5, 'John Dsouza', 39, 'Male', '90 Brigade Road, Bangalore'),
(6, 'Neha Verma', 22, 'Female', '101 Civil Lines, Jaipur'),
(7, 'Arjun Singh', 50, 'Male', '5 Sector 14, Chandigarh'),
(8, 'Kiran Patil', 31, 'Female', '7 Camp Road, Pune'),
(9, 'Vikram Joshi', 41, 'Male', '23 Rajaji Street, Chennai'),
(10, 'Pooja Reddy', 36, 'Female', '3 Jubilee Hills, Hyderabad');

-- to remove values from table 
truncate table Voters;

-- to delete table 
drop table Voters;

-- create table 2
create table Candidates(
candidate_id int primary key,
name varchar(100),
party_name varchar(100),
constituency varchar(50),
total_votes int 
);

-- to display table data 
select * from Candidates;

-- insert recordds into table 2 
insert into Candidates(candidate_id, name, party_name, constituency, total_votes)
values
(1, 'Ravi Deshmukh', 'National Party', 'Mumbai South', 50321),
(2, 'Anita Rao', 'People’s Voice', 'Delhi Central', 48720),
(3, 'Suresh Mehta', 'Progressive Front', 'Kolkata East', 45510),
(4, 'Farah Ali', 'Green Future Party', 'Chennai North', 37890),
(5, 'John Fernandes', 'National Party', 'Goa Central', 42500),
(6, 'Kiran Bedi', 'Women Power', 'Pune North', 49300),
(7, 'Ramesh Yadav', 'Unity Party', 'Lucknow West', 46980),
(8, 'Priya Iyer', 'Reformists', 'Bangalore South', 51400),
(9, 'Arun Thakur', 'People’s Voice', 'Jaipur City', 38670),
(10, 'Meera Singh', 'Green Future Party', 'Bhopal Central', 40120);

-- to remove values from table 
truncate table Candidates;

-- to delete table 
drop table Candidates;

-- create table 3
create table Votes(
vote_id int primary key,
voter_name varchar(100),
candidate_name varchar(100),
polling_station varchar(150),
voting_date date
);

-- to display table data 
select * from Votes;

-- insert recordds into table 3
insert into Votes(vote_id, voter_name, candidate_name, polling_station, voting_date)
values
(1, 'Ravi Sharma', 'Ravi Deshmukh', 'St. Xavier School, Mumbai', '2024-05-10'),
(2, 'Anita Mehta', 'Anita Rao', 'Govt School No.2, Delhi', '2024-05-10'),
(3, 'Ramesh Kumar', 'Suresh Mehta', 'Nagar Bhavan, Kolkata', '2024-05-10'),
(4, 'Fatima Sheikh', 'Farah Ali', 'Metro Center, Chennai', '2024-05-10'),
(5, 'John Dsouza', 'John Fernandes', 'Panjim High School, Goa', '2024-05-10'),
(6, 'Neha Verma', 'Kiran Bedi', 'City Hall, Pune', '2024-05-10'),
(7, 'Arjun Singh', 'Ramesh Yadav', 'Community Hall, Lucknow', '2024-05-10'),
(8, 'Kiran Patil', 'Priya Iyer', 'Vidyapeeth Ground, Bangalore', '2024-05-10'),
(9, 'Vikram Joshi', 'Arun Thakur', 'Civic Center, Jaipur', '2024-05-10'),
(10, 'Pooja Reddy', 'Meera Singh', 'Town School, Bhopal', '2024-05-10');

-- to remove values from table 
truncate table Votes;

-- to delete table 
drop table Votes;

-- create table 4
create table PollingStations(
station_id int primary key, 
location varchar(100), 
officer_in_charge varchar(100), 
station_code int, 
registered_voters int
);

-- to display table data 
select * from PollingStations;

-- insert records into table 4 
insert into PollingStations(station_id, location, officer_in_charge, station_code, registered_voters)
values
(1, 'St. Xavier School, Mumbai', 'Nikhil Patil', 1001, 1200),
(2, 'Govt School No.2, Delhi', 'Reena Verma', 1002, 1450),
(3, 'Nagar Bhavan, Kolkata', 'Sourav Dey', 1003, 1100),
(4, 'Metro Center, Chennai', 'Ayesha Khan', 1004, 980),
(5, 'Panjim High School, Goa', 'Miguel D’Souza', 1005, 700),
(6, 'City Hall, Pune', 'Arjun Shinde', 1006, 1320),
(7, 'Community Hall, Lucknow', 'Praveen Yadav', 1007, 1600),
(8, 'Vidyapeeth Ground, Bangalore', 'Lakshmi Reddy', 1008, 1400),
(9, 'Civic Center, Jaipur', 'Manoj Joshi', 1009, 1250),
(10, 'Town School, Bhopal', 'Geeta Sinha', 1010, 1175);

-- to remove values from table 
truncate table PollingStations;

-- to delete table 
drop table PollingStations;


-- create table 5
create table Results(
result_id int primary key, 
constituency varchar(100), 
winning_candidate varchar(50), 
party varchar(100), 
total_votes int
);

-- to display table data 
select * from Results;

-- insert records into table 5
insert into Results(result_id, constituency, winning_candidate, party, total_votes)
values
(1, 'Mumbai South', 'Ravi Deshmukh', 'National Party', 50321),
(2, 'Delhi Central', 'Anita Rao', 'People’s Voice', 48720),
(3, 'Kolkata East', 'Suresh Mehta', 'Progressive Front', 45510),
(4, 'Chennai North', 'Farah Ali', 'Green Future Party', 37890),
(5, 'Goa Central', 'John Fernandes', 'National Party', 42500),
(6, 'Pune North', 'Kiran Bedi', 'Women Power', 49300),
(7, 'Lucknow West', 'Ramesh Yadav', 'Unity Party', 46980),
(8, 'Bangalore South', 'Priya Iyer', 'Reformists', 51400),
(9, 'Jaipur City', 'Arun Thakur', 'People’s Voice', 38670),
(10, 'Bhopal Central', 'Meera Singh', 'Green Future Party', 40120);

-- to remove values from table 
truncate table Results;

-- to delete table 
drop table Results;

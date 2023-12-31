CREATE SCHEMA `RTA` ;
USE RTA;

CREATE TABLE Route (
    route_ID INT,
    route_name VARCHAR(50) PRIMARY KEY,
  	no_of_bus_stops INT,
  	first_stop VARCHAR(50),
  	last_stop VARCHAR(50)
);

CREATE TABLE Bus (
    licence_Plate_Number VARCHAR(10) PRIMARY KEY,
  	route_name VARCHAR(50),
    seat_capacity INT,
    make VARCHAR(30),
    model VARCHAR(30),
    model_year INT,
    fuel_type VARCHAR(10),
  	FOREIGN KEY (route_name) REFERENCES Route(route_name)
);

CREATE TABLE Bus_stop (
    bus_stop_name VARCHAR(50) PRIMARY KEY,
  	stop_ID INT,
  	route_name VARCHAR(50),
  	FOREIGN KEY (route_name) REFERENCES Route(route_name)
);

CREATE TABLE Passenger (
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Pass_ID VARCHAR(15) PRIMARY KEY
);

CREATE TABLE Rides (
  	licence_Plate_Number VARCHAR(10),
  	Pass_ID VARCHAR(15),
  	FOREIGN KEY (licence_Plate_Number) REFERENCES Bus(licence_Plate_Number),
  	FOREIGN KEY (Pass_ID) REFERENCES Passenger(Pass_ID)
);

CREATE TABLE Bus_driver (
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Driver_ID VARCHAR(15) PRIMARY KEY,
  	phone_no INT,
    licence_Plate_Number VARCHAR(10),
    FOREIGN KEY (licence_Plate_Number) REFERENCES Bus(licence_Plate_Number)
);

INSERT INTO Route (route_ID, route_name, no_of_bus_stops, first_stop, last_stop)
VALUES
    (1, 'Route A', 4, 'Dubai', 'Sharjah'),							
    (2, 'Route B', 2, 'RAK', 'Sharjah'),
    (3, 'Route C', 2, 'Samnan', 'RAK'),
    (4, 'Route D', 3, 'Ajman', 'AlTaawun'),
    (5, 'Route E', 4, 'RAK', 'Al-Ain'),
    (6, 'Route F', 3, 'Al-Ain', 'Sharjah'),
    (7, 'Route G', 3, 'Expo', 'Etisalat'),
    (8, 'Route H', 5, 'Ajman', 'Sharjah'),
    (9, 'Route I', 2, 'RAK', 'Dubai'),
    (10, 'Route J', 3, 'Abu-Dhabi', 'Dubai');
    
INSERT INTO Bus (licence_Plate_Number, route_name, seat_capacity, make, model, model_year, fuel_type)
VALUES
    ('D35687', 'Route A', 40, 'Mercedes', 'Sprinter', 2020, 'Hybrid'),
    ('F49876', 'Route B', 30, 'Volvo', 'XC60', 2019, 'Petrol'),
    ('A35798', 'Route J', 35, 'Ford', 'Transit', 2021, 'Electric'),
    ('B39876', 'Route C', 35, 'Toyota', 'Coaster', 2019, 'Diesel'),
    ('C24686', 'Route E', 35, 'Ford', 'Transit', 2021, 'Hybrid'),
    ('Z45378', 'Route I', 40, 'Mercedes', 'Sprinter', 2020, 'Diesel'),
    ('F45390', 'Route J', 30, 'Volvo', 'XC60', 2021, 'Petrol'),
    ('K87654', 'Route A', 35, 'Ford', 'Transit', 2021, 'Electric'),
    ('L98076', 'Route B', 35, 'Toyota', 'Coaster', 2019, 'Diesel'),
    ('B21366', 'Route C', 35, 'Toyota', 'Coaster', 2019, 'Diesel');
    
INSERT INTO Passenger (Fname, Lname, Pass_ID)
VALUES
    ('John', 'Doe', 'P001'),
    ('Jane', 'Smith', 'P002'),
    ('Bob', 'Johnson', 'P003'),
    ('Ahmad', 'Ali', 'P004'),
    ('Mohamed', 'Ahmed', 'P005'),
    ('Omar', 'Ali', 'P006'),
    ('Ali', 'Samer', 'P007'),
    ('Sara', 'Johnson', 'P008'),
    ('Hisham', 'Ahmad', 'P009'),
    ('Tariq', 'Mohamed', 'P010');
    
INSERT INTO Bus_driver (Fname, Lname, Driver_ID, phone_no, licence_Plate_Number)
VALUES
    ('Alice', 'Jones', 'D001', 0506578654, 'A35798'),
    ('Bob', 'Brown', 'D002', 0509876876, 'D35687'),
    ('Ahmad', 'Ali', 'D003', 0503487654, 'F49876'),
    ('Sara', 'Brown', 'D004', 0507687698, 'B21366'),
    ('John', 'Jones', 'D005', 0559870989, 'B39876'),
    ('Ali', 'Mohamed', 'D006', 0569809345, 'C24686'),
    ('Mohamed', 'Ahmed', 'D007', 0509876756, 'L98076'),
    ('Ali', 'Ahmeed', 'D008', 0543467987, 'K87654'),
    ('Elom', 'Musk', 'D009', 0567683456, 'F45390'),
    ('Elliot', 'Brown', 'D010', 0508764536, 'Z45378');
    
INSERT INTO Bus_stop (bus_stop_name, route_name, stop_ID)
VALUES
	('Dubai', 'Route A',1),
    ('Sharjah', 'Route B',2),
    ('RAK', 'Route A',3),
    ('Samnan', 'Route C',4),
    ('Ajman', 'Route D',5),
    ('Al-Ain', 'Route B',6),
    ('AlTaawun', 'Route A',7),
    ('Expo', 'Route A',8),
    ('Etisalat', 'Route D',9),
    ('Abu-Dhabi', NULL,10);
    
INSERT INTO Rides (licence_Plate_Number, Pass_ID)
VALUES
    ('D35687', 'P001'),
    ('F49876', 'P002'),
    ('A35798', 'P003'),
    ('B39876', 'P004'),
    ('C24686', 'P005'),
    ('Z45378', 'P006'),
    ('F45390', 'P007'),
    ('K87654', 'P008'),
    ('L98076', 'P009'),
    ('B21366', 'P010');
    
    SELECT route_name 
FROM route 
WHERE no_of_bus_stops = (SELECT MAX(no_of_bus_stops)
                         FROM Route); 


CREATE VIEW ElectricBuses AS
SELECT licence_Plate_Number, route_name
FROM Bus
WHERE fuel_type = 'Electric';
SELECT DISTINCT route_name 
FROM ElectricBuses;
    

SELECT bus_stop_name
FROM Bus_stop
GROUP BY bus_stop_name
HAVING COUNT(route_name) >= 2;


SELECT fuel_type, SUM(seat_capacity) AS total_seat_capacity
FROM Bus
GROUP BY fuel_type;


SELECT Bus_stop.bus_stop_name
FROM Bus_stop
WHERE NOT EXISTS (
    SELECT *
    FROM Route
    WHERE Bus_stop.route_name = route.route_name
);
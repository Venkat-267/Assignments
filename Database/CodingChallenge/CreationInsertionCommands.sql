-- Create DB
CREATE DATABASE CarRentalSystem;

-- USE DB
USE CarRentalSystem;

-- Create Vehicle Table
CREATE TABLE Vehicle(
vehicleID INT IDENTITY PRIMARY KEY,
make VARCHAR(100) NOT NULL,
model VARCHAR(100) NOT NULL,
year INT NOT NULL,
dailyRate DECIMAL(10,2),
status NVARCHAR(20) CHECK (status IN ('available', 'notAvailable')) NOT NULL,
passengerCapacity INT,
engineCapacity INT
);

-- Create Customer Table
CREATE TABLE Customer(
customerID INT IDENTITY PRIMARY KEY,
firstName VARCHAR(100),
lastName VARCHAR(100),
email VARCHAR(100),
phoneNumber VARCHAR(20)
);

-- Create Lease Table
CREATE TABLE Lease(
leaseID INT IDENTITY PRIMARY KEY,
vehicleID INT,
customerID INT,
startDate DATE,
endDate DATE,
type VARCHAR(50) CHECK (type IN ('DailyLease', 'MonthlyLease')) NOT NULL
CONSTRAINT FK_VehicleID FOREIGN KEY (vehicleID) REFERENCES Vehicle(vehicleID),
CONSTRAINT FK_CustomerID FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

-- Create Payment Table
CREATE TABLE Payment(
paymentID INT IDENTITY PRIMARY KEY,
leaseID INT,
paymentDate DATE,
amount DECIMAL(10,2),
CONSTRAINT FK_LeaseID FOREIGN KEY(leaseID) REFERENCES Lease(leaseID)
);


-- Insertion Commands
INSERT INTO Vehicle (make, model, year, dailyRate, status, passengerCapacity, engineCapacity) 
VALUES 
('Toyota','Camry',2022,50.00,'available',4,1450),
('Honda','Civic',2023,45.00,'available',7,1500),
('Ford','Focus',2022,48.00,'notAvailable',4,1400),
('Nissan','Altima',2023,52.00,'available',7,1200),
('Chevrolet','Malibu',2022,47.00,'available',4,1800),
('Hyundai','Sonata',2023,49.00,'notAvailable',7,1400),
('BMW','3 Series',2023,60.00,'available',7,2499),
('Mercedes','C-Class',2022,58.00,'available',8,2599),
('Audi','A4',2022,55.00,'notAvailable',4,2500),
('Lexus','ES',2023,54.00,'available',4,2500);

INSERT INTO Customer  (firstName, lastName, email, phoneNumber) 
VALUES 
('John', 'Doe', 'johndoe@example.com', '555-555-5555'),
('Jane', 'Smith', 'janesmith@example.com', '555-123-4567'),
('Robert', 'Johnson', 'robert@example.com', '555-789-1234'),
('Sarah', 'Brown', 'sarah@example.com', '555-456-7890'),
('David', 'Lee', 'david@example.com', '555-987-6543'),
('Laura', 'Hall', 'laura@example.com', '555-234-5678'),
('Michael', 'Davis', 'michael@example.com', '555-876-5432'),
('Emma', 'Wilson', 'emma@example.com', '555-432-1098'),
('William', 'Taylor', 'william@example.com', '555-321-6547'),
('Olivia', 'Adams', 'olivia@example.com', '555-765-4321');

INSERT INTO Lease (vehicleID, customerID, startDate, endDate, type) 
VALUES 
(1, 1, '2023-01-01', '2023-01-05', 'DailyLease'),
(2, 2, '2023-02-15', '2023-02-28', 'MonthlyLease'),
(3, 3, '2023-03-10', '2023-03-15', 'DailyLease'),
(4, 4, '2023-04-20', '2023-04-30', 'MonthlyLease'),
(5, 5, '2023-05-05', '2023-05-10', 'DailyLease'),
(4, 3, '2023-06-15', '2023-06-30', 'MonthlyLease'),
(7, 7, '2023-07-01', '2023-07-10', 'DailyLease'),
(8, 8, '2023-08-12', '2023-08-15', 'MonthlyLease'),
(3, 3, '2023-09-07', '2023-09-10', 'DailyLease'),
(10, 10, '2023-10-10', '2023-10-31', 'MonthlyLease');

INSERT INTO Payment(leaseID,paymentDate,amount)
VALUES
(1,'2023-01-03',200.00),
(2,'2023-02-20',1000.00),
(3,'2023-03-12',75.00);
USE CarRentalSystem;

-- Update daily rate for mercedes car to 68
UPDATE Vehicle SET dailyRate=68 WHERE make='Mercedes';

-- Delete a specific customer and all associated leases and payments.
DELETE FROM Payment 
WHERE leaseID IN (SELECT leaseID FROM Lease WHERE customerID = 2);

DELETE FROM Lease 
WHERE customerID = 2;

DELETE FROM Customer 
WHERE customerID = 2;

-- Rename the "paymentDate" column in the Payment table to "transactionDate".
EXEC sp_rename 'payment.paymentDate', 'transactionDate','COLUMN';

-- Find a specific customer by email.
SELECT * FROM Customer WHERE email='robert@example.com';

-- Get active leases for a specific customer.
SELECT c.customerID, c.firstName, l.leaseID, l.type, l.startDate, l.endDate 
FROM Customer c
JOIN Lease l ON c.customerID = l.customerID
WHERE c.customerID = 1 AND l.endDate >= GETDATE();

-- Find all payments made by a customer with a specific phone number.
SELECT * FROM Payment WHERE leaseID IN (SELECT leaseID FROM Lease WHERE customerID IN (SELECT customerID FROM Customer WHERE phoneNumber = '555-789-1234'));

-- Calculate the average daily rate of all available cars.
SELECT AVG(dailyRate) AS AverageDailyRate FROM Vehicle WHERE status = 'available'

-- Find the car with the highest daily rate.
SELECT * FROM Vehicle WHERE dailyRate = (SELECT MAX(dailyRate) FROM Vehicle);

-- Retrieve all cars leased by a specific customer.
SELECT v.vehicleID, v.make,v.model, c.firstName FROM Vehicle V
JOIN Lease l ON v.vehicleID=l.vehicleID
JOIN Customer c ON l.customerID=c.customerID
WHERE c.customerID=1;

-- Find the details of the most recent lease.
SELECT TOP 2 l.leaseID, l.startDate, l.endDate, l.type, c.customerID, c.firstName,v.vehicleID, v.make, v.model, v.dailyRate
FROM Lease l
JOIN Customer c ON l.customerID = c.customerID
JOIN Vehicle v ON l.vehicleID = v.vehicleID
ORDER BY l.startDate DESC;

-- List all payments made in the year 2023.
SELECT * FROM Payment WHERE YEAR(transactionDate)=2023;

-- Retrieve customers who have not made any payments.
SELECT * FROM Customer WHERE customerID IN (SELECT customerID FROM Lease WHERE leaseID NOT IN (SELECT leaseID FROM Payment));

-- Retrieve Car Details and Their Total Payments.
SELECT v.vehicleID, v.make,v.model,v.dailyRate, SUM(p.amount) AS TotalPayment FROM Vehicle v
JOIN Lease l on v.vehicleID=l.leaseID
JOIN Payment p on l.leaseID=p.leaseID
GROUP BY v.vehicleID, v.make,v.model,v.dailyRate;

-- Calculate Total Payments for Each Customer.
SELECT c.customerID, c.firstName, SUM(p.amount) as TotalPayment FROM Customer c
JOIN Lease l ON c.customerID=l.customerID
JOIN Payment p ON p.leaseID=l.leaseID
GROUP BY c.customerID, c.firstName;

-- List Car Details for Each Lease.
SELECT v.vehicleID, l.leaseID, v.make, v.model, v.year, v.dailyRate, l.type FROM Vehicle v
JOIN Lease l ON v.vehicleID=l.vehicleID
ORDER BY v.vehicleID;

-- Retrieve Details of Active Leases with Customer and Car Information.
SELECT c.customerID, c.firstName, l.leaseID,l.startDate, l.endDate, v.vehicleID, v.make, v.model
FROM Lease l
JOIN Customer c ON c.customerID = l.customerID
JOIN Vehicle v ON v.vehicleID=l.vehicleID
WHERE l.endDate >= GETDATE();

-- Find the Customer Who Has Spent the Most on Leases.
SELECT TOP 1 c.customerID, c.firstName, SUM(p.amount) as TotalPayment FROM Customer c
JOIN Lease l ON c.customerID=l.customerID
JOIN Payment p ON p.leaseID=l.leaseID
GROUP BY c.customerID, c.firstName
ORDER BY TotalPayment DESC;

-- List All Cars with Their Current Lease Information.
SELECT * FROM Vehicle v
JOIN Lease l ON v.vehicleID=l.vehicleID
ORDER BY v.vehicleID;
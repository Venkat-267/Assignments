-- Insert Sample Records into the Table
USE TicketBookingSystem;

-- Insert into Venue Tabel:
INSERT INTO Venue (venue_name, address) VALUES
('Grand Stadium', '123 Main St, City A'),
('Sunset Arena', '456 Side St, City B'),
('Ocean View Theater', '789 Ocean Rd, City C'),
('Skyline Hall', '101 Sky Rd, City D'),
('City Sports Complex', '202 Sports Area, City E'),
('Harmony Concert Hall', '303 Harmony St, City F'),
('Downtown Cinema', '404 Cinema Ave, City G'),
('Maple Park Auditorium', '505 Maple Ave, City H'),
('Evergreen Amphitheater', '606 Evergreen Rd, City I'),
('Crystal Dome', '707 Crystal Ln, City J');

-- Insert into Event Tabel:
INSERT INTO Event (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type) VALUES
('Rock Concert', '2025-03-15', '19:00', 1, 5000, 4500, 7500.00, 'Concert'),
('Basketball Match', '2025-03-16', '18:30', 2, 10000, 9200, 5000.00, 'Sports'),
('Movie Premiere', '2025-03-17', '20:00', 3, 300, 250, 200.00, 'Movie'),
('Jazz Festival', '2025-03-18', '17:00', 4, 2000, 1800, 600.00, 'Concert'),
('Football Match', '2025-03-19', '16:00', 5, 20000, 14000, 5500.00, 'Sports'),
('Classical Music Night', '2025-03-20', '19:30', 6, 1200, 1100, 1500.00, 'Concert'),
('Action Movie Screening', '2025-03-21', '21:00', 7, 400, 350, 250.00, 'Movie'),
('Theater Play', '2025-03-22', '18:00', 8, 600, 580, 451.00, 'Movie'),
('Marathon Finale', '2025-03-23', '08:00', 9, 500, 450, 3000.00, 'Sports'),
('Pop Music Festival', '2025-03-24', '20:00', 10, 8000, 7500, 7000.00, 'Concert'),
('Cricket World Cup', '2025-04-15', '19:00', 1, 5000, 4500, 7500.00, 'Sports'),
('FIFA World Cup', '2025-05-16', '18:30', 2, 10000, 9200, 5000.00, 'Sports');


-- Insert into Customer Table:
INSERT INTO Customer (customer_name, email, phone_number) VALUES
('Alice', 'alice@example.com', '1234567890'),
('Bob', 'bob@example.com', '2345678901'),
('Charlie', 'charlie@example.com', '3456789012'),
('David', 'david@example.com', '4567890123'),
('Emma', 'emma@example.com', '5678901234'),
('Frank', 'frank@example.com', '6789012345'),
('Grace', 'grace@example.com', '7890123456'),
('Hannah', 'hannah@example.com', '8901234567'),
('Ian', 'ian@example.com', '9012345678'),
('Jack', 'jack@example.com', '0123456789'),
('Venkat', 'Venkat@example.com', '1234567000');

-- Insert into Booking Tabel:
INSERT INTO Booking (customer_id, event_id, num_tickets, total_cost, booking_date) VALUES
(1, 1, 2, 15000.00, '2025-02-20'),
(2, 2, 3, 15000.00, '2025-02-21'),
(3, 3, 1, 200.00, '2025-02-22'),
(4, 4, 4, 2400.00, '2025-02-23'),
(5, 5, 2, 11000.00, '2025-02-24'),
(6, 6, 1, 800.00, '2025-02-25'),
(7, 7, 2, 500.00, '2025-02-26'),
(8, 8, 5, 2250.00, '2025-02-27'),
(9, 9, 3, 9000.00, '2025-02-28'),
(10, 10, 4, 28000.00, '2025-02-28'),
(10, 10, 4, 28000.00, '2025-02-28'),
(11, 11, 3, 22500.00, '2025-03-01'),
(11, 12, 2, 10000.00, '2025-03-02'),
(3, 2, 3, 15000.00, '2025-02-21');

--UPDATE Customer 
--SET booking_id = (SELECT booking_id FROM Booking WHERE Booking.customer_id = Customer.customer_id);
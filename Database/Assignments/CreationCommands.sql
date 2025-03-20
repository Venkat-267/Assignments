-- Create database TicketBookingSystem

create database TicketBookingSystem;

use TicketBookingSystem;

-- Create venue table
CREATE TABLE Venue(
venue_id INT IDENTITY PRIMARY KEY,
venue_name NVARCHAR(100) NOT NULL,
address NVARCHAR(max) NOT NULL
);

-- Create event table
CREATE TABLE Event(
event_id INT IDENTITY PRIMARY KEY,
event_name NVARCHAR(100) NOT NULL,
event_date DATE NOT NULL,
event_time TIME NOT NULL,
venue_id INT NOT NULL FOREIGN KEY REFERENCES Venue(venue_id),
total_seats INT NOT NULL CHECK (total_seats>0),
available_seats INT NOT NULL CHECK (available_seats>=0),
ticket_price DECIMAL(10,2) NOT NULL CHECK (ticket_price>0),
event_type VARCHAR(20) CHECK(event_type IN ('Movie','Sports','Concert')),
booking_id int,
CONSTRAINT FK_Event_Venue FOREIGN KEY (venue_id) REFERENCES Venue(venue_id)
);

-- Create Customer table
CREATE TABLE Customer(
customer_id INT IDENTITY PRIMARY KEY,
customer_name NVARCHAR(100) NOT NULL,
email NVARCHAR(100) NOT NULL,
phone_number NVARCHAR(12) NOT NULL,
booking_id INT NULL,
);

-- Create Booking table
CREATE TABLE Booking(
booking_id INT IDENTITY PRIMARY KEY,
customer_id INT NOT NULL,
event_id INT NOT NULL,
num_tickets INT NOT NULL CHECK (num_tickets>0),
total_cost DECIMAL(10,2) NOT NULL,
booking_date DATE DEFAULT GETDATE(),
CONSTRAINT FK_Booking_Event FOREIGN KEY (event_id) REFERENCES Event(event_id),
CONSTRAINT FK_Booking_Customer FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
);

ALTER TABLE Event
ADD CONSTRAINT FK_Event_Booking FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);

ALTER TABLE Customer
ADD CONSTRAINT FK_Customer_Booking FOREIGN KEY (booking_id) REFERENCES Booking(booking_id);
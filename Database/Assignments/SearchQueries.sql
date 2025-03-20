USE TicketBookingSystem;

--List all Events
select * from Event;

-- List events with available tickets
select * from Event
where available_seats>0;

-- List events name with partial match with ‘cup’
select event_name from Event
where event_name LIKE '%cup%';

-- List Events with ticket price range is between 1000 to 2500. 
select * from Event
where ticket_price between 1000 and 2500;

-- List Events with dates falling within a specific range.
select * from Event
where event_date between '2025-03-18' and '2025-04-15';

-- List events with available tickets that also have "Concert" in their name. 
select event_name from Event
where event_name LIKE '%Concert%';

-- List users in batches of 5, starting from the 6th user. 
select * from Customer
ORDER BY customer_id
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

-- List bookings details contains booked no of ticket more than 4.
select * from Booking
where num_tickets>4;

-- List customer information whose phone number end with ‘000’.
select * from Customer
where phone_number Like '%000';

-- List  events in order whose seat capacity more than 15000. 
select * from Event
where total_seats>15000;

--- List events name not start with ‘x’, ‘y’, ‘z’ 
SELECT event_name FROM Event  
WHERE event_name NOT LIKE 'X%'  
AND event_name NOT LIKE 'Y%'  
AND event_name NOT LIKE 'Z%';

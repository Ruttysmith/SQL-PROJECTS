-- FLIGHT TICKET PRICE ANALYSIS PROJECT;

CREATE DATABASE Flight_Ticket_Price_Analysis;
Select * from flight_data;
describe flight_data;

-- 1. Average Price by Airline;
select airline, round(avg(price),2) as avg_price
from flight_data
group by airline
order by avg_price;

-- 2.Average price by Class;
select class, round(avg(price),2) as avg_price
from flight_data
group by class
order by avg_price;

-- 3. Average price by Departure;
select departure_time, round(avg(price),2) as avg_price
from flight_data
group by departure_time
order by avg_price;

-- 4.Average price by arrivaltime;
select arrival_time, round(avg(price),2) as avg_price
from flight_data
group by arrival_time
order by avg_price;

-- 5. cheapest and most expensive routes;
select source_city, destination_city, round(avg(price),2) as avg_price
from flight_data
group by source_city, destination_city
order by avg_price asc
limit 5;

-- for most expensive;
select source_city, destination_city, round(avg(price),2) as avg_price
from flight_data
group by source_city, destination_city
order by avg_price desc
limit 5;

-- 6.price by per day before departure;
select * from flight_data;
select days_left, round(avg(price),2) as avg_price
from flight_data
group by days_left
order by days_left;

-- 7. compare early bookings and late-minutes;
select round(avg(price),2) as avg_price,
CASE
when days_left <=2 then "last_minutes"
else "early bookings"
end as booking_type
fROM flight_data
group by booking_type;

-- 8 price by source and destination;
select source_city, destination_city, round(avg(price),2) as avg_price
from flight_data
group by source_city, destination_city
order by avg_price;

-- 9. average price by number of stops;
select stops, round(avg(price),2) as avg_price
from flight_data
group by stops
order by stops;

-- 10. longest and shortest average duration by airline;
select airline, round(avg(duration),2) as avg_duration
from flight_data
group by airline
order by avg_duration asc;

-- for longest duration;
select airline, round(avg(duration),2) as avg_duration
from flight_data
group by airline
order by avg_duration desc;

-- 11. most frequent routes or flights;
select source_city, destination_city, count(*) as count_of_flight
from flight_data
group by source_city, destination_city
order by count_of_flight;
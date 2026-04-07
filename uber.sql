
show tables;
show databases;
use uber;
select * from uber limit 10;
select count(*) as total_records from uber;

## Check Null Values
select count(*)-count(`Customer Rating`) as missing_customer_rating from uber;

## Total Bookings & Revenue
select count(`Booking ID`) as total_bookings , sum(`Booking value`) as total_revenue from uber;

## Bookings by status 
select 'Booking Status',count(*) as total_bookings  from uber group by 'Booking Status';

## Revenue by booking status 
select `Booking Status`,sum(`Booking Value`) as total_revenue from uber group by `Booking Status`;

## Booking by hour
select hour(time) as booking_time,count(*) as total_bookings from uber group by booking_time order by booking_time;

## time series analysis
select case when hour(Time)< 12 then 'Morning' when hour(Time)<17 then 'Afternoon' when hour(Time)<21 then 'Evening' else 'Night' end as time_slot,
count(*) as total_bookings from uber group by time_slot;

## Top 10 Pickup location analysis
select `Pickup Location`as location,count(*) as total_bookings from uber group by location order by total_bookings desc limit 10;

## Top 10 Drop location analysis
select `Drop Location` as location ,count(*) as total_bookings from uber group  by location order by total_bookings desc limit 10;

## Top 10 Revenue by location
select `Pickup Location` as location,sum(`Booking Value`) as revenue from uber group by location order by revenue desc limit 10;

## Bookings by vehicle type
select `Vehicle Type`,count(*) as total_bookings from uber group by `Vehicle Type` order by total_bookings desc ;

## Revenue by vehicle type
select `Vehicle Type` as vehicle_type,sum(`Booking Value`) as revenue from uber group by vehicle_type order by revenue desc limit 10;

## Total incomplete rides
select `Booking Status`,count(*) as total_bookings from uber where `Booking Status`='Incomplete';

## Total completed rides
select `Booking Status`, count(*) as total_bookings from uber where `Booking Status`= 'Completed';

## Average rating
select round(avg(`Customer Rating`),2) as avg_customer_rating ,round(avg(`Driver Ratings`),2) as avg_driver_rating from uber ;

## Rating by booking status
select `Booking Status`,round(avg(`Customer Rating`),2) as avg_customer_rating from uber group by `Booking Status`order by avg_customer_rating desc;

## Payment method distribution 
select `Payment Method` ,count(*) as total_bookings from uber group by `Payment Method` order by total_bookings desc ;

## Revenue by payment method 
select `Payment Method` as payment_method ,sum(`Booking Value`) as revenue from uber group by payment_method  order by revenue desc limit 10;

## Avg vtat and avg ctat
select round(avg(`Avg VTAT`),2) as Avg_VTAT,round(avg(`Avg CTAT`),2) as Avg_CTAT from uber;

## VTAT by location
select `Pickup Location`, round(avg(`Avg VTAT`),2) as VTAT from uber group by `Pickup Location` order by VTAT desc limit 10;

## CTAT by time slot
select case when hour(Time)< 12 then 'Morning' when hour(Time)<17 then 'Afternoon' when hour(Time)<21 then 'Evening' else 'Night' end as time_slot,
round(avg(`Avg CTAT`),2) as CTAT from uber group by time_slot;


## High cancellation locations 
select `Pickup Location` as pickup_location,count(*) as cancellations  from uber where `Booking Status`='Incomplete'group by pickup_location order by cancellations desc  ;

### Peak Demand Location + Time
select `Pickup Location` as pickup_location,hour(Time) as hour,count(*) as total_bookings from uber group by pickup_location,hour order by total_bookings desc limit 10  ;


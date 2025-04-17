SELECT * FROM little_lemon_sales.bookings;
/*
Replicate the records so I can query the booking table to resemble the pictured output
The records already exist in my table, so I will update instead of insert
*/

UPDATE little_lemon_sales.bookings
SET booking_dttm = '2022-10-10',
    table_number = 5,
    customer_id = 1
WHERE booking_id = 1;

-- Update BookingID 2
UPDATE little_lemon_sales.bookings
SET booking_dttm = '2022-11-12',
    table_number = 3,
    customer_id = 3
WHERE booking_id = 2;

-- Update BookingID 3
UPDATE little_lemon_sales.bookings
SET booking_dttm = '2022-10-11',
    table_number = 2,
    customer_id = 2
WHERE booking_id = 3;

-- Update BookingID 4
UPDATE little_lemon_sales.bookings
SET booking_dttm = '2022-10-13',
    table_number = 2,
    customer_id = 1
WHERE booking_id = 4;

SELECT
	booking_id as BookingID
    , cast(booking_dttm as date) as BookingDate
    , table_number as TableNumber
    , customer_id as CustomerID
FROM bookings
where booking_id < 5;
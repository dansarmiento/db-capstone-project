use little_lemon_sales;
/*
In this first task you need to create a new procedure called AddBooking to add a new table booking record.
The procedure should include four input parameters in the form of the following bookings parameters:
booking id, 
customer id, 
booking date,
and table number.
*/

DELIMITER //

CREATE PROCEDURE AddBooking(
    IN input_booking_id INT,
    IN input_customer_id INT,
    IN input_table_number INT,
    IN input_booking_date DATE
)
BEGIN
    INSERT INTO little_lemon_sales.bookings (
        booking_id,
        customer_id,
        table_number,
        booking_dttm
    )
    VALUES (
        input_booking_id,
        input_customer_id,
        input_table_number,
        input_booking_date
    );

    SELECT 'New booking added' AS Confirmation;
END //

DELIMITER ;
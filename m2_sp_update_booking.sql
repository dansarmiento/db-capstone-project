use little_lemon_sales;
/*
For your second task, Little Lemon need you to create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.
The procedure should have two input parameters in the form of booking id and booking date. You must also include an UPDATE statement inside the procedure. 
The screenshot below shows an example of the UpdateBooking procedure in use.
*/

DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN input_booking_id INT,
    IN input_booking_date DATE
)
BEGIN
    UPDATE little_lemon_sales.bookings
    SET booking_dttm = input_booking_date
    WHERE booking_id = input_booking_id;

    SELECT CONCAT('Booking ', input_booking_id, ' updated') AS Confirmation;
END //

DELIMITER ;

CALL UpdateBooking(9,"2022-12-17")
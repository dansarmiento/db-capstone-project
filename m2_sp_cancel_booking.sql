use little_lemon_sales;
/*
For the third and final task, Little Lemon need you to create a new procedure called CancelBooking that they can use to cancel or remove a booking.
The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure. 
*/

DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN input_booking_id INT
)
BEGIN
    DELETE FROM little_lemon_sales.bookings
    WHERE booking_id = input_booking_id;

    SELECT CONCAT('Booking ', input_booking_id, ' cancelled') AS Confirmation;
END //

DELIMITER ;

CALL CancelBooking(9);
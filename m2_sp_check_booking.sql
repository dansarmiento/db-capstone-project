use little_lemon_sales;
/*
For your second task, Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. Creating this procedure helps to minimize the effort involved in repeatedly coding the same SQL statements.
The procedure should have two input parameters in the form of booking date and table number. You can also create a variable in the procedure to check the status of each table.
*/
DELIMITER //

CREATE PROCEDURE CheckBooking(
    IN input_date DATE,
    IN input_table INT
)
BEGIN
    DECLARE booking_status VARCHAR(100);

    IF EXISTS (
        SELECT 1
        FROM little_lemon_sales.bookings
        WHERE booking_dttm = input_date AND table_number = input_table
    ) THEN
        SET booking_status = CONCAT('Table ', input_table, ' is already booked');
    ELSE
        SET booking_status = CONCAT('Table ', input_table, ' is available');
    END IF;

    SELECT booking_status AS 'Booking status';
END //

DELIMITER ;

CALL CheckBooking("2022-11-12", 3);
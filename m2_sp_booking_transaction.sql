use little_lemon_sales;
/*
Use the following guidelines to complete this task:
The procedure should include two input parameters in the form of booking date and table number.
It also requires at least one variable and should begin with a START TRANSACTION statement.
Your INSERT statement must add a new booking record using the input parameter's values.
Use an IF ELSE statement to check if a table is already booked on the given date. 
If the table is already booked, then rollback the transaction. If the table is available, then commit the transaction. 
*/

DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN input_date DATE,
    IN input_table INT
)
BEGIN
    DECLARE table_count INT;

    START TRANSACTION;

    SELECT 
		COUNT(*) INTO table_count
    FROM little_lemon_sales.bookings
    WHERE booking_dttm = input_date AND table_number = input_table;

    IF table_count > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Booking cancelled: Table ', input_table, ' is already booked on ', input_date) AS booking_status;
    ELSE
        INSERT INTO little_lemon_sales.bookings (booking_dttm, table_number, customer_id)
        VALUES (input_date, input_table, 1); -- no instructions for dynamic customer_id so using a default value
        COMMIT;
        SELECT CONCAT('Booking confirmed: Table ', input_table, ' has been booked on ', input_date) AS booking_status;
    END IF;
END //

DELIMITER ;


CALL AddValidBooking("2022-12-17",6);
use little_lemon_sales;
/*
Stored procedure with parameter
Your third and final task is to create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.
Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the procedure parameter without typing the entire SQL delete statement.   
If you invoke the CancelOrder procedure, the output result should be similar to the output of the following screenshot:
*/

DELIMITER //

CREATE PROCEDURE CancelOrder(IN input_order_id INT)
BEGIN
    DELETE FROM little_lemon_sales.orders
    WHERE order_id = input_order_id;

    SELECT CONCAT('Order ', input_order_id, ' is cancelled.') AS confirmation_message;
END //

DELIMITER ;


-- CALL CancelOrder(10);
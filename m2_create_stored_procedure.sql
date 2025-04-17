use little_lemon_sales;
/*
Create stored procedure
In this first task, Little Lemon need you to create a procedure that displays the maximum ordered quantity in the Orders table. 
Creating this procedure will allow Little Lemon to reuse the logic implemented in the procedure easily without retyping the same code over again and again to check the maximum quantity. 
You can call the procedure GetMaxQuantity and invoke it as follows:
*/
CREATE PROCEDURE GetMaxQuantity()  
SELECT
	MAX(quantity) AS max_quantity
FROM orders;
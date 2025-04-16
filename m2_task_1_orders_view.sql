
/*
Task 1
In the first task, Little Lemon need you to create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 
Here’s some guidance around completing this task: 
Use a CREATE VIEW statement.
Extract the order id, quantity and cost data from the Orders table.
Filter data from the orders table based on orders with a quantity greater than 2. 
*/
CREATE VIEW little_lemon_sales.vw_OrdersView AS 

SELECT 
	order_id
    , quantity
    , bill_amount as cost
FROM orders
WHERE quantity > 2;
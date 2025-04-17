use little_lemon_sales;

/*
Create prepared statement
In the second task, Little Lemon need you to help them to create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.
The prepared statement should accept one input argument, the CustomerID value, from a variable. 
The statement should return the order id, the quantity and the order cost from the Orders table. 
Once you create the prepared statement, you can create a variable called id and assign it value of 1. 
Then execute the GetOrderDetail prepared statement using the following syntax:
*/
PREPARE GetOrderDetail FROM
'
SELECT
	o.order_id
    , o.quantity
    , o.bill_amount as cost
FROM orders AS o
INNER JOIN bookings AS b 
	ON o.booking_id = b.booking_id
WHERE b.customer_id = ?
'
;

SET @cust_id = 43;

EXECUTE GetOrderDetail USING @cust_id;

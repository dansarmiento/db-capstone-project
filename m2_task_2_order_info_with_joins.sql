use little_lemon_sales;
/*
Task 2
For your second task, Little Lemon need information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN clause: 
Customers table: The customer id and full name.
Orders table: The order id and cost.
Menus table: The menus name.
MenusItems table: course name and starter name.
The result set should be sorted by the lowest cost amount.
The output result of your query (depends on the data populated in your database) should be similar to the example in the following screenshot: 
*/

SELECT
	c.customer_id
    , CONCAT(c.customer_first_name, ' ', c.customer_last_name) AS customer_full_name
    , o.order_id
    , o.bill_amount AS cost
    , m.cuisine AS menu_name
    , mi.item_type
    , mi.item_name
FROM orders AS o
INNER JOIN bookings AS b 
	ON o.booking_id = b.booking_id
INNER JOIN customers AS c
	ON b.customer_id = c.customer_id
INNER JOIN menu AS m 
	ON o.menu_id = m.menu_id
INNER JOIN menu_items as mi
	ON m.menu_item_id = mi.menu_item_id
WHERE bill_amount > 150
ORDER BY bill_amount ASC;
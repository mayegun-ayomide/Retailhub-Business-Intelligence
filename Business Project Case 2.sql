--- BUSINESS CASE 2 : SALES PERFORMENCE ANALYSIS

--- TASK 1: Display all completed orders.
SELECT * from orders
WHERE order_status = 'Completed';

--- TASK 2: Display all cancelled orders.
SELECT * from orders
WHERE order_status = 'Cancelled';

---- TASK 3: Find the total number of orders.
SELECT COUNT(*) FROM orders;

--- TASK 4: Find total revenue from all orders.
SELECT SUM(net_amount) AS "Total Revenue"
FROM orders;

---- TASK 5: Find average order value.
SELECT AVG(net_amount) AS Average
FROM orders;

---- TASK 6: Find the highest order amount.
SELECT MAX(net_amount) AS "Highest Order"
FROM orders;

---- TASK 7: Find the lowest order amount.
SELECT MIN(net_amount) AS "Lowest Order"
FROM orders;

---- TASK 8: Display the 10 largest orders.
SELECT * FROM orders
ORDER BY net_amount DESC
LIMIT 10;

---- TASK 9: Find total discount given.
SELECT  order_status,
		SUM(discount_amount) AS "Total Discount"
FROM orders
GROUP BY order_status
ORDER BY "Total Discount" DESC;


---- TASK 10:  Display unique sales channels.
SELECT DISTINCT sales_channel 
FROM orders;

--- TASK 11:  Count orders by order status.
SELECT 	order_status,
		COUNT(order_id) AS "Total Order"
FROM orders
GROUP BY order_status
ORDER BY "Total Order" DESC;

---- TASK 12: Calculate revenue by sales channel.
SELECT 	sales_channel,
		SUM(net_amount) AS "Revenue"
FROM orders
GROUP BY sales_channel
ORDER BY "Revenue" DESC;

---- TASK 13: Calculate revenue by sales channel.
SELECT 	sales_channel,
		AVG(net_amount) AS "Average"
FROM orders
GROUP BY sales_channel
ORDER BY "Average" DESC;

---- TASK 14: Calculate revenue by store.
SELECT 	s.store_name,
		SUM(o.net_amount) AS "Revenue"
FROM stores s
JOIN orders o
ON s.store_id = o.store_id
GROUP BY s.store_name, o.order_status
HAVING o.order_status = 'Completed'
ORDER BY "Revenue" DESC;

---- TASK 15: Count orders handled by each store.
SELECT 	s.store_name,
		COUNT(*) AS "Total Order"
FROM stores s
JOIN orders o
ON s.store_id = o.store_id
GROUP BY s.store_name, o.order_status
HAVING o.order_status = 'Completed'
ORDER BY "Total Order" DESC;

---- TASK 16: Calculate average order value by store.
SELECT 	s.store_name,
		AVG(net_amount) AS "Average Order"
FROM stores s
JOIN orders o
ON s.store_id = o.store_id
GROUP BY s.store_name, o.order_status
HAVING o.order_status = 'Completed'
ORDER BY "Average Order" DESC;


--- TASK 17: Calculate total sales by employee.
SELECT	 e.first_name,
		 e.last_name,
		 SUM(o.net_amount) AS "Total Order"
FROM employees e
JOIN orders o
ON e.employee_id = o.employee_id
GROUP BY e.first_name, e.last_name,o.order_status
HAVING o.order_status = 'Completed'
ORDER BY "Total Order" DESC;

--- TASK 18: Find employees who processed more than 10 orders.
SELECT 	e.first_name,
		e.last_name,
		COUNT(o.order_id) AS "Total Order"
FROM employees e
JOIN orders o
ON e.employee_id = o.employee_id
GROUP BY e.first_name, e.last_name
HAVING COUNT(o.order_id)> 10
ORDER BY "Total Order" DESC;


--- TASK 19: Calculate quantity sold by product.
SELECT  p.product_name,
		p.brand,
		SUM(oi.quantity) AS "Total Quantity Sold"
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name, p.brand
ORDER BY "Total Quantity Sold" DESC;


---- TASK 20: Find top 10 products by quantity sold.
SELECT  p.product_name,
		p.brand,
		SUM(oi.quantity) AS "Total Quantity Sold"
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name, p.brand
ORDER BY "Total Quantity Sold" DESC
LIMIT 10;

---- TASK 21: Display orders with customer names.
SELECT  c.customer_id,
		c.first_name,
		c.last_name,
		o.order_date,
		o.sales_channel,
		o.total_amount,
		o.discount_amount,
		o.net_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id ASC;


----- TASK 22: Display products with category names.
SELECT 	p.product_name,
		p.brand,
		ca.category_name
FROM products p
JOIN categories ca
ON p.category_id = ca.category_id;


---- TASK 23: Display sales with store names.
SELECT 	s.store_name,
		SUM(o.net_amount) AS "Total Sales"
FROM stores s
JOIN orders o
ON s.store_id = o.store_id
GROUP BY s.store_name
ORDER BY "Total Sales" DESC;

---- TASK 24: Find revenue by product category.
SELECT  p.category_id,
	  	ca.category_name,
		SUM(oi.line_total) AS "Revenue"
FROM products p
LEFT JOIN categories ca
ON p.category_id = ca.category_id
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category_id, ca.category_name
ORDER BY "Revenue" DESC;

--- TASK 25: Find top 10 customers by total spending.
SELECT 	c.first_name,
		c.last_name,
		SUM(o.net_amount) AS "Total Amount Spent"
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY "Total Amount Spent" DESC
LIMIT 10;

--- TASK 26: Find customers who placed more than 5 orders.
SELECT 	c.last_name,
		c.first_name,
		COUNT(o.order_id) AS "Total Order"
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.last_name, c.first_name
HAVING COUNT(o.order_id) > 5
ORDER BY "Total Order" DESC;


---- TASK 27: Find the best-performing store by revenue.
SELECT 	s.store_name,
		SUM(o.net_amount) AS "Total Sales"
FROM stores s
JOIN orders o
ON s.store_id = o.store_id
GROUP BY s.store_name
ORDER BY "Total Sales" DESC
LIMIT 1;

--- TASK 28: Find the best-selling product.
SELECT 	p.product_name,
		SUM(oi.line_total) AS "Total"
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY "Total" DESC
LIMIT 1;



---- TASK 29: Find the employee with the highest sales value.
SELECT  e.last_name,
		e.first_name,
		SUM(o.net_amount) AS "Total"
FROM employees e
JOIN orders o
ON e.employee_id = o.employee_id
GROUP BY e.last_name, e.first_name
ORDER BY "Total" DESC
LIMIT 1;


---- TASK 30: Create a sales summary showing total orders, total revenue and average order value.
SELECT 	COUNT(order_id) AS "Total Orders",
		SUM(net_amount) AS "Total Revenue",
		AVG(net_amount) AS "Average Order Value"
FROM orders;

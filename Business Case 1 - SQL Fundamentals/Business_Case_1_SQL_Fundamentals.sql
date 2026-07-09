--- PROJECT 1 BUSINESS REQUESTS


--- TASK 1: Display all colums in the customers table
SELECT * FROM customers;

---- TASK 2: Display only first name, last name, email, and city from customers
SELECT  first_name,
		last_name,
		email,
		city
FROM customers;

---- TASK 3: List all products showing product name and unit price
SELECT  product_name,
	    unit_price
FROM products
ORDER BY unit_price DESC;

---- TASK 4: Find all customers who live in Lagos
SELECT * FROM customers
WHERE city = 'Lagos';

---- TASK 5: Display all completed orders
SELECT * FROM orders 
WHERE order_status = 'Completed';

---- TASK 6: Show all pending orders
SELECT * FROM orders
WHERE order_status = 'Pending';

---- TASK 7: Find all the products with unit price greater than 50000
SELECT * FROM products
WHERE unit_price > 50000;

----TASK 8: Dind products with stock quantity less than 20
SELECT * FROM products
WHERE stock_quantity < 20;

--- TASK 9: Display 10 most expensive products
SELECT * FROM products
ORDER BY unit_price DESC
LIMIT 10;

---- TASK 10: Display the 10 cheapest products
SELECT * FROM products
ORDER BY unit_price ASC
LIMIT 10;

--- TASK 11: Display all distinct customer segment
SELECT DISTINCT customer_segment
FROM customers;

--- TASK 12: Show all distinct sales channel
SELECT DISTINCT sales_channel
FROM ORDERS;

--- TASK 13: Count the total number of customers
SELECT COUNT(customer_id) AS "Total Customers"
FROM customers;

---- TASK 14: Count the total number of products
SELECT COUNT(product_id) AS "Total Product"
FROM products;

---- TASK 15: Count total number of orders
SELECT COUNT(order_id) AS "Total Order"
FROM orders;

---- TASK 16: Calculate the average product price
SELECT AVG(unit_price) AS "Average Price"
FROM products;

---- TASK 17: Find the highest product price
SELECT MAX(unit_price) AS "Highest Price"
FROM products;

---TASK 18: Find the lowest product price
SELECT MIN(unit_price) AS "Lowest Price"
FROM products;

---- TASK 19: Display all orders sorted by newest to oldest
SELECT * FROM orders
ORDER BY order_date DESC;

--- TASK 20: Display 15 customers ordered alphabetically by last name 
SELECT * FROM customers
ORDER BY last_name ASC;
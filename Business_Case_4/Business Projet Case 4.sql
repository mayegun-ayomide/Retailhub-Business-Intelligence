--- BUSINESS CASE 4: 

---- TASK 1: Warehouse storage costs have increased significantly over the past six months. Before approving additional warehouse space, management wants to know whether some products have occupied shelf space without generating any customer demand.
SELECT 	p.product_id,
		p.product_name,
		COUNT(oi.product_id) AS "Total Order"
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name,
		 p.product_id
HAVING COUNT(oi.product_id) = 0
ORDER BY p.product_id ASC;

----- TASK 2: The Procurement Department is preparing next quarter's purchasing plan. Before placing new orders with suppliers, identify products that have experienced the lowest customer demand to avoid overstocking.
SELECT 	p.product_id,
		p.product_name,
		SUM(oi.quantity) AS "Quantity",
		COUNT(oi.product_id) AS "Total Order"
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name,
		 p.product_id
HAVING COUNT(oi.product_id) > 5
ORDER BY "Total Order" ASC;



---- TASK 3: Some products sell out faster than others, causing frequent stock shortages. Management wants to know which products should receive priority during the next replenishment cycle
SELECT 	p.product_id,
		p.product_name,
		SUM(oi.quantity * oi.unit_price) AS "Revenue"
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name,
		 p.product_id
ORDER BY "Revenue" DESC;

---- TASK 4: Compare product movement with revenue before adjusting warehouse allocation.
SELECT 	p.product_id,
		p.product_name,
		SUM(oi.quantity * oi.line_total) AS "Revenue"
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id,
		 p.product_name
ORDER BY "Revenue" DESC;


---- TASK 5: Products should be grouped into performance bands before the next board meeting.
SELECT 	p.product_id,
		p.product_name,
		SUM(oi.quantity * oi.line_total) AS "Revenue",
	CASE
		WHEN SUM(oi.quantity * oi.line_total) >= 150000000 THEN 'High'
		WHEN SUM(oi.quantity * oi.line_total) >= 50000000 THEN 'Average'
		ELSE 'Low'
		END AS "Performance Level"
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id,
		 p.product_name
ORDER BY "Revenue" DESC;

---- TASK 6: Identify products that deserve additional inventory investment based on sales performance.
SELECT 	p.product_id,
		p.product_name,
		SUM(oi.quantity * oi.line_total) AS "Revenue"
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id,
		 p.product_name
ORDER BY "Revenue" DESC
LIMIT 12;

---- TASK 7: Recommend five products for possible discontinuation using historical sales performance.
SELECT 	p.product_id,
		p.product_name,
		SUM(oi.quantity * oi.line_total) AS "Revenue"
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id,
		 p.product_name
ORDER BY "Revenue" ASC
LIMIT 5;

--- TASK 8: 


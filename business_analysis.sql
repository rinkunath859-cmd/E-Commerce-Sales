#  Business Analysis
# Monthly Revenue
SELECT
MONTHNAME(o.order_date) AS month,
SUM(od.quantity*p.price) AS revenue
FROM orders o
JOIN orderdetails od
ON o.order_id=od.order_id
JOIN products p
ON od.product_id=p.product_id
GROUP BY MONTHNAME(o.order_date)
ORDER BY revenue DESC;
# Top Products
SELECT
p.name,
SUM(od.quantity*p.price) AS revenue
FROM products p
JOIN orderdetails od
ON p.product_id=od.product_id
GROUP BY p.name
ORDER BY revenue DESC
LIMIT 10;
# Best Selling Products
SELECT
p.name,
SUM(od.quantity) AS units_sold
FROM products p
JOIN orderdetails od
ON p.product_id=od.product_id
GROUP BY p.name
ORDER BY units_sold DESC;
# Top Categories
SELECT
p.category,
SUM(od.quantity*p.price) AS revenue
FROM products p
JOIN orderdetails od
ON p.product_id=od.product_id
GROUP BY p.category
ORDER BY revenue DESC;
# Top Cities
SELECT
c.location,
SUM(od.quantity*p.price) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN orderdetails od
ON o.order_id=od.order_id
JOIN products p
ON od.product_id=p.product_id
GROUP BY c.location
ORDER BY revenue DESC;
# Top Customers
SELECT
c.name,
SUM(od.quantity*p.price) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN orderdetails od
ON o.order_id=od.order_id
JOIN products p
ON od.product_id=p.product_id
GROUP BY c.name
ORDER BY revenue DESC
LIMIT 10;
# Sales by Category
SELECT
category,
SUM(od.quantity*p.price) AS revenue
FROM products p
JOIN orderdetails od
ON p.product_id=od.product_id
GROUP BY category;
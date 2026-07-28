# Validate Relationships

# Orders without customers
SELECT *
FROM orders o
LEFT JOIN customers c
ON o.customer_id=c.customer_id
WHERE c.customer_id IS NULL;

# Order details without orders
SELECT *
FROM orderdetails od
LEFT JOIN orders o
ON od.order_id=o.order_id
WHERE o.order_id IS NULL;

# Order details without products
SELECT *
FROM orderdetails od
LEFT JOIN products p
ON od.product_id=p.product_id
WHERE p.product_id IS NULL;

# Final Data Validation
SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM products;

SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM orderdetails;
#Exploratory Data Analysis (EDA)
# Total Revenue    
SELECT
SUM(od.quantity * p.price) AS total_revenue
FROM orderdetails od
JOIN products p
ON od.product_id = p.product_id;
# Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;
#Total Customers
SELECT COUNT(DISTINCT customer_id)
AS total_customers
FROM customers;
# Total Products
SELECT COUNT(*)
FROM products;
# Average Order Value
SELECT
ROUND(AVG(total_amount),2)
AS avg_order_value
FROM orders;
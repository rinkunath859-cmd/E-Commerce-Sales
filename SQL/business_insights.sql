# 1. Peak Sales Month
SELECT
    DATE_FORMAT(order_date, '%M %Y') AS sales_month,
    SUM(total_amount) AS total_revenue
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY total_revenue DESC
LIMIT 1;

/* Business Insight:

Identified the highest revenue-generating month to support seasonal inventory planning and marketing campaigns.*/
# 2. Top Revenue-Generating Products
SELECT
    p.name AS product_name,
    SUM(od.quantity * p.price) AS revenue
FROM orderdetails od
JOIN products p
ON od.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY revenue DESC
LIMIT 10;

/*Business Insight:

Identified the products generating the highest revenue, helping prioritize inventory and promotional efforts.*/
#3. Best-Selling Products by Quantity
SELECT
    p.name AS product_name,
    SUM(od.quantity) AS units_sold
FROM orderdetails od
JOIN products p
ON od.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY units_sold DESC
LIMIT 10;

/*Business Insight:

Highlighted products with the highest sales volume for stock planning and demand forecasting.*/
#4. Revenue by Product Category
SELECT
    p.category,
    SUM(od.quantity * p.price) AS revenue
FROM orderdetails od
JOIN products p
ON od.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

/*Business Insight:

Identified the most profitable product categories to guide pricing and merchandising strategies.*/
#5. Top Customer Locations
SELECT
    c.location,
    SUM(od.quantity * p.price) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN orderdetails od
ON o.order_id = od.order_id
JOIN products p
ON od.product_id = p.product_id
GROUP BY c.location
ORDER BY revenue DESC;

/*Business Insight:

Determined the highest-performing cities to optimize regional marketing and logistics.*/
#6. Top Customers by Revenue
SELECT
    c.name AS customer_name,
    SUM(od.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN orderdetails od
ON o.order_id = od.order_id
JOIN products p
ON od.product_id = p.product_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 10;

/*Business Insight:

Identified high-value customers for loyalty programs and personalized marketing.*/
#7. Average Order Value
SELECT
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders;

/*Business Insight:

Measured customer spending patterns to evaluate pricing and promotional strategies.*/
#8. Monthly Sales Trend
SELECT
    DATE_FORMAT(order_date, '%M %Y') AS month,
    SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY MIN(order_date);

/*Business Insight:

Analyzed monthly sales performance to identify growth trends and seasonal fluctuations.*/
#9. Customer Distribution by Location
SELECT
    location,
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY location
ORDER BY total_customers DESC;

/*Business Insight:

Revealed customer concentration across cities to support market expansion decisions.*/
#10. Product Distribution by Category
SELECT
    category,
    COUNT(product_id) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;

/*Business Insight:

Showed the distribution of products across categories, helping evaluate catalog balance.*/
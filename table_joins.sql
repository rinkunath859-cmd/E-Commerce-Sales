#JOIN the Tables
SELECT
    o.order_id,
    o.order_date,
    c.name AS customer_name,
    c.location,
    p.name AS product_name,
    p.category,
    od.quantity,
    p.price,
    (od.quantity * p.price) AS revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN orderdetails od
    ON o.order_id = od.order_id
JOIN products p
    ON od.product_id = p.product_id;
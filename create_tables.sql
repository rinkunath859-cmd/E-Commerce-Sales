-- ===========================================
-- Customers Table
-- ===========================================

CREATE TABLE customers (

    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)

);

-- ===========================================
-- Products Table
-- ===========================================

CREATE TABLE products (

    product_id INT PRIMARY KEY,
    name VARCHAR(200),
    category VARCHAR(100),
    price DECIMAL(10,2)

);

-- ===========================================
-- Orders Table
-- ===========================================

CREATE TABLE orders (

    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    total_amount DECIMAL(12,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)

);

-- ===========================================
-- Order Details Table
-- ===========================================

CREATE TABLE orderdetails (

    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)

);

-- ===========================================
-- Verify Tables
-- ===========================================

SHOW TABLES;
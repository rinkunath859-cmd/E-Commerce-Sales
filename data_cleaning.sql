# Clean customers Table
# View the data
SELECT * FROM customers;
# Count Total Records  
SELECT COUNT(*) AS total_customers
FROM customers;
#Check Table Structure
DESCRIBE customers;
# Check Duplicate Customer IDs
SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;
# Check Duplicate Customer Names
SELECT
    name,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY name
HAVING COUNT(*) > 1;
# Check for NULL Values
SELECT *
FROM customers
WHERE customer_id IS NULL
   OR name IS NULL
   OR location IS NULL;
# Check for Blank Values
SELECT *
FROM customers
WHERE name = ''
   OR location = '';
# Remove Leading & Trailing Spaces
UPDATE customers
SET
    name = TRIM(name),
    location = TRIM(location);
# Standardize Location Names
UPDATE customers
SET location = 'Delhi'
WHERE LOWER(location) = 'delhi';

UPDATE customers
SET location = 'Chennai'
WHERE LOWER(location) = 'chennai';

UPDATE customers
SET location = 'Pune'
WHERE LOWER(location) = 'pune';

UPDATE customers
SET location = 'Ahmedabad'
WHERE LOWER(location) = 'ahmedabad';

UPDATE customers
SET location = 'Lucknow'
WHERE LOWER(location) = 'lucknow';

UPDATE customers
SET location = 'Hyderabad'
WHERE LOWER(location) = 'hyderabad';

UPDATE customers
SET location = 'Kolkata'
WHERE LOWER(location) = 'kolkata';
# Verify Cleaned Data
SELECT *
FROM customers
ORDER BY customer_id;
# Count Customers by Location
SELECT
    location,
    COUNT(*) AS total_customers
FROM customers
GROUP BY location
ORDER BY total_customers DESC;    

# Clean products Table
SELECT * FROM products;
#Check Table Structure
DESCRIBE products;
# Count Total Products
SELECT COUNT(*) AS total_products
FROM products;
# Check Duplicate Product IDs
SELECT
    product_id,
    COUNT(*) AS duplicate_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;
# Check Duplicate Product Names
SELECT
    name,
    COUNT(*) AS duplicate_count
FROM products
GROUP BY name
HAVING COUNT(*) > 1;
# Check NULL Values 
SELECT *
FROM products
WHERE product_id IS NULL
   OR name IS NULL
   OR category IS NULL
   OR price IS NULL;
# Check Blank Values
SELECT *
FROM products
WHERE name = ''
   OR category = '';
# Remove Extra Spaces
UPDATE products
SET
    name = TRIM(name),
    category = TRIM(category);
# Check Invalid Prices    
SELECT *
FROM products
WHERE price <= 0;
#Check Price Range
SELECT
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price,
    AVG(price) AS average_price
FROM products;
# View Products by Category
SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;
DESCRIBE products;
SELECT *
FROM products
ORDER BY product_id;

# Clean orders Table
SELECT * FROM orders;
# Check Table Structure
DESCRIBE orders;
# Count Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;
 # Check Duplicate Order IDs
 SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;
# Check NULL Values
SELECT *
FROM orders
WHERE order_id IS NULL
   OR order_date IS NULL
   OR customer_id IS NULL
   OR total_amount IS NULL;
# Check for Blank Values
SELECT *
FROM orders
WHERE order_date = '';
#Check Invalid Order Amounts
SELECT *
FROM orders
WHERE total_amount <= 0;
# Check Date Range
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM orders;
#Check Customer IDs That Don't Exist
SELECT o.*
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
#Monthly Order Count
SELECT
    MONTHNAME(order_date) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY MONTHNAME(order_date)
ORDER BY total_orders DESC;
#Monthly Revenue
SELECT
    MONTHNAME(order_date) AS month,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY MONTHNAME(order_date)
ORDER BY revenue DESC;
# Verify the Cleaned Data
SELECT *
FROM orders
ORDER BY order_id;

# Clean orderdetails Table   
SELECT * FROM orderdetails;
#Check duplicates 
SELECT
order_id,
product_id,
COUNT(*)
FROM orderdetails
GROUP BY
order_id,
product_id
HAVING COUNT(*)>1;
# Check NULL values
SELECT *
FROM orderdetails
WHERE order_id IS NULL
OR product_id IS NULL;
# Check invalid quantity
SELECT *
FROM orderdetails
WHERE quantity<=0;
# Check invalid price
SELECT *
FROM orderdetails
WHERE price_per_unit<=0;
#Create revenue column
ALTER TABLE orderdetails
ADD revenue DECIMAL(10,2);
# Calculate revenue
UPDATE orderdetails
SET revenue=quantity*price_per_unit;
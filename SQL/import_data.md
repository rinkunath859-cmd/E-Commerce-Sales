Importing Data into MySQL
Step 1
Open MySQL Workbench.

Step 2
Select the database.

USE ecommerce_sales_db;
Step 3
Import Customers

Right-click customers

→ Table Data Import Wizard

Select

customers.csv

Click

Next → Next → Finish

Step 4
Import Products

Right-click

products

Import

products.csv

Step 5
Import Orders

Right-click

orders

Import

orders.csv

Step 6
Import Order Details

Right-click

orderdetails

Import

orderdetails.csv

Step 7
Verify Imported Data

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;

SELECT * FROM orderdetails;
Step 8
Verify Record Counts

SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM products;

SELECT COUNT(*) FROM orders;

SELECT COUNT(*) FROM orderdetails;
Step 9
Check Table Structure

DESCRIBE customers;

DESCRIBE products;

DESCRIBE orders;

DESCRIBE orderdetails;
All tables are now ready for data cleaning.

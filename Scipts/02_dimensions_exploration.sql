/*
===============================================================================
Exploring Dimension Tables
===============================================================================
Objective:
    - To examine the structure and contents of dimension tables.

SQL Concepts Applied:
    - DISTINCT to identify unique values  
    - ORDER BY to sort the results for better readability
===============================================================================
*/
-- Retrieve a list of unique countries from which customers originate
SELECT DISTINCT 
    country 
FROM gold.dim_customers
ORDER BY country;

-- Retrieve a list of unique categories, subcategories, and products
SELECT DISTINCT 
    category, 
    subcategory, 
    product_name 
FROM gold.dim_products
ORDER BY category, subcategory, product_name;

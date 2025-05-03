/*
===============================================================================
Comparative Part-to-Whole Analysis
===============================================================================
Objective:
    - To compare metrics or performance across different dimensions or time periods.
    - To assess variations between categories.
    - Useful for conducting A/B testing or regional performance comparisons.

SQL Functions Utilized:
    - SUM(), AVG(): Aggregate functions for comparison.
    - Window Functions: SUM() OVER() for cumulative totals.
===============================================================================
*/


-- Which categories contribute the most to overall sales?
WITH category_sales AS (
    SELECT
        p.category,
        SUM(f.sales_amount) AS total_sales
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.category
)
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100, 2) AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;

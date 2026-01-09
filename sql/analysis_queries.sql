/* =========================================================
   PROJECT: Chocolate Sales Analysis
   PURPOSE: Analyze sales performance, product efficiency,
            and regional contribution using SQL
   ========================================================= */

------------------------------------------------------------
-- Q1. Monthly Sales Trend
-- Objective:
-- Analyze revenue trend over time to identify growth patterns
------------------------------------------------------------
SELECT
    DATE_TRUNC('month', date) AS month,
    SUM(amount) AS total_revenue
FROM chocolate_sales
GROUP BY month
ORDER BY month;

------------------------------------------------------------
-- Q2. Top Products by Revenue
-- Objective:
-- Identify products that contribute the most to total revenue
------------------------------------------------------------
SELECT
    product,
    SUM(amount) AS total_revenue
FROM chocolate_sales
GROUP BY product
ORDER BY total_revenue DESC;

------------------------------------------------------------
-- Q3. Revenue by Country
-- Objective:
-- Determine key markets based on revenue contribution
------------------------------------------------------------
SELECT
    country,
    SUM(amount) AS total_revenue
FROM chocolate_sales
GROUP BY country
ORDER BY total_revenue DESC;

------------------------------------------------------------
-- Q4. Top Sales Person Performance
-- Objective:
-- Evaluate individual sales performance for benchmarking
------------------------------------------------------------
SELECT
    sales_person,
    SUM(amount) AS total_revenue
FROM chocolate_sales
GROUP BY sales_person
ORDER BY total_revenue DESC
LIMIT 10;

------------------------------------------------------------
-- Q5. Product Efficiency (Revenue per Box)
-- Objective:
-- Measure product profitability based on revenue per shipped box
------------------------------------------------------------
SELECT
    product,
    ROUND(SUM(amount) / SUM(boxes_shipped), 2) AS revenue_per_box
FROM chocolate_sales
GROUP BY product
ORDER BY revenue_per_box DESC;

------------------------------------------------------------
-- Q6. Business KPI Summary
-- Objective:
-- Provide overall business performance snapshot
------------------------------------------------------------
SELECT
    SUM(amount) AS total_revenue,
    SUM(boxes_shipped) AS total_boxes,
    ROUND(AVG(amount), 2) AS average_order_value
FROM chocolate_sales;

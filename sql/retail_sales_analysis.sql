
-- =====================================================
-- Project: Retail Sales Analytics
-- Database: retail_sales_analytics
-- Purpose: Business analysis using MySQL
-- =====================================================

USE retail_sales_analytics;

-- 1. Overall business performance
SELECT
    ROUND(SUM(sales_amount), 2) AS total_revenue,
    COUNT(*) AS total_orders,
    SUM(quantity) AS units_sold
FROM orders;

-- 2. Monthly sales trend
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    ROUND(SUM(sales_amount), 2) AS monthly_revenue,
    COUNT(*) AS total_orders,
    SUM(quantity) AS units_sold
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

-- 3. Sales performance by product category
SELECT
    p.category,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS units_sold,
    ROUND(SUM(o.sales_amount), 2) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 4. Top 10 products by revenue
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(o.quantity) AS units_sold,
    ROUND(SUM(o.sales_amount), 2) AS total_revenue,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 10;

-- 5. Top 10 customers by revenue
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS units_purchased,
    ROUND(SUM(o.sales_amount), 2) AS total_revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_revenue DESC
LIMIT 10;

-- 6. Revenue by city, including missing city values
SELECT
    COALESCE(NULLIF(TRIM(c.city), ''), 'Unknown') AS city,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS units_sold,
    ROUND(SUM(o.sales_amount), 2) AS total_revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY COALESCE(NULLIF(TRIM(c.city), ''), 'Unknown')
ORDER BY total_revenue DESC;

-- 7. Data quality: order ID uniqueness and sales calculation
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_order_ids,
    SUM(
        CASE
            WHEN ROUND(sales_amount, 2)
                 <> ROUND(quantity * unit_price, 2)
            THEN 1 ELSE 0
        END
    ) AS sales_calculation_mismatches
FROM orders;

-- 8. Data integrity: unmatched customer and product references
SELECT
    SUM(CASE WHEN c.customer_id IS NULL THEN 1 ELSE 0 END)
        AS unmatched_customers,
    SUM(CASE WHEN p.product_id IS NULL THEN 1 ELSE 0 END)
        AS unmatched_products
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
LEFT JOIN products p
    ON o.product_id = p.product_id;

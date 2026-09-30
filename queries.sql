USE ecommerce_sales;

-- 1. View all customers
SELECT * FROM customers;

-- 2. View all products
SELECT * FROM products;

-- 3. View sales with calculated revenue
SELECT
    s.sale_id,
    s.sale_date,
    p.product_name,
    s.quantity,
    p.unit_price,
    s.quantity * p.unit_price AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id;

-- 4. Total revenue
SELECT
    SUM(s.quantity * p.unit_price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id;

-- 5. Revenue by product
SELECT
    p.product_name,
    SUM(s.quantity) AS units_sold,
    SUM(s.quantity * p.unit_price) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;

-- 6. Revenue by category
SELECT
    p.category,
    SUM(s.quantity * p.unit_price) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 7. Top-selling products by quantity
SELECT
    p.product_name,
    SUM(s.quantity) AS total_units_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units_sold DESC;

-- 8. Customer spending
SELECT
    c.customer_name,
    SUM(s.quantity * p.unit_price) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- 9. Monthly revenue
SELECT
    DATE_FORMAT(s.sale_date, '%Y-%m') AS sales_month,
    SUM(s.quantity * p.unit_price) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY sales_month
ORDER BY sales_month;

-- 10. Average order value
SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        s.sale_id,
        SUM(s.quantity * p.unit_price) AS order_total
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY s.sale_id
) AS orders;

-- 11. Products with revenue above 10,000
SELECT
    p.product_name,
    SUM(s.quantity * p.unit_price) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING revenue > 10000
ORDER BY revenue DESC;

-- 12. Sales by city
SELECT
    c.city,
    SUM(s.quantity * p.unit_price) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.city
ORDER BY revenue DESC;

-- 13. Rank products by revenue
SELECT
    p.product_name,
    SUM(s.quantity * p.unit_price) AS revenue,
    RANK() OVER (ORDER BY SUM(s.quantity * p.unit_price) DESC) AS revenue_rank
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name;

-- 14. Highest-value sale
SELECT
    s.sale_id,
    s.sale_date,
    c.customer_name,
    p.product_name,
    s.quantity * p.unit_price AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
ORDER BY revenue DESC
LIMIT 1;

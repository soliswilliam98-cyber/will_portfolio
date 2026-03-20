-- E-commerce Database Analysis Queries

-- 1. Top-selling products
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- 2. Total revenue per month
SELECT DATE_TRUNC('month', o.order_date) AS month, SUM(o.total_amount) AS revenue
FROM orders o
GROUP BY month
ORDER BY month;

-- 3. Most profitable categories
SELECT p.category, SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 4. Average Order Value (AOV)
SELECT AVG(total_amount) AS avg_order_value
FROM orders;

-- 5. Top 5 customers by spending
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 6. Customers inactive in last 6 months
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING MAX(o.order_date) < CURRENT_DATE - INTERVAL '6 months';

-- 7. Customer acquisition by country
SELECT country, COUNT(*) AS customers
FROM customers
GROUP BY country
ORDER BY customers DESC;

-- 8. Low stock products
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 10
ORDER BY stock_quantity ASC;

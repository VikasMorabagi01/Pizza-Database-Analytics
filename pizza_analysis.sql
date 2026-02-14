
-- PIZZA SALES ANALYSIS SQL SOLUTIONS

-- BASIC
-- 1. Total number of orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- 2. Total revenue
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id;

-- 3. Highest priced pizza
SELECT pt.name, p.price
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

-- 4. Most common pizza size ordered
SELECT p.size, COUNT(*) AS order_count
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY order_count DESC
LIMIT 1;

-- 5. Top 5 most ordered pizza types
SELECT pt.name, SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;

-- INTERMEDIATE
-- 6. Total quantity by category
SELECT pt.category, SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_quantity DESC;

-- 7. Orders distribution by hour
SELECT HOUR(time) AS order_hour, COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_hour
ORDER BY order_hour;

-- 8. Category wise pizza distribution
SELECT pt.category, COUNT(*) AS total_orders
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;

-- 9. Average pizzas ordered per day
SELECT AVG(daily_total) AS avg_pizzas_per_day
FROM (
    SELECT order_date, SUM(od.quantity) AS daily_total
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY order_date
) t;

-- 10. Top 3 pizza types by revenue
SELECT pt.name, SUM(od.quantity * p.price) AS revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;

-- ADVANCED
-- 11. Percentage contribution to revenue
SELECT pt.name,
       SUM(od.quantity * p.price) * 100.0 /
       (SELECT SUM(od2.quantity * p2.price)
        FROM order_details od2
        JOIN pizzas p2 ON od2.pizza_id = p2.pizza_id) AS revenue_percentage
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue_percentage DESC;

-- 12. Cumulative revenue over time
SELECT o.order_date,
       SUM(od.quantity * p.price) AS daily_revenue,
       SUM(SUM(od.quantity * p.price)) OVER (ORDER BY o.order_date) AS cumulative_revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- 13. Top 3 pizza types by revenue for each category
SELECT *
FROM (
    SELECT pt.category, pt.name,
           SUM(od.quantity * p.price) AS revenue,
           RANK() OVER (PARTITION BY pt.category ORDER BY SUM(od.quantity * p.price) DESC) AS rnk
    FROM order_details od
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category, pt.name
) ranked
WHERE rnk <= 3;

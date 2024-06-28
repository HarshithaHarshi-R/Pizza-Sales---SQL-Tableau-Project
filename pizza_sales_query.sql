-- Total Revenue 
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales
-- Avg_order_value
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id),2) AS Average_order_value
FROM pizza_sales
-- Total_pizza_sold
SELECT SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
-- Total_order
SELECT COUNT(DISTINCT order_id) AS Total_order
FROM pizza_sales
-- Avg_pizza_per_order
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id),2) AS Avg_pizza_per_order
FROM pizza_sales
-- Daily Trend
SELECT DAYNAME(STR_TO_DATE(order_date,'%d-%m-%Y')) AS order_day,
       COUNT(DISTINCT order_id) AS daily_trend_of_orders
FROM pizza_sales
GROUP BY order_day
-- Hourly trend
SELECT HOUR(order_time) AS order_hours,SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);
-- Percentage of sales by pizza category
SELECT pizza_category, CAST(sum(total_price) * 100/ (SELECT sum(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS percentage_of_sales_Category
FROM pizza_sales
GROUP BY pizza_category
ORDER BY percentage_of_sales_Category DESC
-- Percentage of sales by pizza size
SELECT pizza_size, ROUND(SUM(total_price),2) AS Total_sales, ROUND(sum(total_price) * 100/ (SELECT SUM(total_price) FROM pizza_sales),2) AS percentage_of_sales_by_size
FROM pizza_sales
GROUP BY pizza_size
ORDER BY percentage_of_sales_by_size DESC
-- Total pizza sold by category
SELECT pizza_category, SUM(quantity) AS Total_pizza_sold, COUNT(DISTINCT order_id) AS Total_order
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_pizza_sold DESC
-- Top 5 best sellers by total pizza sold
SELECT pizza_name, SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizza_sold DESC
LIMIT 5
-- Bottom 5 sellers by total pizza sold
SELECT pizza_name, sum(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizza_sold
LIMIT 5
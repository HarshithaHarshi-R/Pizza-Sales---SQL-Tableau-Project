# Pizza Sales SQL & Tableau Project


![Pizza_sales ss](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/856a23f9-516d-4f5f-a00c-ca236d391b0b)



## Table of Contents

- [Project Overview](#project-overview)
- [Key Performance Indicator](#key-performance-indicator)
- [Data Source](#data-source)
- [Tools](#tools)
- [Questions](#questions)
- [SQL Query](#sql-query)
- [Findings](#findings)
  
### Project Overview

The purpose of this project is to analyze pizza sales data to gain insights into the performance of the pizza sales operations. We will examine various key performance indicators (KPIs), to understand sales trends, identify popular pizza items, analyze sales by different parameters such as size and category, and ultimately optimize our sales strategies to maximize revenue.

### Key Performance Indicator

1.	Total Revenue
2.	Average Order Value 
3.	Total Pizza Sold
4.	Total Orders
5.	Average Pizza per Order 

### Data Source

The dataset utilized for this analysis was sourced from [Kaggle](https://www.kaggle.com/datasets/nextmillionaire/pizza-sales-dataset)

### Tools

- MySQL - Data Analysis
- Tableau - Creating Report

### Questions

1.	What is the total revenue generated from pizza sales?
2.	What is the average order value?
3.	How many pizzas have been sold in total?
4.	How many orders have been placed in total?
5.	What is the average number of pizzas per order?
6.	How does the number of orders vary throughout the day?
7.	What percentage of total sales is contributed by each pizza category?
8.	What percentage of total sales is contributed by each pizza size?
9.	How many pizzas have been sold in each pizza category?
10.	What are the top 5 pizza items based on total quantity sold?
11.	What are the bottom 5 pizza items based on total quantity sold?

### SQL Query
1. Total Revenue 
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales

![image](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/940add08-3272-4650-9bf1-276b94249a3e)


2. Avg_order_value
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id),2) AS Average_order_value
FROM pizza_sales

![image](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/b4c517e7-ebf6-441e-a6cf-c1a0a1635c5b)



3. Total_pizza_sold
SELECT SUM(quantity) AS Total_pizza_sold
FROM pizza_sales

 ![image](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/5aa39af1-5de3-4c1c-a502-92b0d655374f)


 
4. Total_order
SELECT COUNT(DISTINCT order_id) AS Total_order
FROM pizza_sales

![image](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/07a12ea4-57e4-4691-9b06-39f090216622)



5. Avg_pizza_per_order
SELECT CAST(SUM(quantity) / COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS Avg_pizza_per_order
FROM pizza_sales

![image](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/5c76a4ea-e760-409e-92fb-9dcb3fc144b4)



6. Hourly trend
SELECT HOUR(order_time) AS order_hours,SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);

![image](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/e70802db-9bcd-45c7-9bea-ed4d75652fdf)



7. Percentage of sales by pizza category
SELECT pizza_category, CAST(sum(total_price) * 100/ (SELECT sum(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS percentage_of_sales_Category
FROM pizza_sales
GROUP BY pizza_category
ORDER BY percentage_of_sales_Category DESC

![image](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/6c89e8fe-725d-4adf-a5d2-bb38bc08fcd6)



8. Percentage of sales by pizza size
SELECT pizza_size, ROUND(SUM(total_price),2) AS Total_sales, ROUND(sum(total_price) * 100/ (SELECT SUM(total_price) FROM pizza_sales),2) AS percentage_of_sales_by_size
FROM pizza_sales
GROUP BY pizza_size
ORDER BY percentage_of_sales_by_size DESC

![image](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/46a5666d-f4b8-4668-874f-430e94e666d1)



9.Total pizza sold by category
SELECT pizza_category, sum(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_pizza_sold DESC

![image](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/eff85778-a489-4811-8193-bde241a57f0e)



10. Top 5 best sellers by total pizza sold
SELECT pizza_name, sum(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizza_sold DESC
LIMIT 5

![image](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/69eaf833-eabd-47a5-b511-67fafae2c2ee)



11. Bottom 5 sellers by total pizza sold
SELECT pizza_name, sum(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizza_sold
LIMIT 5

![image](https://github.com/HarshithaHarshi-R/Pizza-Sales---SQL-Tableau-Project/assets/168059578/cf89c7f6-3404-4b02-8168-037d5a6848e3)



### Findings:

Based on the findings from the analysis of the pizza sales data, several key insights emerge that provide a comprehensive understanding of the business performance. The total revenue generated is $817,860, with an average order value of $38.30. This figure indicates the average amount customers spend per order, highlighting the pricing dynamics and customer spending behavior.

A total of 49,574 pizzas were sold from 21,350 orders. The analysis reveals peak ordering hours between 11 AM - 2 PM, with the highest concentration of orders occurring from 12 PM to 1 PM and another peak observed in the evening from 5 PM to 7 PM. These insights into peak hours can inform staffing and inventory management strategies to optimize service during high-demand periods.

Analyzing the sales distribution by pizza category reveals that the Classic category stands out with the highest percentage of total sales at 26.91%, followed closely by Supreme (25.46%), Chicken (23.96%), and Veggie (23.68%). These percentages show clarity on customer preferences, guiding future marketing and menu development efforts toward the most popular choices.

Further insights into pizza sales by size indicate that large pizzas constitute the majority of sales, accounting for 45.89% of total sales and 375318 pizzas sold. Medium-sized pizzas followed at 30.49% of total sales and 249382 pizzas sold.  This breakdown indicates a clear preference among customers for larger pizza sizes, possibly influenced by group orders or promotional pricing strategies on larger-size pizzas.

The top 5 best-selling pizzas in terms of pizza sold include The Classic Deluxe Pizza, The Barbecue Chicken Pizza, The Hawaiian Pizza, The Pepperoni Pizza, and The Thai Chicken Pizza, reflecting the popularity of these flavors among customers. Conversely, the bottom 5 - sellers include The Brie Carre Pizza, The Mediterranean Pizza, The Calabrese Pizza, The Spinach Supreme Pizza, and The Soppressata Pizza, presenting opportunities for menu adjustments or targeted promotions to boost sales of less popular items.

In conclusion, these findings provide a comprehensive snapshot of the pizza restaurant's operational performance, sales trends, and customer preferences. Leveraging this data can drive strategic decisions to enhance revenue, optimize menu offerings, and improve customer satisfaction.	

<--- 1. Total Sales & Profit ---> 

 SELECT 
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM orders;

<--- 2. Monthly Sales Trend ---> 

 SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(sales),2) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

<--- 3. Top 10 Products by Sales ---> 

 SELECT 
    product_name,
    ROUND(SUM(sales),2) AS total_sales
FROM orders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

<--- 4. Region-wise Performance ---> 

  SELECT 
    region,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit
FROM orders
GROUP BY region;

<--- 5. Profit Margin by Category ---> 

  SELECT 
    category,
    ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin
FROM orders
GROUP BY category;

<--- 6. High Discount – Low Profit Products ---> 

 SELECT 
    product_name,
    AVG(discount) AS avg_discount,
    ROUND(SUM(profit),2) AS total_profit
FROM orders
GROUP BY product_name
HAVING avg_discount > 0.3 AND total_profit < 0
ORDER BY total_profit;


  
 


  
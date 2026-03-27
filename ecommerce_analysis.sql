USE ecommerce_project;

-- ১. Total Overview
SELECT 
    ROUND(SUM(Sales), 2)  AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(Order_ID)       AS Total_Orders
FROM professional_ecommerce_data_project1;

-- ২. Top 5 Sub-Categories (Profit অনুযায়ী)
SELECT 
    Sub_Category,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM professional_ecommerce_data_project1
GROUP BY Sub_Category
ORDER BY Total_Profit DESC
LIMIT 5;

-- ৩. Monthly Sales Trend
SELECT 
    YEAR(Order_Date)     AS Year,
    MONTH(Order_Date)    AS Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM professional_ecommerce_data_project1
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;

-- ৪. Discount Impact (২০%-এর বেশি ডিসকাউন্টে গড় প্রফিট)
SELECT 
    ROUND(AVG(Profit), 2) AS Avg_Profit_High_Discount
FROM professional_ecommerce_data_project1
WHERE Discount > 0.20;

-- ৫. Region-wise Performance
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM professional_ecommerce_data_project1
GROUP BY Region
ORDER BY Total_Sales DESC;
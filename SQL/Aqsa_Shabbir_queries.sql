-- 1. Total Sales and Profit by Product Category
SELECT 
  p.Category,
  SUM(f.Total_Sales) AS Total_Sales,
  SUM(f.Total_Profit) AS Total_Profit
FROM FactSales f
JOIN DimProduct p ON f.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Sales DESC;

-- 2. Top 10 Best-Selling Products by Quantity
SELECT 
  p.Product_Name,
  SUM(f.Quantity) AS Total_Units_Sold
FROM FactSales f
JOIN DimProduct p ON f.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Units_Sold DESC
LIMIT 10;


-- 3. Average Order Value by Channel
SELECT 
  o.Order_Mode,
  ROUND(SUM(f.Total_Sales) / COUNT(DISTINCT f.Order_ID), 2) AS Avg_Order_Value
FROM FactSales f
JOIN DimOrder o ON f.Order_ID = o.Order_ID
GROUP BY o.Order_Mode;

-- 4. Customer Profit Contribution (Top 10 Customers)
SELECT 
  f.Customer_ID,
  COUNT(DISTINCT f.Order_ID) AS Orders,
  SUM(f.Total_Sales) AS Revenue,
  SUM(f.Total_Profit) AS Profit
FROM FactSales f
GROUP BY f.Customer_ID
ORDER BY Profit DESC
LIMIT 10;

-- 5. Category Performance Over Time
SELECT 
  TO_CHAR(o.Order_Date, 'YYYY-MM') AS Month,
  p.Category,
  SUM(f.Total_Sales) AS Revenue
FROM FactSales f
JOIN DimOrder o ON f.Order_ID = o.Order_ID
JOIN DimProduct p ON f.Product_ID = p.Product_ID
GROUP BY Month, p.Category
ORDER BY Month, Revenue DESC;
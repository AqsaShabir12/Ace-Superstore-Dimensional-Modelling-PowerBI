-- vw_product_seasonality: Product performance trends over time
CREATE VIEW vw_product_seasonality AS
SELECT
  TO_CHAR(o.Order_Date, 'YYYY-MM') AS Month,
  p.Product_ID,
  p.Product_Name,
  SUM(f.Quantity) AS Total_Units_Sold,
  SUM(f.Total_Sales) AS Total_Revenue
FROM FactSales f
JOIN DimOrder o ON f.Order_ID = o.Order_ID
JOIN DimProduct p ON f.Product_ID = p.Product_ID
GROUP BY Month, p.Product_ID, p.Product_Name
ORDER BY Month, Total_Revenue DESC;
select * from vw_product_seasonality;

-- vw_discount_impact_analysis: Correlation between discounts and profits
CREATE VIEW vw_discount_impact_analysis AS
SELECT
  ROUND(f.Discount, 2) AS Discount_Rate,
  COUNT(*) AS Num_Transactions,
  SUM(f.Total_Sales) AS Total_Revenue,
  SUM(f.Profit) AS Total_Profit,
  ROUND(AVG(f.Profit), 2) AS Avg_Profit_Per_Transaction
FROM FactSales f
GROUP BY Discount_Rate
ORDER BY Discount_Rate;
select * from vw_discount_impact_analysis;

-- vw_channel_margin_report: Profitability comparison across online vs in-store
CREATE VIEW vw_channel_margin_report AS
SELECT
  o.Order_Mode,
  COUNT(*) AS Transactions,
  SUM(f.Total_Sales) AS Total_Revenue,
  SUM(f.Total_Profit) AS Total_Profit,
  ROUND(SUM(f.Total_Profit) / NULLIF(SUM(f.Total_Sales), 0), 4) AS Profit_Margin
FROM FactSales f
JOIN DimOrder o ON f.Order_ID = o.Order_ID
GROUP BY o.Order_Mode;
select * from vw_channel_margin_report;
-- Dimension for Products
CREATE TABLE DimProduct (
  Product_ID VARCHAR(100) PRIMARY KEY,
  Product_Name TEXT,
  Category VARCHAR(100),
  Sub_Category VARCHAR(100),
  Segment VARCHAR(100)
);

-- Dimension for Orders
CREATE TABLE DimOrder (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Order_Date DATE,
    Order_Mode VARCHAR(20)
);
-- Fact Table
CREATE TABLE FactSales (
    Customer_ID VARCHAR(20),
    Order_ID VARCHAR(20),
    Product_ID VARCHAR(40),
    Sales DECIMAL(10, 2),
    Cost_Price DECIMAL(10, 3),
    Quantity INT,
    Discount DECIMAL(4, 2),
    Discount_Amount DECIMAL(10, 4),
    Total_Sales DECIMAL(10, 2),
    Total_Cost DECIMAL(10, 3),
    Profit DECIMAL(10, 3),
    Total_Profit DECIMAL(10, 3),
    FOREIGN KEY (Order_ID) REFERENCES DimOrder(Order_ID),
	FOREIGN KEY (Product_ID) REFERENCES DimProduct(Product_ID)
);